import 'package:anilist_gql/models/trendinganime.dart';
import 'package:anilist_gql/pages/viewall.dart';
import 'package:anilist_gql/utils/queries.dart';
import 'package:anilist_gql/widgets/listwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class AnimeList extends StatelessWidget {
  AnimeList(
      {Key? key,
      required this.mainTitle,
      required this.query,
      required this.variables})
      : super(key: key);
  String mainTitle;
  String query;
  String variables;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.36,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 5,
            ),
            //color: Colors.amber,
            height: Get.height * 0.04,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                mainTitle.text
                    .minFontSize(16)
                    .fontWeight(FontWeight.w600)
                    .uppercase
                    .make(),
                InkWell(
                    onTap: () {
                      Get.to(() => const ViewAllPage(), arguments: {
                        "title": mainTitle,
                        "query": query,
                        "variables": variables
                      });
                    },
                    child: 'View all'
                        .text
                        .color(Colors.black87)
                        .minFontSize(13)
                        .makeCentered())
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.32,
            child: Query(
              options: QueryOptions(
                document: gql(query),
                variables: returnQuery(1, variables),
              ),
              builder: (QueryResult<Object?> result,
                  {Future<QueryResult<Object?>> Function(FetchMoreOptions)?
                      fetchMore,
                  Future<QueryResult<Object?>?> Function()? refetch}) {
                if (result.hasException) {
                  return const Center(child: Text('No Data Found'));
                }
                if (result.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                TrendingAnime? animedata = TrendingAnime.fromJson(result.data!);
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return ListWidget(
                      itsColor: Vx.randomPrimaryColor,
                      media: animedata.page!.media![index],
                    );
                  }),
                  itemCount: animedata.page?.pageInfo?.perPage,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
