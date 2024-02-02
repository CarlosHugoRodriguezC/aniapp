import 'package:anilistapp/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await GraphqlPlugin().initialize('https://graphql.anilist.co');

  runApp(
    ProviderScope(
      child: GraphQLProvider(
        client: GraphqlPlugin().client,
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
