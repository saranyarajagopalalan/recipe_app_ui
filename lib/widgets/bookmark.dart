import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
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
                Container(
                  height: 40,
                  child: const SearchBar(
                    hintText: "Search saved recipes",
                    hintStyle: MaterialStatePropertyAll(TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
                    elevation: MaterialStatePropertyAll(0),
                    leading: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 20,
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
                staggered_grid(
                    // method used for arrange the images as a grid
                    "assets/images/vegetarian-tom-kha-soup.jpg",
                    "assets/images/green.png",
                    "assets/images/Thai-green-curry.jpeg"),
                const SizedBox(
                  height: 15,
                ),
                singleLinerow("Made it", "See all"), // headings method
                const SizedBox(
                  height: 15,
                ),
                staggered_grid(
                    "assets/images/kiwi-juice.png",
                    "assets/images/avocado.png",
                    "assets/images/mango-bubble-tea.jpg"),
                const SizedBox(
                  height: 15,
                ),
                singleLinerow("Breakfast", "See all"),
                const SizedBox(
                  height: 15,
                ),
                staggered_grid("assets/images/thai.jpg",
                    "assets/images/breakfast.png", "assets/images/green.png"),
              ],
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

  StaggeredGrid staggered_grid(String img1, String img2, String img3) {
    // method staggered grid takes arguments img1 img2 img3
    return StaggeredGrid.count(
      // return staggeredgrid.count
      crossAxisCount: 4, //This line sets the number of columns
      mainAxisSpacing: 5, // spacing between rows
      crossAxisSpacing: 5, //pacing between columns

      children: [
        StaggeredGridTile.count(
          crossAxisCellCount:
              3, // This specifies how many columns this tile spans horizontally : 3 for this tile
          mainAxisCellCount:
              2, //This specifies how many rows this tile spans vertically : 2 for this tile
          child: ClipRRect(
            // content with in the tile
            borderRadius:
                BorderRadius.circular(20), // use cliprrect for borderradius
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.orange,
                  image: DecorationImage(
                      image: AssetImage(img1), fit: BoxFit.cover)),
            ),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.orange,
                  image: DecorationImage(
                      image: AssetImage(img2), fit: BoxFit.cover)),
            ),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.orange,
                  image: DecorationImage(
                      image: AssetImage(img3), fit: BoxFit.cover)),
            ),
          ),
        ),
      ],
    );
  }
}
