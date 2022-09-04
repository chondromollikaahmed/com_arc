import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../customs/com_arc_customs.dart';


List<String> label =['My Store','Orders','Edit Profile','Manage Product','Blances','Statics'];

List<IconData> icon =[
  FontAwesomeIcons.store,
  FontAwesomeIcons.cartShopping,
  FontAwesomeIcons.circleUser,
  FontAwesomeIcons.gears,
  FontAwesomeIcons.moneyBill,
  FontAwesomeIcons.chartLine,
];


class SellerDashboard extends StatefulWidget {
  const SellerDashboard({Key? key}) : super(key: key);

  @override
  State<SellerDashboard> createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  @override
  Widget build(BuildContext context) {

    List<Function()> listOfFunctions =[
      ()=>Navigator.pushNamed(context, '/seller_store'),
      ()=>Navigator.pushNamed(context, '/seller/orders'),
      ()=>Navigator.pushNamed(context, '/seller/editprofile'),
      ()=>Navigator.pushNamed(context, '/seller/manageproduct'),
      ()=>Navigator.pushNamed(context, '/seller/balances'),
      ()=>Navigator.pushNamed(context, '/seller/statics'),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const ComArcTitle(title: 'Seller Dashboard'),
        backgroundColor: Colors.deepOrangeAccent.shade100,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/seller/login');
              },
              icon: const FaIcon(
                FontAwesomeIcons.arrowRightFromBracket,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              child: Stack(children: [
                Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent.shade100,
                    ),
                    child: const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Text(
                        'Below is a summary of your selling activity.',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 12),
                        child: ComArcListContainer(
                          label1: 'Total Sales',
                          label2: '2000',
                          ricon: Icons.currency_exchange,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 12),
                        child: ComArcListContainer(
                          label1: 'Total Orders',
                          label2: '200',
                          ricon: Icons.shopping_cart,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x1F000000),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.deepOrangeAccent.shade100,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrangeAccent.shade100,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Colors.deepOrangeAccent.shade100,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 12, 12, 12),
                                      child: Icon(
                                        Icons.contacts,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 12, 12, 12),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'New Contracts',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: Text(
                                          '3,200',
                                          style: TextStyle(color: Colors.black),
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
                    ],
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 400,
                child: GridView.count(
                  mainAxisSpacing: 50,
                  crossAxisSpacing: 50,
                  crossAxisCount: 2,
                  children: List.generate(6, (index) {
                    return InkWell(
                      onTap: listOfFunctions[index],
                      child: Card(
                        shadowColor: Colors.deepOrangeAccent.shade100,
                        elevation: 10,
                        color: Colors.deepOrangeAccent.shade100.withOpacity(0.3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(icon[index],
                            size: 50,

                            color: Colors.white,),
                            Text(label[index], style: TextStyle(
                              fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white
                            ),)
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ComArcListContainer extends StatelessWidget {
  String label1, label2;
  IconData ricon;

  ComArcListContainer({
    Key? key,
    required this.label1,
    required this.label2,
    required this.ricon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x1F000000),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent.shade100,
                shape: BoxShape.circle,
              ),
              alignment: AlignmentDirectional(0, 0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Colors.deepOrangeAccent.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                  child: Icon(
                    ricon,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label1,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Text(
                      label2,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
