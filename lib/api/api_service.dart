import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:search_app/api/api_routes.dart';
import 'package:search_app/models/github_response.dart';

class ApiService {
  static Future<List<GithubResponse>?> fetchRepos(String value) async {
    try {
      Response response = await get(Uri.parse('${ApiRoutes.baseUrl}${ApiRoutes.searchRepositories}?q=$value'));
      final Map<String, dynamic> map = json.decode(response.body);

      return List<GithubResponse>.from(
        map['items']
            .map<GithubResponse>(
              (x) => GithubResponse.fromMap(x as Map<String, dynamic>),
            )
            .toList() as List<GithubResponse>,
      );
    } catch (e) {
      log('Error is $e');
      return null;
    }
  }
}
