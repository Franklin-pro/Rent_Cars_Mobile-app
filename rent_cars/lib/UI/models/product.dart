class Product {
  final String id;
  final String productName;
  final String imageUrl;
  final String description;
  final String rentPrice;
  final bool isFavorited;

  Product({
    required this.id,
    required this.imageUrl,
    required this.productName,
    required this.description,
    required this.rentPrice,
    required this.isFavorited,
  });

  // Convert JSON to User
  factory Product.fromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'],
    imageUrl: json['imageUrl'],
    productName: json['productName'],
    description: json['description'],
    rentPrice: json['rentPrice'],
    isFavorited: false,
  );
}


  // Convert User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageurl':imageUrl,
      'productName': productName,
      'description': description,
      'rentPrice': rentPrice,
    };
  }

  // Static list of products
  static List<Product> productList = [
    Product(
      id: '1',
      imageUrl: 'assets/images/honda.png',
      productName: 'Honda Civic',
      description: 'A nice sedan for rent',
      rentPrice: '50/day',
      isFavorited: false,
    ),
    Product(
      id: '2',
      imageUrl: 'assets/images/rem.png',
      productName: 'Lamborghini',
      description: 'Luxury sports car',
      rentPrice: '200/day',
      isFavorited: false,
    ),
        Product(
      id: '3',
      imageUrl: 'assets/images/anv.png',
      productName: 'ferari',
      description: 'Luxury sports car',
      rentPrice: '300/day',
      isFavorited: false,
    ),
    // Add more products as needed
  ];
}
