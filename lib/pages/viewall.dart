import 'package:anilist_gql/models/trendinganime.dart';
import 'package:anilist_gql/utils/queries.dart';
import 'package:anilist_gql/widgets/listwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class ViewAllPage extends StatefulWidget {
  const ViewAllPage({Key? key}) : super(key: key);

  @override
  State<ViewAllPage> createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
  late ScrollController _controller;
  int _page = 1;
  List<Media?> listData = [];
  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        _page++;
      });
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> getArguments = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: getArguments["title"].toString().text.uppercase.make(),
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Query(
              options: QueryOptions(
                document: gql(getArguments["query"]),
                variables: returnQuery(_page, getArguments["variables"]),
              ),
              builder: (result, {fetchMore, refetch}) {
                if (result.hasException) {
                  return Center(
                    child: 'No Data'.text.make(),
                  );
                }
                if (result.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                TrendingAnime? dataall = TrendingAnime.fromJson(result.data!);
                int i = 0;
                while (i < 10) {
                  listData.add(dataall.page?.media?[i]);
                  i++;
                }
                return GridView.builder(
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                  controller: _controller,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 0,
                    childAspectRatio: 2 / 3,
                  ),
                  itemBuilder: (context, index) {
                    return ListWidget(
                      itsColor: Vx.randomPrimaryColor,
                      media: listData[index],
                    );
                  },
                  itemCount: listData.length,
                );
              })),
    );
  }
}
