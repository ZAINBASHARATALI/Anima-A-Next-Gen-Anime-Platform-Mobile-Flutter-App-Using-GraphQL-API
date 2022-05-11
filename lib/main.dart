import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'pages/homepage.dart';

void main() async {
  await initHiveForFlutter();
  final HttpLink httpLink = HttpLink('https://graphql.anilist.co');
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  runApp( MyApp(myclient: client,));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
   MyApp({ Key? key ,required this.myclient}) : super(key: key);
  ValueNotifier<GraphQLClient> myclient;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
   const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark, 
      //set brightness for icons, like dark background light icons
   )
);
    return GraphQLProvider(

      client: myclient,
      child: const CacheProvider(
        child:  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage()
        ),
      ),
    );
  }
}