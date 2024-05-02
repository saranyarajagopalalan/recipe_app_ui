import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/widgets/detailsPage.dart';
import 'package:recipe_app/widgets/image_path.dart';
// import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
// import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
// import './navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                child: SingleChildScrollView(
                    // singlechild scroll view to scroll
                    child: Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello,Anne",
                            style: GoogleFonts.roboto(
                                fontSize: 10, color: Colors.grey),
                          ),
                          Text(
                            "What would you like\nto cook today?",
                            style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0,
                                wordSpacing: 0),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          child: CircleAvatar(
                            // profile image
                            backgroundColor: Colors.blue.shade100,
                            radius: 25,
                            backgroundImage:
                                const AssetImage("assets/images/profile.png"),
                          ),
                        ),
                      )
                    ],
                  ),
                  heightBox(), //size box for gap
                  Container(
                    height: 40,
                    child: SearchBar(
                      hintText: "Search any recipe",
                      hintStyle: MaterialStatePropertyAll(TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.w500)),
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                      elevation: MaterialStatePropertyAll(0),
                      trailing: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 2,
                                height: 35,
                                color: Colors.grey[200],
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Icon(
                                Icons.tune,
                                size: 18,
                                color: Colors.grey[500],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      headings(
                          "Categories", "See all"), // function for headings
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // this animated container used for to create animated transition
                        margin: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 70,
                              width: double.infinity,
                              child: ListView.builder(
                                  itemCount: items.length,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, Index) {
                                    return GestureDetector(
                                      // return gesture detector :(it is used for responding user touch or various gestures)
                                      onTap: () {
                                        setState(() {
                                          current = Index;
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        margin: const EdgeInsets.all(5),
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            // active container color is green , others white
                                            color: current == Index
                                                ? Color.fromRGBO(
                                                    30, 162, 109, 1)
                                                : Colors.white,
                                            borderRadius: current == Index
                                                // active container borderradius is 10 others 15
                                                ? BorderRadius.circular(10)
                                                : BorderRadius.circular(15)),
                                        child: Column(children: [
                                          // images and text
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        items[Index],
                                                        width: 30,
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(items_text[Index],
                                                          style: TextStyle(
                                                              color: current ==
                                                                      Index
                                                                  ? Colors.white
                                                                  : Colors.grey,
                                                              fontSize: 12)),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ]),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  heightBox(),
                  Column(children: [
                    headings("Recommendation", "See all"), // heading function
                    heightBox(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          wrapColumn(
                              // this is the userdefined function used to send datas to the details pages
                              "assets/images/pasta.png", //image
                              "Creamy Pasta", //title
                              "By David Charle", // recipe owner
                              //description
                              "A comforting and satisfying pasta dish coated in a rich, smooth sauce made with cream, cheese, or a combination of both. It can be simple with just a few ingredients or more elaborate with additional vegetables, herbs, or proteins",
                              // ingredients list , the list from the image_path file (remember :[ have to pass images and quantities also like the ingredients :)] )
                              pasta_ingredients[0],
                              pasta_ingredients[1],
                              pasta_ingredients[2],
                              pasta_ingredients[3],
                              pasta_ingredients[4],
                              pasta_ingredients[5],
                              pasta_ingredients[6],
                              pasta_ingredients[7],
                              pasta_ingredients[8],
                              pasta_ingredients[9],
                              context),
                          wrapColumn(
                              "assets/images/macaronsorg.png",
                              "Macarons",
                              "By Rachel William",
                              "Chocolate is the best kind of dessert!These choco macarons are simply heavenly! Delicate little cookies filled with chocolate ganache",
                              macarons_ingredients[0],
                              macarons_ingredients[1],
                              macarons_ingredients[2],
                              macarons_ingredients[3],
                              macarons_ingredients[4],
                              macarons_ingredients[5],
                              macarons_ingredients[6],
                              macarons_ingredients[7],
                              macarons_ingredients[8],
                              macarons_ingredients[9],
                              context),
                          wrapColumn(
                              "assets/images/kiwi-juice.png",
                              "Kiwi-Juice",
                              "By Sammuel John",
                              "A refreshing, tangy juice with a vibrant green color. It can be enjoyed on its own or blended with other fruits for a more complex flavor.",
                              kiwi_ingredients[0],
                              kiwi_ingredients[1],
                              kiwi_ingredients[2],
                              kiwi_ingredients[3],
                              kiwi_ingredients[4],
                              kiwi_ingredients[5],
                              kiwi_ingredients[6],
                              kiwi_ingredients[7],
                              kiwi_ingredients[8],
                              kiwi_ingredients[9],
                              context),
                          wrapColumn(
                              "assets/images/green.png",
                              "Salmon Sashimi Tartare",
                              "By the_boujee.foodie",
                              "A luxurious appetizer made from diced, ultra-fresh, sushi-grade salmon.  It's often seasoned with a light dressing or sauce and complemented by various chopped vegetables, herbs, and sometimes even avocado. It's served chilled and eaten with crackers, crisps, or even on nori seaweed squares",
                              Salmon_ingredients[0],
                              Salmon_ingredients[1],
                              Salmon_ingredients[2],
                              Salmon_ingredients[3],
                              Salmon_ingredients[4],
                              Salmon_ingredients[5],
                              Salmon_ingredients[6],
                              Salmon_ingredients[7],
                              Salmon_ingredients[8],
                              Salmon_ingredients[9],
                              context),
                          wrapColumn(
                              "assets/images/chic_bro.jpeg",
                              "Chicken",
                              "By Rachel William",
                              "A comforting and classic dish featuring tender chicken pieces, vibrant green broccoli florets, and all bathed in a creamy, delicious white sauce. It's a crowd-pleaser that's perfect for a weeknight meal.",
                              "Chicken",
                              "Broccoli",
                              "soy sauce & lemon juice",
                              "olive oil",
                              "honey",
                              "garlic & ginger",
                              "pepper",
                              "Chopped fresh parsley",
                              "Toasted sesame seeds",
                              "sesame oil ",
                              context),
                        ],
                      ),
                    )
                  ]),
                  heightBox(),
                  Column(
                    children: [
                      headings("Recipes of the week", "See all"),
                      heightBox(),
                      SingleChildScrollView(
                        // this scroll horizontaly
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            re_img(
                                // user defined also this is used for share datas to details page
                                "assets/images/recipe_4.jpeg",
                                "Airfryer Parmesan Chicken With Broccoli",
                                "low-carb meals",
                                "Crispy parmesan-coated chicken pieces and tender broccoli florets cooked to perfection in the air fryer for a healthy and flavorful meal",
                                "Chicken",
                                "Broccoli",
                                "breadcrumbs",
                                "Parmesan cheese",
                                "olive oil",
                                "dried oregano",
                                "black pepper",
                                "Dijon mustard ",
                                "lemon",
                                "salt",
                                context),
                            re_img(
                                "assets/images/recipe_2.jpeg",
                                "Air Fryer Turkey Meatballs with Zoodles",
                                "Italian-Style Grits",
                                "This dish combines juicy air-fried turkey meatballs with refreshing zoodles (spiralized zucchini noodles) for a lighter take on a classic comfort food. It's perfect for a quick and healthy weeknight meal",
                                "turkey",
                                "breadcrumbs",
                                "Parmesan cheese",
                                "egg & olive oil",
                                "dried basil",
                                "dried oregano",
                                "marinara sauce",
                                "garlic powder",
                                "onion powder & pepper",
                                "zucchinis",
                                context),
                            re_img(
                                "assets/images/recipe_1.jpeg",
                                "Lemon Garlic Shrimp And Grits",
                                "fork-tender turkey meatballs",
                                "A delightful combination of succulent shrimp cooked in a vibrant lemon garlic sauce, served over creamy and comforting grits. It's a perfect balance of flavors and textures, making it a satisfying and flavorful dish.",
                                "grits",
                                "chicken",
                                "unsalted butter",
                                "salt & water",
                                "black pepper",
                                "shrimp",
                                "olive oil & garlic",
                                "thyme & drywhite wine",
                                "fresh parsley",
                                "black pepper",
                                context),
                            re_img(
                                "assets/images/recipe_3.jpeg",
                                "Hasselback Sweet Potatoes",
                                "Hasselback potatoes",
                                "Fancy-looking sweet potatoes with crispy edges and a soft center, made by thinly slicing them almost all the way through and roasting them with butter and seasonings",
                                "sweet potatoes",
                                "Olive oil",
                                "Salt",
                                "Black pepper",
                                "Fresh herbs-rosemary",
                                "Spices (cinnamon, paprika)",
                                "Butter",
                                "brown sugar glaze",
                                "garlic powder",
                                "",
                                context),
                          ],
                        ),
                      ),
                    ],
                  ),
                ])))));
  }
}

