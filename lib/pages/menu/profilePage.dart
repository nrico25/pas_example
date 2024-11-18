import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_example/controllers/username_controller.dart';
import 'package:pas_example/widget/mycolor.dart';

class ProfilePage extends StatelessWidget {
  final UserController usercontroller = Get.put(UserController()); 
   ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: darkBlue,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(50)),
                ),
              ),
            ],
          ),
          SizedBox(height: 60),
          Obx(() {
            return Text(
              "Hi, ${usercontroller.username.value}",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: darkBlue,
              ),
            );
          }),
           SizedBox(height: 50),
          ListTile(
            leading: Icon(Icons.settings_outlined, color: darkBlue),
            title: Text("Settings",
                style: TextStyle(color: darkBlue, fontSize: 18)),
            trailing: Icon(Icons.arrow_forward_ios, color: darkBlue),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications_none_outlined, color: darkBlue),
            title: Text("Notification",
                style: TextStyle(color: darkBlue, fontSize: 18)),
            trailing: Icon(Icons.arrow_forward_ios, color: darkBlue),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info_outline, color: darkBlue),
            title: Text("Terms and Service",
                style: TextStyle(color: darkBlue, fontSize: 18)),
            trailing: Icon(Icons.arrow_forward_ios, color: darkBlue),
            onTap: () {},
          ),
           ListTile(
            leading: Icon(Icons.logout_outlined, color: darkBlue),
            title: Text("Log Out",
                style: TextStyle(color: darkBlue, fontSize: 18)),
            trailing: Icon(Icons.arrow_forward_ios, color: darkBlue),
            onTap: () {
                 Get.toNamed('/');
            },
          ),
                     
      
        ],
      ),
    );
  
  }
}