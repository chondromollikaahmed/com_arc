import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class HomeScreenAlt extends StatelessWidget {
   HomeScreenAlt({
    Key? key,
  }) : super(key: key);


  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [

                Container(
                  height: 45,
                  width: 45,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                      "https://raw.githubusercontent.com/JehadurRE/JehadurRE/main/dl.beatsnoop.com-1643241594.jpg",
                      fit: BoxFit.cover),
                ),
                const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Text(
                      "Chondromollika Ahmed",
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Icon(
                    Icons.favorite_border,
                    color: Color(0xff000000),
                    size: 24,
                  ),
                ),

                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.notifications,
                  color: Color(0xff212435),
                  size: 24,
                ),

                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.shopping_cart,
                  color: Color(0xff212435),
                  size: 24,
                ),

                const SizedBox(
                  width: 8,
                ),
              ],),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: TextField(
              controller: TextEditingController(),
              obscureText: false,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Color(0xff26fffb),
              ),
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                      color: Color(0xffa7a4a4),
                      width: 1
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                      color: Color(0xffa7a4a4),
                      width: 1
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                      color: Color(0xffa7a4a4),
                      width: 1
                  ),
                ),
                hintText: "Search here",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xffa29f9f),
                ),
                filled: true,
                fillColor: const Color(0xffffffff),
                isDense: false,
                contentPadding: const EdgeInsets.all(8),
                prefixIcon: const Icon(
                    Icons.search, color: Color(0xffa29f9f), size: 24),
                suffixIcon: const Icon(
                    Icons.photo_camera, color: Color(0xffa29f9f), size: 24),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            padding: const EdgeInsets.all(0),
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 100,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.zero,
            ),
            child:
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(0),
                          padding: const EdgeInsets.all(8),
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Color(0xffffc6e0),
                            shape: BoxShape.circle,
                          ),
                          child:
                          const ImageIcon(
                            NetworkImage(
                                "https://cdn1.iconfinder.com/data/icons/basi-icon-set-01/100/Fin_copy-37-256.png"),
                            size: 24,
                            color: Color(0xff731069),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Text(
                            "Categories",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ],),),

                  ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [

                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                  "https://picsum.photos/250?image=9",
                                  fit: BoxFit.cover),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                              child: Text(
                                "Kurti & Suits",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ],),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                  "https://picsum.photos/250?image=10",
                                  fit: BoxFit.cover),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                              child: Text(
                                "Westernwear",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ],),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                  "https://image.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-blue-shirt-clothes-fashion-man-posing_158538-4976.jpg",
                                  fit: BoxFit.cover),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                              child: Text(
                                "Men",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ],),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                  "https://images.unsplash.com/photo-1610030469983-98e550d6193c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2FyZWV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                                  fit: BoxFit.cover),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                              child: Text(
                                "Saree",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ],),),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 16),
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                  "https://images.unsplash.com/photo-1601121141461-9d6647bca1ed?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Z29sZCUyMGpld2VsbGVyeXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
                                  fit: BoxFit.cover),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                              child: Text(
                                "Text",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ],),),
                    ],),
                ],),),
          ),
          SizedBox(
            height: 240,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Stack(
              children: [
                PageView.builder(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, position) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: Image.network(
                        "https://bloomidea.com/sites/default/files/styles/og_image/public/blog/9_tipos_de_promocoes_que_pode_fazer_numa_loja_online.png?itok=k8-76_yR",
                        height: 200,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      axisDirection: Axis.horizontal,
                      effect: const ExpandingDotsEffect(
                        dotColor: Color(0xff9e9e9e),
                        activeDotColor: Color(0xff3a57e8),
                        dotHeight: 10,
                        dotWidth: 10,
                        radius: 16,
                        spacing: 8,
                        expansionFactor: 3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Offer Zone",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 4, 0, 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Best Deals On Products",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff9e9e9e),
                ),
              ),
            ),
          ),

          GridView(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            children: [

              Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child:

                    ///***If you have exported images you must have to copy those images in assets/images directory.
                    const Image(
                      image: NetworkImage(
                          "https://image.freepik.com/free-photo/dark-haired-woman-with-red-lipstick-smiles-leans-stand-with-clothes-holds-package-pink-background_197531-17609.jpg"),
                      height: 140,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      width: 50,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: Color(0xffeb1c1c),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(topRight: Radius
                            .circular(6.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                      ),
                      child:
                      const Text(
                        "50% Off",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 10,
                          color: Color(0xffece90d),
                        ),
                      ),
                    ),),
                ],),

              Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child:

                    ///***If you have exported images you must have to copy those images in assets/images directory.
                    const Image(
                      image: NetworkImage(
                          "https://image.freepik.com/free-photo/pretty-young-stylish-sexy-woman-pink-luxury-dress-summer-fashion-trend-chic-style-sunglasses-blue-studio-background-shopping-holding-paper-bags-talking-mobile-phone-shopaholic_285396-2957.jpg"),
                      height: 140,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      width: 50,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: Color(0xffeb1c1c),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(topRight: Radius
                            .circular(6.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                      ),
                      child:
                      const Text(
                        "30% Off",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 10,
                          color: Color(0xffece90d),
                        ),
                      ),
                    ),),
                ],),

              Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child:

                    ///***If you have exported images you must have to copy those images in assets/images directory.
                    const Image(
                      image: NetworkImage(
                          "https://img.freepik.com/free-photo/fashion-portrait-two-elegant-women-best-friends-posing-indoor-grey-wall-wearing-winter-fluffy-coat-black-casual-hat-fashionable-clothes-sisters-walking_273443-4074.jpg?size=626&ext=jpg"),
                      height: 140,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      width: 50,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: Color(0xffeb1c1c),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(topRight: Radius
                            .circular(6.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                      ),
                      child:
                      const Text(
                        "10% Off",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 10,
                          color: Color(0xffece90d),
                        ),
                      ),
                    ),),
                ],),

              Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child:

                    ///***If you have exported images you must have to copy those images in assets/images directory.
                    const Image(
                      image: NetworkImage(
                          "https://image.freepik.com/free-photo/three-young-beautiful-smiling-girls-trendy-summer-casual-jeans-clothes-sexy-carefree-women-posing-positive-models-sunglasses_158538-4730.jpg"),
                      height: 140,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      width: 50,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: Color(0xffeb1c1c),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(topRight: Radius
                            .circular(6.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                      ),
                      child:
                      const Text(
                        "30% Off",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 10,
                          color: Color(0xffece90d),
                        ),
                      ),
                    ),),
                ],),

              Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child:

                    ///***If you have exported images you must have to copy those images in assets/images directory.
                    const Image(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1572804013427-4d7ca7268217?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8d29tYW4lMjBjbG90aGVzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80"),
                      height: 140,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      width: 50,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: Color(0xffeb1c1c),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(topRight: Radius
                            .circular(6.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                      ),
                      child:
                      const Text(
                        "30% Off",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 10,
                          color: Color(0xffece90d),
                        ),
                      ),
                    ),),
                ],),

              Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child:

                    ///***If you have exported images you must have to copy those images in assets/images directory.
                    const Image(
                      image: NetworkImage(
                          "https://image.freepik.com/free-photo/pleased-female-model-with-happy-face-expression-posing-winter-clothes-smiling-short-haired-woman-scarf-expressing-positive-emotions-purple-wall_197531-8012.jpg"),
                      height: 140,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      width: 50,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: Color(0xffeb1c1c),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(topRight: Radius
                            .circular(6.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                      ),
                      child:
                      const Text(
                        "30% Off",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 10,
                          color: Color(0xffece90d),
                        ),
                      ),
                    ),),
                ],),

              Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child:

                    ///***If you have exported images you must have to copy those images in assets/images directory.
                    const Image(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiL4S_7R5y8jvyNDNCv6YmXw5gW5_9zXSN6U5fCJrkhAo6UdicAH3bNFmiExrzD68wrbg&usqp=CAU"),
                      height: 140,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      width: 50,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: Color(0xffeb1c1c),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(topRight: Radius
                            .circular(6.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                      ),
                      child:
                      const Text(
                        "30% Off",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 10,
                          color: Color(0xffece90d),
                        ),
                      ),
                    ),),
                ],),

              Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child:

                    ///***If you have exported images you must have to copy those images in assets/images directory.
                    const Image(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/5868122/pexels-photo-5868122.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      height: 140,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      width: 50,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: Color(0xffeb1c1c),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(topRight: Radius
                            .circular(6.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                      ),
                      child:
                      const Text(
                        "30% Off",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 10,
                          color: Color(0xffece90d),
                        ),
                      ),
                    ),),
                ],),

              Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child:

                    ///***If you have exported images you must have to copy those images in assets/images directory.
                    const Image(
                      image: NetworkImage(
                          "https://img.freepik.com/free-photo/woman-with-shopping-bags-studio-yellow-background-isolated_1303-14294.jpg?size=626&ext=jpg"),
                      height: 140,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      width: 50,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: Color(0xffeb1c1c),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(topRight: Radius
                            .circular(6.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                      ),
                      child:
                      const Text(
                        "50% Off",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 10,
                          color: Color(0xffece90d),
                        ),
                      ),
                    ),),
                ],),
            ],),
          const Divider(
            color: Color(0xffe3e1e1),
            height: 16,
            thickness: 8,
            indent: 0,
            endIndent: 0,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Contest Section",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 8, 0, 16),
            padding: const EdgeInsets.all(0),
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 100,
            decoration: const BoxDecoration(
              color: Color(0x00000000),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.zero,
            ),
            child:

            ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [

                Container(
                  margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  padding: const EdgeInsets.all(0),
                  width: 280,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0x00000000),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
                  ),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [

                      const ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius
                            .circular(12.0), bottomLeft: Radius.circular(
                            12.0)),
                        child:

                        ///***If you have exported images you must have to copy those images in assets/images directory.
                        Image(
                          image: NetworkImage(
                              "https://image.freepik.com/free-vector/wheel-fortune-lucky-girl-winner-casino_107791-1550.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 0, 4),
                          child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Text(
                                "Spin & Win Addured Credits",
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                child: Text(
                                  "Spin & Win Assured Credits",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 11,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                                child: Text(
                                  "CLICK TO SPIN",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12,
                                    color: Color(0xff3a57e8),
                                  ),
                                ),
                              ),
                            ],),),),
                    ],),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                  padding: const EdgeInsets.all(0),
                  width: 280,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0x00000000),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
                  ),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [

                      const ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius
                            .circular(12.0), bottomLeft: Radius.circular(
                            12.0)),
                        child:

                        ///***If you have exported images you must have to copy those images in assets/images directory.
                        Image(
                          image: NetworkImage(
                              "https://img.freepik.com/free-vector/golden-wheel-fortune-luck-spin-background_1017-31404.jpg?size=338&ext=jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 0, 4),
                          child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Text(
                                "Spin & Win Addured Credits",
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                child: Text(
                                  "Spin & Win Assured Credits",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 11,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                                child: Text(
                                  "CLICK TO SPIN",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12,
                                    color: Color(0xff3a57e8),
                                  ),
                                ),
                              ),
                            ],),),),
                    ],),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                  padding: const EdgeInsets.all(0),
                  width: 280,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0x00000000),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
                  ),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [

                      const ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius
                            .circular(12.0), bottomLeft: Radius.circular(
                            12.0)),
                        child:

                        ///***If you have exported images you must have to copy those images in assets/images directory.
                        Image(
                          image: NetworkImage(
                              "https://image.freepik.com/free-vector/jackpot-realistic-background_1284-25763.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 0, 4),
                          child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Text(
                                "Spin & Win Addured Credits",
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                child: Text(
                                  "Spin & Win Assured Credits",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 11,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                                child: Text(
                                  "CLICK TO SPIN",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12,
                                    color: Color(0xff3a57e8),
                                  ),
                                ),
                              ),
                            ],),),),
                    ],),
                ),
              ],),
          ),
        ],),);
  }
}