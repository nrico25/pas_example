import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_example/controllers/postController.dart';
import 'package:pas_example/widget/soccer_card.dart';

class HomePage extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zalora'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: postController.postList.length,
          itemBuilder: (context, index) => SoccerCard(post: postController.postList[index]),
        );
      }),
    );
  }
}
void main() {
  runApp(GetMaterialApp(
    home: HomePage(),
  ));
}
