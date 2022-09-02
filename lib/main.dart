import 'package:com_arc/Customer/components/orders.dart';
import 'package:com_arc/Customer/components/wishlist.dart';
import 'package:com_arc/customs/com_arc_customs.dart';
import 'package:com_arc/screeen_seller/Components/Balances.dart';
import 'package:com_arc/screeen_seller/Components/EditProfile.dart';
import 'package:com_arc/screeen_seller/Components/ManageProduct.dart';
import 'package:com_arc/screeen_seller/Components/MyStore.dart';
import 'package:com_arc/screeen_seller/Components/Orders.dart';
import 'package:com_arc/screeen_seller/Components/Statics.dart';
import 'package:com_arc/screens/cart.dart';
import 'package:com_arc/screens/home.dart';
import 'package:com_arc/screens_main/customer_home.dart';
import 'package:com_arc/screens_main/seller_home.dart';
import 'package:com_arc/seller/seller_login.dart';
import 'package:com_arc/seller/seller_register.dart';
import 'package:com_arc/temp/About.dart';
import 'package:com_arc/temp/CustomerSetting.dart';
import 'package:com_arc/temp/ForgotPassword.dart';
import 'package:com_arc/temp/ProductDetails.dart';
import 'package:com_arc/temp/verificationOTP.dart';
import 'package:com_arc/welcome/Register.dart';
import 'package:com_arc/welcome/login.dart';
import 'package:com_arc/welcome/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'chondro/cgj.dart';


void main() async
{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(

      //home : OnboardingWidget(),
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingWidget(),
        '/login': (context) =>login(),
        '/customer_home': (context) =>const  CustomerHome(),
        '/seller_home': (context) => const SellerHome(),
        '/register': (context) => Register(),

        '/seller/login': (context) =>SellerLogin(),
        '/seller/register': (context) =>SellerRegister(),
        '/seller/mystore': (context) => const MyStore(),
        '/seller/orders': (context) => const Orders(),
        '/seller/editprofile': (context) => const EditProfile(),
        '/seller/manageproduct': (context) => const ManageProducts(),
        '/seller/balances': (context) => const Balances(),
        '/seller/statics': (context) => const Statics(),

        '/customer/wishlist': (context) => const CustomerWishList(),
        '/customer/orders': (context) => const CustomerOrders(),
        '/customer/cart': (context) => const CartScreen(),
        '/customer/profile/cart': (context) => const CartScreen(back: ComArcBackButton(),),
        '/customer/forgot': (context) =>  ForgotPassword(),

    '/customer/home':(context) => const HomeScreen(),
    '/customer/details':(context) =>  ProductDetails(),
    '/otp':(context) =>  verificationOTP(),
    '/customer/setting':(context) =>  CustomerSetting(),
    '/support':(context) =>  About(),

      },
      debugShowCheckedModeBanner: false,
    );
  }
}

