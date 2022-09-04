import 'package:com_arc/provider/product_class.dart';
import 'package:flutter/material.dart';



class Cart extends ChangeNotifier
{

   final List<Product> _cartItems = [];

   List<Product> get cartItems => _cartItems;


   int get cartItemsCount => _cartItems.length;

   double get totalAmount{
     double total = 0;
     _cartItems.forEach((element) {
       total += element.price * element.qty;
     });
     return total;
   }


   void addItem(String name, double price,int qty, int quantity, List imageUrls, String documentId, String sellerId)
   {

     final product =Product(name: name, price: price,qty: qty, quantity: quantity, imageUrls: imageUrls, documentId: documentId, sellerId: sellerId );

      _cartItems.add(product);
     notifyListeners();
   }



   void increment(Product product){
     product.incrementQty();
     notifyListeners();
   }

   void decrement(Product product){
     product.decrementQty();
     notifyListeners();
   }


   void removeItem(Product product){
     _cartItems.remove(product);
     notifyListeners();
   }

   void clearCart(){
     _cartItems.clear();
     notifyListeners();
   }

}