import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_example/widget/my_textField.dart';
import '../widget/my_text.dart';
import 'register_controller.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void register(BuildContext context) async {
    if (usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        fullNameController.text.isEmpty ||
        emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Semua field harus diisi!'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      bool result = await controller.registerUser(
        usernameController.text,
        passwordController.text,
        fullNameController.text,
        emailController.text,
      );
      if (result == true) Get.toNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            MyTextField(
              hintText: 'Username',
              controller: usernameController,
            ),
            MyTextField(
              hintText: 'Password',
              controller: passwordController,
            ),
            MyTextField(
              hintText: 'Full Name',
              controller: fullNameController,
            ),
            MyTextField(
              hintText: 'Email',
              controller: emailController,
            ),
            SizedBox(height: 20),
            Obx(() {
              return controller.isLoading.value
                  ? Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () => register(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
            }),
            SizedBox(height: 20),
            Obx(() {
              return Text(
                controller.message.value,
                style: TextStyle(color: Colors.green),
              );
            }),
          ],
        ),
      ),
    );
  }
}
