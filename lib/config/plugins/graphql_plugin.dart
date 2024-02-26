import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlPlugin {
  static final GraphqlPlugin _instance = GraphqlPlugin._internal();

  factory GraphqlPlugin() {
    return _instance;
  }

  GraphqlPlugin._internal();

  ValueNotifier<GraphQLClient>? client;

  Future<void> initialize(String url) async {
    await initHiveForFlutter();

    final HttpLink httpLink = HttpLink(
      url,
    );

    final Link link = httpLink;

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(store: HiveStore()),
        link: link,
        defaultPolicies: DefaultPolicies(
          query: Policies(
            fetch: FetchPolicy.noCache,
          ),
          watchQuery: Policies(
            fetch: FetchPolicy.noCache,
          ),
          mutate: Policies(
            fetch: FetchPolicy.noCache,
          ),
        ),
      ),
    );

    this.client = client;
  }
}