heightBox() {
  return SizedBox(
    height: 15,
  );
}

Row headings(String title, String more) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Text(
        more,
        style: TextStyle(
            color: Color.fromRGBO(30, 162, 109, 1),
            fontWeight: FontWeight.w500),
      )
    ],
  );
}

GestureDetector wrapColumn(
    String img,
    String title,
    String subtitle,
    String des,
    String ingredient_1,
    String ingredient_2,
    String ingredient_3,
    String ingredient_4,
    String ingredient_5,
    String ingredient_6,
    String ingredient_7,
    String ingredient_8,
    String ingredient_9,
    String ingredient_10,
    BuildContext context) {
  return GestureDetector(
    // this function navigate the details page
    onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailsPage(
            img: img,
            title: title,
            subtitle: subtitle,
            des: des,
            ingredient_1: ingredient_1,
            ingredient_2: ingredient_2,
            ingredient_3: ingredient_3,
            ingredient_4: ingredient_4,
            ingredient_5: ingredient_5,
            ingredient_6: ingredient_6,
            ingredient_7: ingredient_7,
            ingredient_8: ingredient_8,
            ingredient_9: ingredient_9,
            ingredient_10: ingredient_10,
            context: context))),
    child: Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        // display the images and text and subtext
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          ConstrainedBox(
            // Enforcing Size Limits: You can restrict the child widget's size to stay within a specific range.
            // This is useful for maintaining a consistent layout or preventing elements from overflowing their designated space.

            constraints: BoxConstraints(maxWidth: 100, minWidth: 100),
            child: Container(
              constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0),
                  ),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.openSans(
                        fontSize: 12, color: Colors.grey[500]),
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

