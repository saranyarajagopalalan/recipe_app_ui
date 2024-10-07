// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/utils/theme/theme.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Theme(
      data: theme.brightness == Brightness.light
          ? AppTheme.LightTheme
          : AppTheme.DarkTheme,
      child: Scaffold(
        // backgroundColor: Colors.grey[100],

        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 30),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Bookmark",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: SearchBar(
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.only(top: 0, bottom: 2, left: 9)),
                        hintText: "Search saved recipes",
                        hintStyle: MaterialStatePropertyAll(TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        )),
                        elevation: MaterialStatePropertyAll(0),
                        leading: Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    singleLinerow("Recently Viewed", "See all"), // headings
                    const SizedBox(
                      height: 15,
                    ),

                    list_images(
                        // method used for arrange the images as a grid
                        "assets/images/vegetarian-tom-kha-soup.jpg",
                        "assets/images/green.png",
                        "assets/images/Thai-green-curry.jpeg",
                        context),

                    const SizedBox(
                      height: 15,
                    ),
                    singleLinerow("Made it", "See all"), // headings method
                    const SizedBox(
                      height: 15,
                    ),
                    list_images(
                        "assets/images/kiwi-juice.png",
                        "assets/images/avocado.png",
                        "assets/images/mango-bubble-tea.jpg",
                        context),

                    const SizedBox(
                      height: 15,
                    ),
                    singleLinerow("Breakfast", "See all"),
                    const SizedBox(
                      height: 15,
                    ),
                    list_images(
                        "assets/images/thai.jpg",
                        "assets/images/breakfast.png",
                        "assets/images/egg.png",
                        context),
                    const SizedBox(
                      height: 60,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column singleLinerow(String text, String subtext) {
    // heading method
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Text(
            subtext,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(46, 139, 87, 1),
            ),
          ),
        ],
      ),
    ]);
  }

  // ignore: non_constant_identifier_names
  Container list_images(
      String img1, String img2, String img3, BuildContext context) {
    return  Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 4.9,
                width: MediaQuery.of(context).size.width / 1,
                child: Image.asset(
                  img1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 10,
                child: Image.asset(
                  img2,
                  colorBlendMode: BlendMode.modulate,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 10,
                      // child: Image.asset(
                      //   img3,
                      //   fit: BoxFit.cover,
                      // ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.amber,
                          image: DecorationImage(
                            image: AssetImage(img3),
                            fit: BoxFit.cover,
                          )),
                      child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Text Message',
                            style: TextStyle(
                              color: Colors.white,
                              // shadows: CupertinoContextMenu.kEndBoxShadow,

                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    )
                  ],
                )),

            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10),
            //   child: GestureDetector(
            //     onTap: () => Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => AllItems(img3: img3))),
            //     child: Container(
            //       width: MediaQuery.of(context).size.width / 3,
            //       height: MediaQuery.of(context).size.height / 10,
            //       child: Image.asset(
            //         img3,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
          ])
        ],
      ),
    );
  }
}
