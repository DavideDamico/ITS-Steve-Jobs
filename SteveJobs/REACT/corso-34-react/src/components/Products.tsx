import { useEffect, useState } from 'react';
import type { ProductType } from '../types/products';
import Product from './Product/Product';

const Products = () => {
    const [products, setProducts] = useState<ProductType[]>([]);

    const getProducts = async () => {
        const response = await fetch('https://fakestoreapi.com/products');
        const data = await response.json();
        
        setProducts(data);
    };

    useEffect(() => {
        getProducts();
    }, []);

    return (
        <section>
            <h2>Products List:</h2>

            <ul>
                {products.map((product: ProductType) => {
                    return (
                        <Product key={product.id} product={product} />
                    )
                })}
            </ul>
        </section>
    );
};

export default Products;