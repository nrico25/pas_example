import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_example/controllers/like_controller.dart';
import 'package:pas_example/widget/soccer_card.dart';

class FavoritePage extends StatelessWidget {
  final Likecontroller likecontroller = Get.put(Likecontroller());
  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    likecontroller.loadTasks();
    return Scaffold(
      appBar: AppBar(
        title: Text('Zalora'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Obx(() {
        if (likecontroller.tasks.isEmpty) {
          return Center(
            child: Text('Tidak ada Club yang disukai',
                style: TextStyle(color: Colors.white)),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: likecontroller.tasks.length,
          itemBuilder: (context, index) {
            final dataSoccer = likecontroller.tasks[index];
            return SoccerCard(
              post: dataSoccer,
              allowDeletion: true, // Pass the liked song data to MusicCard
            );
          },
        );
       
      }),
    );
  }
}
