import 'dart:math';

import 'package:anilist_gql/models/trendinganime.dart';
import 'package:anilist_gql/pages/detailspage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class ListWidget extends StatelessWidget {
  ListWidget({Key? key, required this.media, required this.itsColor}) : super(key: key);
  Media? media;
  Color itsColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => Get.to(() => const AnimeDetailsPage(), arguments: media)),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.1), width: 0.5),
          boxShadow: [
            BoxShadow(
                color: const Color(0xFFE2E8F1).withOpacity(0.2),
                spreadRadius: 0.1,
                blurRadius: 1),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        width: Get.width * 0.4,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(media!.coverImage!.large.toString(),
                loadingBuilder: ((context, child, loadingProgress){
                  if(loadingProgress==null)
                  {
                    return Image.network(media!.coverImage!.large.toString());
                  }
                  return Container(color: itsColor,);
                }),
                ),
              ),

              //     child: Container(
              //       decoration: BoxDecoration(
              //         boxShadow:  [
              //   BoxShadow(
              //     color:const Color(0xFFE2E8F1).withOpacity(1),
              //     spreadRadius: 2,
              //     blurRadius: 3
              //   ),
              // ],
              //         borderRadius: BorderRadius.circular(10),
              //         image: DecorationImage(
              //           image: NetworkImage(media!.coverImage!.large.toString(),

              //           ),
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     ),
            ),
            SizedBox(
              height: Get.height * 0.04,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                  left: 3,
                  right: 3,
                ),
                child: media!.title!.userPreferred!.text
                    .fontWeight(FontWeight.w600)
                    .color(Colors.black87)
                    .align(TextAlign.center)
                    .fontWeight(FontWeight.w500)
                    .minFontSize(12)
                    .maxFontSize(13)
                    .makeCentered(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
