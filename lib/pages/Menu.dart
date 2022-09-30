import 'package:bdn_test/pages/dashboard/dashboard.dart';
import 'package:bdn_test/pages/setting/Setting.dart';
import 'package:bdn_test/tools/ColorsResource.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  int currentPage;

  Menu({Key? key, this.currentPage = 0}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List pages = [
    Dashboard(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: pages[widget.currentPage],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                widget.currentPage = index;
              });
            },
            backgroundColor: Colors.white,
            selectedItemColor: primaryColor,
            unselectedItemColor: greyTextVisi,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: widget.currentPage,
            elevation: 10,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined), label: "setting"),
            ],
          ),
        ));
  }
}
