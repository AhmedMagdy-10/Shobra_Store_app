class CartItemModel {
  final int productId;
  final String title;
  final double price;
  final String image;
  final String category;
  int quantity;

  CartItemModel({
    required this.productId,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
    required this.category,
  });

  double get totalPrice => price * quantity;
}
