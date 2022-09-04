import 'package:com_arc/provider/product_class.dart';
import 'package:flutter/foundation.dart';




class WishList extends ChangeNotifier
{

  final List<Product> _wishItems = [];

  List<Product> get wishItems => _wishItems;


  int get wishItemsCount => _wishItems.length;

  double get totalAmount{
    double total = 0;
    _wishItems.forEach((element) {
      total += element.price * element.qty;
    });
    return total;
  }


  void addWishItem(String name, double price,int qty, int quantity, List imageUrls, String documentId, String sellerId)
  {

    final product =Product(name: name, price: price,qty: qty, quantity: quantity, imageUrls: imageUrls, documentId: documentId, sellerId: sellerId );

    _wishItems.add(product);
    notifyListeners();
  }





  void removeItem(Product product){
    _wishItems.remove(product);
    notifyListeners();
  }

  void clearWishList(){
    _wishItems.clear();
    notifyListeners();
  }

  void removeThis(String documentId){
    _wishItems.removeWhere((element) => element.documentId == documentId);
    notifyListeners();
  }

}