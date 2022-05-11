import 'package:anilist_gql/models/animes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AnimeDetailsPage extends StatelessWidget {
  const AnimeDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Media val = Get.arguments;
    return Scaffold(
      backgroundColor: const Color(0xFFE4EAF1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: 'Details Page'.text.make(),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.27,
              child: Stack(
                children: [
                  Container(
                    height: Get.height * 0.2,
                    decoration: BoxDecoration(
                      image: val.bannerImage.isEmptyOrNull
                          ? null
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                val.bannerImage.toString(),
                              ),
                            ),
                    ),
                  ),
                  Positioned(
                    left: Get.width * 0.04,
                    bottom: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 5,
                            ),
                          ),
                          height: Get.height * 0.15,
                          child: Image.network(
                            val.coverImage!.large.toString(),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.05,
                        ),
                        SizedBox(
                          width: Get.width * 0.5,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: 'Add to List'.text.makeCentered(),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                              color: Colors.red,
                              padding: const EdgeInsets.all(6),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.05,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: val.title!.userPreferred!.text
                  .minFontSize(18)
                  .fontWeight(FontWeight.w500)
                  .center
                  .makeCentered(),
            ),
            Container(
              height: Get.height * 0.13,
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          'Format'.text.fontWeight(FontWeight.w500).make(),
                          val.format!.text.make(),
                        ],
                      ),
                      Column(
                        children: [
                          'Episode Duration'
                              .text
                              .fontWeight(FontWeight.w500)
                              .make(),
                          Text(val.duration == null
                              ? 'Not Available'
                              : val.duration!.toString() + ' mins'),
                          // (val.duration!.toString() + ' mins').text.make(),
                        ],
                      ),
                      Column(
                        children: [
                          'Popularity'.text.fontWeight(FontWeight.w500).make(),
                          val.popularity!.text.make(),
                        ],
                      ),
                      Column(
                        children: [
                          'Avg. Score'.text.fontWeight(FontWeight.w500).make(),
                          Text(val.averageScore == null
                              ? 'Not Available'
                              : (val.averageScore!.toString() + ' %'))
                          // (val.averageScore!.toString() + ' %').text.make(),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          'Season'.text.fontWeight(FontWeight.w500).make(),
                          val.season!.text.make(),
                        ],
                      ),
                      Column(
                        children: [
                          'Status'.text.fontWeight(FontWeight.w500).make(),
                          (val.status!).text.make(),
                        ],
                      ),
                      Column(
                        children: [
                          'Type'.text.fontWeight(FontWeight.w500).make(),
                          val.type!.text.make(),
                        ],
                      ),
                      Column(
                        children: [
                          'Season Year'.text.fontWeight(FontWeight.w500).make(),
                          (val.seasonYear!).text.make(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: 'Description'
                  .text
                  .minFontSize(16)
                  .fontWeight(FontWeight.w500)
                  .make(),
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: val.description!.text.justify.make(),
            ))),
          ],
        ),
      ),
    );
  }
}