GestureDetector re_img(
    String img,
    String title,
    String subtitle,
    String des,
    String ingredient_1,
    String ingredient_2,
    String ingredient_3,
    String ingredient_4,
    String ingredient_5,
    String ingredient_6,
    String ingredient_7,
    String ingredient_8,
    String ingredient_9,
    String ingredient_10,
    BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailsPage(
            img: img,
            title: title,
            subtitle: subtitle,
            des: des,
            ingredient_1: ingredient_1,
            ingredient_2: ingredient_2,
            ingredient_3: ingredient_3,
            ingredient_4: ingredient_4,
            ingredient_5: ingredient_5,
            ingredient_6: ingredient_6,
            ingredient_7: ingredient_7,
            ingredient_8: ingredient_8,
            ingredient_9: ingredient_9,
            ingredient_10: ingredient_10,
            context: context))),
    child: Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 250,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
              )),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.openSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.openSans(
                      fontSize: 13, color: Colors.grey[500]),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}


// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     int current = 0;
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           margin: EdgeInsets.only(left: 10, right: 10, top: 30),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Hello,Anne",
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                         Text(
//                           "What would you like\nto cook today?",
//                           style: GoogleFonts.roboto(),
//                         )
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: Container(
//                         child: CircleAvatar(
//                           radius: 25,
//                           backgroundImage:
//                               AssetImage("assets/images/profile.png"),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 heightBox(),
//                 SearchBar(
//                   hintText: "Search any recipe",
//                   hintStyle: MaterialStatePropertyAll(TextStyle(
//                       color: Colors.grey,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500)),
//                   leading: Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Icon(
//                       Icons.search,
//                       color: Colors.grey,
//                       size: 25,
//                     ),
//                   ),
//                   elevation: MaterialStatePropertyAll(0),
//                   trailing: [
//                     Padding(
//                       padding: const EdgeInsets.only(right: 10),
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 2,
//                             height: 35,
//                             color: Colors.grey[200],
//                           ),
//                           SizedBox(
//                             width: 6,
//                           ),
//                           Icon(
//                             Icons.tune,
//                             color: Colors.grey,
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 heightBox(),
//                 Column(
//                   children: [
//                     headings("Categories", "See all"),
//                     heightBox(),
//                     Container(
//                       margin: EdgeInsets.all(5),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 70,
//                             width: double.infinity,
//                             child: ListView.builder(
//                                 itemCount: items.length,
//                                 physics: const BouncingScrollPhysics(),
//                                 scrollDirection: Axis.horizontal,
//                                 itemBuilder: (ctx, Index) {
//                                   return GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         current = index;
//                                       });
//                                     },
//                                     child: Container(
//                                       margin: EdgeInsets.all(5),
//                                       width: 65,
//                                       height: 50,
//                                       decoration:
//                                           BoxDecoration(color: Colors.white),
//                                       child: Center(
//                                         child: Column(
//                                           children: [
//                                             Text(
//                                               items[Index],
//                                               style: GoogleFonts.roboto(),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 }),
//                           )
//                         ],
//                       ),
//                     ),

//                     // SingleChildScrollView(
//                     //   scrollDirection: Axis.horizontal,
//                     //   physics: BouncingScrollPhysics(),
//                     //   child: Row(
//                     //     mainAxisAlignment: MainAxisAlignment.start,
//                     //     children: [

//                     //       //   scroll_short("assets/images/profile.png", "Breakfast",
//                     //       //       context),
//                     //       //   scroll_short(
//                     //       //       "assets/images/profile.png", "Lunch", context),
//                     //       //   scroll_short(
//                     //       //       "assets/images/profile.png", "Dinner", context),
//                     //       //   scroll_short(
//                     //       //       "assets/images/profile.png", "Dessert", context),
//                     //       //   scroll_short(
//                     //       //       "assets/images/profile.png", "Cake", context),
//                     //       //   scroll_short(
//                     //       //       "assets/images/profile.png", "Icecream", context),
//                     //       //   scroll_short(
//                     //       //       "assets/images/profile.png", "Pudding", context),
//                     //     ],
//                     //   ),
//                     // )
//                   ],
//                 ),
//                 heightBox(),
//                 Column(children: [
//                   headings("Recommendation", "See all"),
//                   heightBox(),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     physics: BouncingScrollPhysics(),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         wrapColumn("assets/images/pasta.png", "Creamy pasta",
//                             "By David Charle", context),
//                         wrapColumn("assets/images/macaronsorg.png", "Macarons",
//                             "By Rachel William", context),
//                         wrapColumn("assets/images/chicken.jpg", "Chicken",
//                             "By Sammuel John", context),
//                         wrapColumn("assets/images/macaronsorg.png", "Macarons",
//                             "By Rachel William", context),
//                       ],
//                     ),
//                   )
//                 ]),
//                 heightBox(),
//                 Column(
//                   children: [
//                     headings("Recipes of the week", "See all"),
//                     heightBox(),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       physics: BouncingScrollPhysics(),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           re_img(
//                               "assets/images/recipe_4.jpeg",
//                               "Airfryer Parmesan Chicken With Broccoli",
//                               "low-carb meals "),
//                           re_img(
//                               "assets/images/recipe_1.jpeg",
//                               "Lemon Garlic Shrimp And Grits",
//                               "Italian-Style Grits"),
//                           re_img(
//                               "assets/images/recipe_2.jpeg",
//                               "Air Fryer Turkey Meatballs with Zoodles",
//                               "fork-tender turkey meatballs"),
//                           re_img(
//                               "assets/images/recipe_3.jpeg",
//                               "Hasselback Sweet Potatoes",
//                               "Hasselback potatoes"),
//                         ],
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Column scroll_short(String img, String text, BuildContext context) {
//     return Column(
//       children: [
//         Card(
//           elevation: 4,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           child: Container(
//             height: 55,
//             width: MediaQuery.of(context).size.width / 5,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Color.fromRGBO(46, 139, 87, 1)),
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//               Image.asset(
//                 img,
//                 height: 20,
//                 width: 20,
//                 fit: BoxFit.cover,
//               ),
//               Text(
//                 text,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 13,
//                     fontWeight: FontWeight.w100),
//               )
//             ]),
//           ),
//         ),
//       ],
//     );
//   }

  

//  
  

