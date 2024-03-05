import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/model/repository_model.dart';
import 'package:test_riverpod/service/git_hub_service.dart';

final githubServiceProvider = Provider((ref) => GitHubService());

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider =
    FutureProvider<List<RepositoryModel>>((ref) async {
  final query = ref.watch(searchQueryProvider);

  if (query.isEmpty) {
    return [];
  } else {
    final service = ref.watch(githubServiceProvider);
    return service.searchRepositories(query);
  }
});
