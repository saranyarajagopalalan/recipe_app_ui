import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:recipe_app/widgets/bookmark.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:recipe_app/widgets/image_path.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsPage extends StatelessWidget {
  final String? img;
  final String? title;
  final String? subtitle;
  final String? des;
  final String? ingredient_1;
  final String? ingredient_2;
  final String? ingredient_3;
  final String? ingredient_4;
  final String? ingredient_5;
  final String? ingredient_6;
  final String? ingredient_7;
  final String? ingredient_8;
  final String? ingredient_9;
  final String? ingredient_10;
  final BuildContext? context;
  DetailsPage(
      {this.img,
      this.title,
      this.subtitle,
      this.des,
      this.ingredient_1,
      this.ingredient_2,
      this.ingredient_3,
      this.ingredient_4,
      this.ingredient_5,
      this.ingredient_6,
      this.ingredient_7,
      this.ingredient_8,
      this.ingredient_9,
      this.ingredient_10,
      this.context}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      // used stack here for allows to position multiple child widgets on top of each other within its designated area.
      children: [
        CarouselSlider(
            //for sliding
            items: [
              // items should contain the list of images,[remember : provide a list of images to slide : here only one image is sliding]
              Image.asset(
                "$img",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ],
            options: CarouselOptions(
              // stylling
              autoPlay: true,
              height: MediaQuery.of(context).size.height / 1.7,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              aspectRatio: 2.0, // space btwn the images
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              reverse: false,
              autoPlayCurve: Curves.easeInOut,
              autoPlayInterval: const Duration(seconds: 2),
              onPageChanged: (index, reason) {},
              scrollDirection: Axis.horizontal,
            )),
        //image indicator
        Padding(
          // dots that shown in the bottom of the image
          padding: const EdgeInsets.only(bottom: 25),
          child: Align(
            // alignment property is used to control the positioning of non-positioned child widgets within the stack's bounds
            child: AnimatedSmoothIndicator(
              activeIndex: 0,
              count: macarons.length,
              axisDirection: Axis.horizontal,
              curve: Curves.bounceIn,
              effect: const SwapEffect(
                  // swap effect is used here
                  dotColor: Colors.grey,
                  activeDotColor: Colors.white,
                  dotHeight: 6,
                  dotWidth: 6),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // icons on the top of the image
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // going back
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 20,
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(// move to bookmark page
                          MaterialPageRoute(
                              builder: (context) => const Bookmark()));
                    },
                    icon: const Icon(
                      Icons.bookmark_border_outlined,
                      size: 20,
                    )),
              )
            ],
          ),
        ),
        Draggable(
          // it can drag and move around by long pressing [remember : it need edit,]
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                // conatiner contain the details are passed from the home page
                // height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                      maxWidth: 180, minWidth: 100),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title!, // title frm the home page
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        subtitle!,
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    child: const Row(
                                      // [remember : we should make this dynamic, based on the varies dishes ]
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          " 4.5",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                            // also this contain the sub details of the dish, (have make dynamic)
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                //user defined method for Styling icons and text
                                iconsRow(Icons.access_time, "10 mins"),
                                const SizedBox(
                                  width: 10,
                                ),
                                iconsRow(
                                    Icons.signal_cellular_alt_sharp, "Medium"),
                                const SizedBox(
                                  width: 10,
                                ),
                                iconsRow(Icons.whatshot, "512 Cal"),
                              ],
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Description",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              des!, // the description from the home page
                              style: GoogleFonts.roboto(
                                  fontSize: 12, color: Colors.grey),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Ingredients",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                // Listview method is a userdefined method for give ingredients
                                listviewMethod("assets/images/sugar.png",
                                    ingredient_1!, "160 g"),
                                listviewMethod("assets/images/olive-oli.png",
                                    ingredient_2!, "160 g"),
                                listviewMethod("assets/images/chocolate.png",
                                    ingredient_3!, "110 g"),
                                listviewMethod("assets/images/sugar.png",
                                    ingredient_4!, "110 g"),
                                listviewMethod("assets/images/sugar.png",
                                    ingredient_5!, "110 g"),
                                listviewMethod("assets/images/sugar.png",
                                    ingredient_6!, "110 g"),
                                listviewMethod("assets/images/sugar.png",
                                    ingredient_7!, "110 g"),
                                listviewMethod("assets/images/sugar.png",
                                    ingredient_8!, "110 g"),
                                listviewMethod("assets/images/sugar.png",
                                    ingredient_9!, "110 g"),
                                listviewMethod("assets/images/sugar.png",
                                    ingredient_10!, "110 g"),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ),
        Align(alignment: Alignment.bottomCenter, child: _navBar())
        //the child widget is positioned at the bottom center of the Align widget's area:child property assign the result of calling function navbar()
      ],
    ));
  }

  Row listviewMethod(String img, String title, String subtitile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    img,
                    fit: BoxFit.cover,
                    color: Colors.grey[200],
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Text(title),
          ],
        ),
        Text(subtitile),
      ],
    );
  }

  Row iconsRow(IconData icon, String text) {
    // used for designing the text and icons that shown in the top of the container in stack
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 20,
        ),
        widthMethod(), //size box with width
        Text(
          text,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        )
      ],
    );
  }

  SizedBox widthMethod() {
    return const SizedBox(
      width: 4,
    );
  }
}

