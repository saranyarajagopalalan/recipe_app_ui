import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/add.dart';
import './image_path.dart';
import 'package:recipe_app/widgets/bookmark.dart';
import 'package:recipe_app/widgets/home.dart';
import 'package:recipe_app/widgets/profile.dart';
import 'package:recipe_app/widgets/search.dart';

class bottonavbar extends StatefulWidget {
  const bottonavbar({super.key});
  @override
  State<bottonavbar> createState() => _bottonavbarState();
}

class _bottonavbarState extends State<bottonavbar> {
  // the list include the pages
  final List<Widget> _children = [
    const Home(),
    const Search(),
    const Bookmark(),
    const Profile(),
  ];
  var tabIndex = 0; // the current icon index
  void changeTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[tabIndex],
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Color.fromRGBO(30, 162, 109, 1),
        foregroundColor: Colors.transparent,
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Add())),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        child: AnimatedBottomNavigationBar.builder(
          itemCount: icons.length,
          tabBuilder: (int index, bool isActive) {
            final color =
                isActive ? Color.fromRGBO(30, 162, 109, 1) : Colors.grey;

            return Icon(
              icons[index],
              size: 24,
              color: color,
            );
          },
          activeIndex: tabIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          // leftCornerRadius: 32, // if you want to change the corner radius of the bottom navigation bar
          // rightCornerRadius: 32,
          // onTap: (index) => setState(
          //   () => tabIndex = index,
          // ),
          onTap: changeTabIndex,
          // elevation: 1,
        ),
      ),
    );
  }
}
