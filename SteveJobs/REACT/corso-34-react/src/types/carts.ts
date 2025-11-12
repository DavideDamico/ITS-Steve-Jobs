import type { ProductType } from "./products";

export interface CartItemType extends Partial<ProductType> {
    quantity: number;
}
