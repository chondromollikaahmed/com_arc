
import 'package:com_arc/welcome/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({Key? key}) : super(key: key);

  @override
  _OnboardingWidgetState createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'onboarding',
        color: Colors.blueAccent,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF1F4F8),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 500,
                      child: Stack(
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                            child: PageView(
                              controller: pageViewController ??=
                                  PageController(initialPage: 0),
                              scrollDirection: Axis.horizontal,
                              children: const [
                                ComArcOnBoarding(title: 'Welcome to ComArc',
                                    image: "https://www.kindpng.com/picc/m/500-5001508_fantasy-women-clipart-mujer-woman-shopping-icon-png.png",
                                    description: "ComArc Is The Best Place To Meet The Needs Of Both Seller And Customers"),
                                ComArcOnBoarding(title: 'Analyze Your Business',
                                    image: "https://png.pngtree.com/png-vector/20220518/ourmid/pngtree-sell-icon-on-white-background-png-image_4655452.png",
                                    description: "ComArc Is The Best Place To Meet The Needs Of Both Seller And Customers"),
                                ComArcOnBoarding(title: 'Welcome to ComArc',
                                    image: "https://www.kindpng.com/picc/m/500-5001508_fantasy-women-clipart-mujer-woman-shopping-icon-png.png",
                                    description: "ComArc Is The Best Place To Meet The Needs Of Both Seller And Customers"),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 1),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: SmoothPageIndicator(
                                controller: pageViewController ??=
                                    PageController(initialPage: 0),
                                count: 3,
                                axisDirection: Axis.horizontal,
                                onDotClicked: (i) {
                                  pageViewController!.animateToPage(
                                    i,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                effect: ExpandingDotsEffect(
                                  expansionFactor: 2,
                                  spacing: 8,
                                  radius: 16,
                                  dotWidth: 16,
                                  dotHeight: 4,
                                  dotColor: Color(0xFFE0E3E7),
                                  activeDotColor: Color(0xFF0F1113),
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ComArcButton(icon: Icons.person_pin, text: 'Customer', onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login()));
                  }),
                  ComArcButton(icon: Icons.production_quantity_limits_sharp, text: 'Seller', onPressed: () {
                    Navigator.pushReplacementNamed(context, '/seller_home');
                  }),

                ],
              ),
            ),
          ),
        ));
  }
}

class ComArcButton extends StatelessWidget {
  String text;
  IconData icon;
  Function()? onPressed;
   ComArcButton({
    Key? key, required this.text, required this.icon , this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton (
      onPressed: onPressed,

      child: Container(
        width:120,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blueGrey,
        ),
        child: Row
          (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,



          children: [
            Icon(icon, color: Colors.white,),
            Text(text, style: TextStyle(color: Colors.white),),
          ],

        ),
      ),

    );
  }
}

class ComArcOnBoarding extends StatelessWidget {

  final String image;
  final String title;
  final String description;

  const ComArcOnBoarding({
    Key? key, required this.image, required this.title, required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          12, 12, 12, 12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            image,
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                16, 8, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  title,
                  style: GoogleFonts.abhayaLibre(
                      textStyle: const TextStyle(
                        color: Color(0xFF0F1113),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,)),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                16, 8, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    description,
                    style: GoogleFonts.outfit(
                        textStyle: const TextStyle(
                            color:
                            Color(0xFF57636C),
                            fontSize: 14,
                            fontWeight:
                            FontWeight.normal)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
