import type { ProductType } from '../../../types/products';
import './ProductItem.scss';
import type { CartItemType } from '../../../types/carts';

const ProductItem = ({ product, setCart, cartItem }: 
    { product: ProductType, 
        setCart: React.Dispatch<React.SetStateAction<CartItemType[]>>, 
        cartItem: CartItemType | undefined }) => {


    const addToCart = () => {

            // Versione meno pulita
            // setCart((prevCart) => {
            //     prevCart.push({
            //         id: product.id,
            //         quantity: 1
            //     });
            //     return [...prevCart];
            // });

            // Se è nel carrello
            if(cartItem) {
                // Ciclo il prevCart
                setCart((prevCart) => prevCart.map((item) => {
                    // Se l'id dell'item è uguale a quello del prodotto
                    if(item.id === product.id) {
                        // Incremento la quantità
                        item.quantity++;
                    }
                    // Ritorno l'item aggiornato
                    return item;
                }));

            // Se non è nel carrello
            } else {
                // Alternativa più pulita
                setCart((prevCart) => [...prevCart, {
                    id: product.id,
                    // Quantità incrementale tramite controllo se l'item esiste già nel carrello
                    quantity: 1,
                }]);
             }

            // alert(`Product "${product.title}" is in the cart.`);
        };

    return (
        <div className="product">
        <img src={product.image} alt={product.title} />
        <p>{product.title}</p>
        <p>{product.price}</p>
        <p>{product.description}</p>
        <button onClick={addToCart}>{cartItem ? `Added to cart (${cartItem?.quantity})` : 'Add to cart'}</button>
        </div>
    );
};

export default ProductItem;
