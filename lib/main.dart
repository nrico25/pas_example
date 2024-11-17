import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_example/bindings/bindings.dart';
import 'package:pas_example/login/login_page.dart';
import 'package:pas_example/pages/bottom_nav_pages.dart';
import 'package:pas_example/pages/loginPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        //list all pages
        GetPage(
          name: '/',
          page: () => LoginApiPage(),
        ),
        GetPage(
          name: '/bottomnav',
          page: () => BottomNavPage(),
          binding: MyBindings()
        )
      ],
    );
  }
}

