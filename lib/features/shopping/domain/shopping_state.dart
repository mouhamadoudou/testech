class ShoppingState {
  final List<String> products;

  const ShoppingState(this.products);
  const ShoppingState.initial() : products = const ["Sabre", "Couteau"];

  ShoppingState copyWith({List<String>? products}) {
    return (
      ShoppingState(products ?? this.products)
    );
  }
}