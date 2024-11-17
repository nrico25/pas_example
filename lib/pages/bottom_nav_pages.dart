import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_example/controllers/bottomnav_controller.dart';
import 'package:pas_example/pages/menu/favoritePage.dart';
import 'package:pas_example/pages/menu/homePage.dart';
import 'package:pas_example/pages/menu/profilePage.dart';

class BottomNavPage extends StatelessWidget {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    //coneccting controller dengan UI
    final BottomNavController bottomnavController =
        Get.find();

    final List<Widget> menus = [HomePage(),FavoritePage(),ProfilePage()];
    
    return Obx(() {
      return Scaffold(
      body: menus[bottomnavController.selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomnavController.selectedIndex.value,
        onTap: bottomnavController.changeMenu,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),

        ]),
    );
    });
  }
}
