import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_riverpod/model/repository_model.dart';

class GitHubService {
  final String api = 'https://api.github.com';
  Future<List<RepositoryModel>> searchRepositories(String query) async {
    final url = Uri.parse('$api/search/repositories?q=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> items = json.decode(response.body)['items'];
      return items
          .map((dynamic item) => RepositoryModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load repositories');
    }
  }
}
