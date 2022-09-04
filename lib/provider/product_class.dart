class Product {

  String name ;
  double price ;
  int qty=1;
  int quantity ;
  List imageUrls;

  String documentId;
  String sellerId;


  Product({required this.name, required this.price,required this.qty, required this.quantity, required this.imageUrls, required this.documentId, required this.sellerId});


  void incrementQty(){
    qty++;
  }

  void decrementQty(){
    qty--;
  }
}
