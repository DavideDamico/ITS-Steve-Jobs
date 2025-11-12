import { useEffect, useState } from 'react';
import type { ProductType } from '../../../types/products';
import Loader from '../../Loader';
import ProductItem from '../ProductItem/ProductItem';
import type { CartItemType } from '../../../types/carts';

const Products = () => {
    const [products, setProducts] = useState<ProductType[]>([]);

    const [cart, setCart] = useState<CartItemType[]>([]);

    const getProducts = () => {
        setProducts([]);

        setTimeout(async () => { 
            const response = await fetch('https://fakestoreapi.com/products');
            const data = await response.json();
            
            setProducts(data);
        }, 1000);
    };

    useEffect(() => {
        getProducts();
    }, []);

    return (
        <section>
            <h2>Products List:</h2>

            <button onClick={getProducts}>Reload Products</button>

            {products && products.length ? 
            <div className = "products-list-container">
                {products.map((product: ProductType) => {
                    return (
                        <ProductItem 
                        key={product.id}
                        product={product}
                        setCart={setCart}
                        cartItem={cart.find(
                            (item: CartItemType) => item.id === product.id)}
                         />
                    )
                })}
            </div> 
            : <Loader />}
        </section>
    );
};

export default Products;