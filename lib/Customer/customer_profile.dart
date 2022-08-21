import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({Key? key}) : super(key: key);

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: Stack(
        children: [
          Container(
            height: 310,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xffffc107), Color(0xffe91e63)],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            )),
          ),
          CustomScrollView(
            // scrollDirection: Axis.vertical,
            slivers: [
              SliverAppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  pinned: true,
                  centerTitle: true,
                  stretch: true,
                  //floating: true,
                  expandedHeight: 240,
                  flexibleSpace: LayoutBuilder(builder: (context, constraints) {
                    return FlexibleSpaceBar(
                      title: AnimatedOpacity(
                        duration: Duration(milliseconds: 200),
                        opacity: constraints.biggest.height <= 120 ? 1 : 0,
                        child: Text(
                          'Chondromollika Ahmed',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      background: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: [Color(0xffffc107), Color(0xffe91e63)],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                        )),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 200,
                              width: 200,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Lottie.network(
                                    "https://assets8.lottiefiles.com/packages/lf20_8ydmsved.json",
                                    height: 200,
                                    width: 200,
                                    fit: BoxFit.cover,
                                    repeat: true,
                                    animate: true,
                                  ),
                                  Align(
                                    alignment: Alignment(0.0, 0.1),
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                          "https://image.freepik.com/free-photo/portrait-beautiful-young-woman-looking-camera_23-2147865523.jpg",
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Chondromollika Ahmed",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/customer/profile/cart');
                              },
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Center(
                                  child: Text(
                                    'Cart',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TextButton(
                              onPressed: () {

                                Navigator.pushNamed(context, '/customer/orders');
                              },
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Center(
                                  child: Text(
                                    'Orders',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                bottomRight: Radius.circular(40),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {

                                Navigator.pushNamed(context, '/customer/wishlist');
                              },
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Center(
                                  child: Text(
                                    'Wishlist',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.blueGrey.shade100,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 150,
                            child: Image(
                              image: NetworkImage(
                                  "https://raw.githubusercontent.com/chondromollikaahmed/com_arc/master/android/app/src/main/res/drawable/logo.png"),
                              //height:150,
                              // width:150,
                              // fit:BoxFit.contain,
                            ),
                          ),
                          ComArcHeaderLabel(
                            title: 'Account Information',
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 260,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text('Name'),
                                    subtitle: Text('Chondromollika Ahmed'),
                                    leading: Icon(Icons.person),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40.0),
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1,
                                    ),
                                  ),
                                  ListTile(
                                    title: Text('Email'),
                                    subtitle:
                                        Text('chondromollikaahmed@gmail.com'),
                                    leading: Icon(Icons.email),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40.0),
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1,
                                    ),
                                  ),
                                  ListTile(
                                    title: Text('Phone'),
                                    subtitle: Text('+8801993522240'),
                                    leading: Icon(Icons.phone),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ComArcHeaderLabel(
                            title: 'Account Settings',
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 248,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                children: [
                                  ComArcListTile(
                                    title: 'Change Password',
                                    icon: Icons.lock,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40.0),
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/customer/setting');
                                    },
                                    child: ComArcListTile(
                                      title: 'Settings',
                                      icon: Icons.dashboard_customize_outlined,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40.0),
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1,
                                    ),
                                  ),
                                  ComArcListTile(
                                    title: 'Logout',
                                    icon: Icons.exit_to_app,
                                     onTap: (){Navigator.pushReplacementNamed(context, '/');}
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ComArcListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function()? onTap;

  const ComArcListTile(
      {Key? key,
      required this.title,
      this.subtitle = '',
      required this.icon,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(icon),
      ),
    );
  }
}

class ComArcHeaderLabel extends StatelessWidget {
  final String title;

  const ComArcHeaderLabel({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              width: 50,
              child: Divider(
                color: Colors.black,
                thickness: 1,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40,
              width: 50,
              child: Divider(
                color: Colors.black,
                thickness: 1,
              ),
            ),
          ],
        ));
  }
}
