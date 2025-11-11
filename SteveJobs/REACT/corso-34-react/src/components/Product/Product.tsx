import type { ProductType } from '../../types/products';
import './Product.scss';

const Product = ({ product }: { product: ProductType }) => {
  return (
    <li className="product">
      <p>{product.title}</p>
      <p>{product.price}</p>
    </li>
  );
};

export default Product;
