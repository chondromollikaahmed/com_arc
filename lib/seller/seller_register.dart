import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_arc/helper/ca_snackbar.dart';
import 'package:com_arc/helper/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _nameController = TextEditingController();

class SellerRegister extends StatefulWidget {
  @override
  State<SellerRegister> createState() => _SellerRegisterState();
}

class _SellerRegisterState extends State<SellerRegister> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  XFile? _image;
  dynamic _imageError;

  bool processing = false;

  late String storeName;
  late String email;
  late String password;
  late String storeLogo;
  bool passwordVisible = false;

  CollectionReference sellers =
      FirebaseFirestore.instance.collection('sellers');

  void signUpEmailPassword() async {
    if (_formKey.currentState!.validate()) {
      if (_image == null) {
        CA_SnackBar.showSnackBar(_scaffoldKey, "Please Select Image");
      } else {
        setState(() {
          processing = true;
        });

        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          print(userCredential.user!.email);
          print(userCredential.user!.uid);
          CA_SnackBar.showSnackBar(_scaffoldKey, "User Created Successfully");

          Reference ref =
              FirebaseStorage.instance.ref('/cust_images/$email.jpg');

          await ref.putFile(File(_image!.path));

          storeLogo = await ref.getDownloadURL();

          sellers.doc(userCredential.user!.uid).set({
            'storeName': storeName,
            'email': email,
            'storeLogo': storeLogo,
            'phone': '',
            'address': '',
            'sid': userCredential.user!.uid,
            'coverImage': '',
          });

          _formKey.currentState!.reset();
          setState(() {
            _image = null;
            processing = false;
          });

          Navigator.pushReplacementNamed(context, '/seller/login');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            CA_SnackBar.showSnackBar(
                _scaffoldKey, "The password provided is too weak.");
          } else if (e.code == 'email-already-in-use') {
            CA_SnackBar.showSnackBar(
                _scaffoldKey, "The account already exists for that email.");
          }

          setState(() {
            processing = false;
          });
        } catch (e) {
          print(e);
        }
      }
    } else {
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all the fields'),));
      CA_SnackBar.showSnackBar(_scaffoldKey, "please fill all the fields");
    }
  }

  void pickImage() async {
    try {
      final pickedImage = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          maxHeight: 300,
          maxWidth: 300,
          imageQuality: 95);

      setState(() {
        _image = pickedImage;
      });
    } catch (e) {
      setState(() {
        _imageError = e;
      });

      print(_imageError);
    }
  }



  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        backgroundColor: Color(0xffa6b8f6),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 30, 16, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/');
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                          child: Icon(
                            Icons.home_filled,
                            color: Color(0xffffffff),
                            size: 24,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "Home",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      const Text(
                        "Sign Up",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                  padding: const EdgeInsets.all(0),
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0)),
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 60, 16, 16),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TextFormField(
                              onChanged: (value) {
                                storeName = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter Store Name';
                                }
                                return null;
                              },
                              //controller: TextEditingController(text: "Chondromollika Ahmed"),
                              obscureText: false,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                              decoration: InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                labelText: "Store Name",
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  color: Color(0xff000000),
                                ),
                                hintText: "ca store",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Colors.blueGrey,
                                ),
                                filled: true,
                                fillColor: Color(0xffffffff),
                                isDense: false,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                prefixIcon: Icon(Icons.person,
                                    color: Color(0xff000000), size: 24),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                              child: TextFormField(
                                onChanged: (value) {
                                  email = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Your Email';
                                  } else if (value.isValidEmail() == false) {
                                    return 'Please enter a valid Email';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                //  controller: TextEditingController(text: "chondromollikaahmed@gmail.com"),
                                obscureText: false,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                ),
                                decoration: InputDecoration(
                                  disabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        color: Color(0xff000000), width: 1),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        color: Color(0xff000000), width: 1),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        color: Color(0xff000000), width: 1),
                                  ),
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16,
                                    color: Color(0xff000000),
                                  ),
                                  hintText: "chondromollikaahmed@gmail.com",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    color: Colors.blueGrey,
                                  ),
                                  filled: true,
                                  fillColor: Color(0xffffffff),
                                  isDense: false,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  prefixIcon: Icon(Icons.mail,
                                      color: Color(0xff000000), size: 24),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                              child: TextFormField(
                                onChanged: (value) {
                                  password = value;
                                },

                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Password';
                                  }
                                  return null;
                                },

                                //controller: TextEditingController(text: "12345678"),
                                obscureText: passwordVisible,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                ),
                                decoration: InputDecoration(
                                    disabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                          color: Color(0xff000000), width: 1),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                          color: Color(0xff000000), width: 1),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                          color: Color(0xff000000), width: 1),
                                    ),
                                    labelText: "Password",
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                      color: Color(0xff000000),
                                    ),
                                    hintText: "ChAhmed@082",
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      color: Colors.blueGrey,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xffffffff),
                                    isDense: false,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    prefixIcon: Icon(Icons.visibility_off,
                                        color: Color(0xff000000), size: 24),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          passwordVisible = !passwordVisible;
                                        });
                                      },
                                      icon: Icon(
                                          passwordVisible
                                              ? Icons.remove_red_eye
                                              : Icons.remove_red_eye_outlined,
                                          color: Color(0xff000000),
                                          size: 24),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: processing == true
                                  ? Center(
                                      child: const CircularProgressIndicator())
                                  : MaterialButton(
                                      onPressed: () {
                                        signUpEmailPassword();
                                      },
                                      color: Color(0xff3a57e8),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: BorderSide(
                                            color: Color(0xffffffff), width: 1),
                                      ),
                                      padding: EdgeInsets.all(16),
                                      child: Text(
                                        "SIGN UP",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                      textColor: Color(0xffffffff),
                                      height: 45,
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                    ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    "Already have an account?",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, '/login');
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(
                                        "Login",
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                          color: Color(0xff3a57e8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: InkWell(
                    onTap: () {
                      pickImage();
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: _image == null
                            ? null
                            : FileImage(File(_image!.path)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