Widget _navBar() {
  // the small navbar with [remember : youtube link should be given ]
  return Container(
    height: 50,
    margin: const EdgeInsets.only(left: 70, right: 70, bottom: 10),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(46, 139, 87, 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.green.withAlpha(20), //shadow
              blurRadius: 20,
              spreadRadius: 10)
        ]),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.play_circle_outline,
          color: Colors.white,
          weight: 5,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Watch Videos",
          style: TextStyle(color: Colors.white),
        )
      ],
    ),
  );
}

//Draggable section
class Draggable extends StatefulWidget {
  //stateful widget :  its own state and rebuild based on changes.
  final Widget child;
  const Draggable({super.key, required this.child});

  @override
  State<Draggable> createState() => _DraggableState();
}

//_DraggableState class this private inner class manages the state of the Draggable widget.
class _DraggableState extends State<Draggable> {
  final sheet =
      GlobalKey(); //global key: sheet it is used to access DraggableScrollableSheet widget from within the state
  final controller =
      DraggableScrollableController(); // This controller manages the scrolling behavior of the sheet.

  @override
  void initState() {
    super
        .initState(); //its run when the widget is first created , it listens for changes int the controller using onchanged
    controller.addListener(onChanged);
  }

  void onChanged() {
    // when the sheet is dragged :(controller state change) it check the controller.size which represent the current portion of the sheet visible
    final currentSize = controller.size;
    if (currentSize <= 0.05) {
      collapse();
    }
  }

// animated the sheet to different size
  void collapse() => animatedSheet(getSheet.snapSizes!.first);
  void anchor() => animatedSheet(getSheet.snapSizes!.last);
  void expand() => animatedSheet(getSheet.maxChildSize);
  void hide() => animatedSheet(getSheet.minChildSize);

  void animatedSheet(double size) {
    // this function animates the sheet to a specific size using the controller.animatedTo method. It defines the duration and easing curve for the animation.
    controller.animateTo(size,
        duration: const Duration(microseconds: 50), curve: Curves.easeInOut);
  }

  DraggableScrollableSheet get getSheet =>
      (sheet.currentWidget as DraggableScrollableSheet);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, Constraints) {
      return DraggableScrollableSheet(
        key: sheet,
        initialChildSize: 0.5, // half the screen height
        maxChildSize: 0.95, //fully expanded almost full scrn
        minChildSize: 0, //completely hidden
        expand: true,
        snap: true,
        snapSizes: [
          70 / Constraints.maxHeight,
          0.5
        ], // it define the size ,the sheet snap during the dragging 70% of the screen height and 50% of the screen height
        builder: (BuildContext context, ScrollController scrollController) {
          // build the content with in the sheet
          return DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                toButtonIndicator(), // bottom indicator
                SliverToBoxAdapter(
                  // the content frm draggable
                  child: widget.child,
                )
              ],
            ),
          );
        },
      );
    });
  }
}

// button indicator used in the draggable
SliverToBoxAdapter toButtonIndicator() {
  return SliverToBoxAdapter(
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Center(
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(212, 210, 210, 1),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      margin: EdgeInsets.only(top: 0, bottom: 0),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
