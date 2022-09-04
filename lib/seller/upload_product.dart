import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_arc/helper/ca_snackbar.dart';
import 'package:com_arc/helper/screen_details.dart';
import 'package:com_arc/temp_list/temp_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart' as Path;
import 'package:uuid/uuid.dart';

class UploadProduct extends StatefulWidget {
  const UploadProduct({Key? key}) : super(key: key);

  @override
  State<UploadProduct> createState() => _UploadProductState();
}

class _UploadProductState extends State<UploadProduct> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  late String productName;
  late String productDescription;
  late double productPrice;
  String productCategory='men';
  late String productImage;
  late int productQuantity;


  bool processing = false;


  late String productId;

  List<String> imageUrls = [];


  String subCategory = '';

  int index = 0;
  int index2 = 0;

  void clearImage() {
    setState(() {
      imageFiles = [];
    });
  }

  Widget PreviewImages() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageFiles!.length,
        itemBuilder: (context, index) {
          return Image.file(
            File(imageFiles![index].path),
            fit: BoxFit.cover,
          );
        });
  }

  List<XFile>? imageFiles = [];
  dynamic _imageError;

  void pickProductImages() async {
    try {
      final pickedImages = await ImagePicker()
          .pickMultiImage(maxHeight: 300, maxWidth: 300, imageQuality: 95);

      setState(() {
        imageFiles = pickedImages!;
      });
    } catch (e) {
      setState(() {
        _imageError = e;
      });

      print(_imageError);
    }
  }

  void Upload() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (imageFiles!.isEmpty) {
        CA_SnackBar.showSnackBar(
            _scaffoldKey, 'Please select atleast one image');
      } else {

        setState(() {
          processing = true;
        });

        try {
          for (var image in imageFiles!) {
                    Reference ref = FirebaseStorage.instance
                        .ref('products/${Path.basename(image.path)}');

                    await ref.putFile(File(image.path)).whenComplete(() async {
                      await ref.getDownloadURL().then((value) {
                        imageUrls.add(value);
                      });
                    });
                  }




            CollectionReference products = FirebaseFirestore.instance.collection('products');
           productId= const  Uuid().v4();
            await products.doc(productId).set({
              'productId': productId,
              'productName': productName,
              'productDescription': productDescription,
              'productPrice': productPrice,
              'productCategory': productCategory,
              'SubCategory': subCategory,
              'productImages': imageUrls,
              'inStock': productQuantity,
              'sid': FirebaseAuth.instance.currentUser!.uid,
              'discount': 0,
            }).whenComplete(() {
              CA_SnackBar.showSnackBar(_scaffoldKey, 'Product Uploaded');
            });



          setState(() {
            imageFiles!.clear();
            imageUrls.clear();
            processing = false;
          });
          _formKey.currentState!.reset();
        }
        catch (e)
        {

          setState(() {
            imageUrls.clear();
            processing = false;
          });
          print(e);

          CA_SnackBar.showSnackBar(_scaffoldKey, 'Something went wrong');
        }

      }
      // print(productImage);
      //CA_SnackBar.showSnackBar(_scaffoldKey, 'Product Uploaded Successfully');
    } else
      CA_SnackBar.showSnackBar(_scaffoldKey, 'Please Fill All Fields');
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blueGrey,
                        ),
                        height: 200,
                        width: 200,
                        child: imageFiles != null
                            ? PreviewImages()
                            : const Center(child: Text('Select Image')),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 30,
                      width: ScreenDetails.getWidth(context) * 0.9,
                      child: Divider(
                        color: Colors.blueGrey,
                        thickness: 1.5,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: ScreenDetails.getWidth(context) * 0.7,
                      child: TextFormField(
                        onSaved: (value) {
                          productName = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Product Name';
                          }
                          return null;
                        },
                        maxLength: 100,
                        maxLines: 2,
                        decoration: textFormDecoration.copyWith(
                          labelText: 'Product Name',
                          hintText: 'Enter Product Name',
                          prefixIcon: const Icon(
                              Icons.production_quantity_limits_rounded),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: ScreenDetails.getWidth(context) * 0.45,
                          child: TextFormField(
                            onSaved: (value) {
                              productPrice = double.parse(value!);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Product Price';
                              } else if (value.isValidPrice() == false) {
                                return 'Please enter valid Product Price';
                              }
                              return null;
                            },
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            decoration: textFormDecoration.copyWith(
                              labelText: 'Price',
                              hintText: '5000 BDT',
                              prefixIcon:
                                  const Icon(FontAwesomeIcons.moneyBill),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: ScreenDetails.getWidth(context) * 0.45,
                          child: TextFormField(
                            onSaved: (value) {
                              productQuantity = int.parse(value!);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Product Quantity';
                              } else if (value.isValidQuantity() == false) {
                                return 'Please enter valid Product Quantity';
                              }
                              return null;
                            },
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: false),
                            decoration: textFormDecoration.copyWith(
                              labelText: 'Quantity',
                              hintText: ' 100',
                              prefixIcon: const Icon(Icons.numbers),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: ScreenDetails.getWidth(context) * 0.9,
                      child: TextFormField(
                        onSaved: (value) {
                          productDescription = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Product Description';
                          }
                          return null;
                        },
                        maxLength: 500,
                        maxLines: 10,
                        decoration: textFormDecoration.copyWith(
                          labelText: 'Product Description',
                          hintText: 'Enter Product Description',
                          prefixIcon: const Icon(Icons.description),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('Select Category'),
                          DropdownButton(
                              borderRadius: BorderRadius.circular(8),
                              // value: selectedCategory,
                              items: category
                                  .map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList(),
                              value: category[index],
                              onChanged: (String? value) {
                                setState(() {
                                  //  selectedCategory= value!;

                                  index = category.indexOf(value!);

                                  productCategory = value;
                                  subCategory=combined[index][0];

                                  print(index);
                                });
                              }),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Select Sub Category'),
                          ),
                          DropdownButton(
                              borderRadius: BorderRadius.circular(8),
                              items: combined[index]
                                  .map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList(),
                              value: combined[index][index2],
                              onChanged: (String? value) {
                                setState(() {
                                  index2 = combined[index].indexOf(value!);

                                  subCategory = value;
                                  // subCategory= value!;
                                });
                              })
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                imageFiles!.isEmpty ? pickProductImages() : clearImage();
              },
              child: imageFiles!.isEmpty
                  ? const Icon(Icons.photo)
                  : const Icon(Icons.delete),
              backgroundColor: Colors.brown,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: FloatingActionButton(
                onPressed:processing==true?null:() {
                  Upload();
                },
                child: processing==true?CircularProgressIndicator(): const Icon(Icons.check),
                backgroundColor: Colors.deepOrangeAccent.shade200,
              ),
            ),
          ],
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      ),
    );
  }
}

var textFormDecoration = InputDecoration(
  labelText: 'Product Name',
  labelStyle: TextStyle(color: Colors.blueGrey),
  hintText: 'Enter Product Name',
  hintStyle: TextStyle(color: Colors.blueGrey),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueGrey),
    borderRadius: BorderRadius.circular(8),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueGrey),
    borderRadius: BorderRadius.circular(8),
  ),
);

extension QunatityVlidator on String {
  bool isValidQuantity() {
    return RegExp(r'^[0-9][0-9]*$').hasMatch(this);
  }
}

extension PriceVlidator on String {
  bool isValidPrice() {
    return RegExp(r'^([0-9][0-9]*)(([\.][0-9]{1,3})||[])$').hasMatch(this);
  }
}
