import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_example/controllers/like_controller.dart';
import 'package:pas_example/controllers/postController.dart';
import 'package:pas_example/model/postModel.dart';

class SoccerCard extends StatelessWidget {
  final PostController postController = Get.put(PostController());
  final Likecontroller likeController = Get.put(Likecontroller());
  final PostModel post;
  bool allowDeletion = false;

  SoccerCard({required this.post, super.key, this.allowDeletion = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Image.network(
              post.strBadge,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.strTeam,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[800],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    post.strLocation,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.teal[600],
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Obx(() {
                      var isLiked = likeController.getLikedById(post.idTeam!).value;
                      return IconButton(
                        onPressed: () {
                          if (isLiked) {
                  if (allowDeletion) {
                    likeController.deleteTask(post.idTeam!);
                    Get.snackbar(
                        'Info', '${post!.strTeam} removed from favorites.',
                        backgroundColor: Colors.teal,
                        colorText: Colors.white);
                  } else {
                    Get.snackbar(
                        'Error', 'You can only remove favorites from Library.',
                        backgroundColor: Colors.teal,
                        colorText: Colors.white);
                  }
                } else {
                  likeController.addTask(post!);
                  Get.snackbar(
                      'Info', '${post!.strTeam} added to favorites.',
                      backgroundColor: Colors.black87, colorText: Colors.white);
                }
                        },
                        icon: Icon(
                          isLiked ? Icons.shopping_cart : Icons.shopping_cart_outlined,
                          color: isLiked ? Colors.teal : Colors.white,
                          size: 24,
                        ));
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
