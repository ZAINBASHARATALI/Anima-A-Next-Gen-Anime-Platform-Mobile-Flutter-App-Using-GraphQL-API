import 'package:anilist_gql/utils/queries.dart';
import 'package:anilist_gql/widgets/resultslist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4EAF1),
      appBar: AppBar(
        title: 'Anima'.text.color(Colors.black).letterSpacing(1.5).uppercase.make(),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimeList(
                mainTitle: 'Trending Now',
                query: trendingAnimeQuery,
                variables: 'trending',
              ),
              AnimeList(
                  mainTitle: 'Popular this Season',
                  query: popularAnimeQuery,
                  variables: 'popular'),
              AnimeList(
                mainTitle: 'Upcoming next Season',
                query: upcommingNextSeasonquery,
                variables: 'upcoming',
              ),
              AnimeList(
                mainTitle: 'All time popular',
                query: allTimePopularQuery,
                variables: 'alltime',
              ),
               AnimeList(
                mainTitle: 'Top 100 Anime',
                query: top100AnimeQuery,
                variables: 'top100',
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
