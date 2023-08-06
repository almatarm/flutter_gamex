import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gamex/repository/exceptions/result_error.dart';
import 'package:gamex/repository/models/genre.dart';
import 'package:http/http.dart' as http;

class GameService {
  final String baseUrl;
  final http.Client _httpClient;

  GameService(
      {this.baseUrl = 'https://api.rawg.io/api', http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Uri getUrl({
    required String url,
    Map<String, String>? extraParameters,
  }) {
    final queryParameters = <String, String>{'key': dotenv.get('RAWG_API_KEY')};
    if (extraParameters != null) {
      queryParameters.addAll(extraParameters);
    }

    return Uri.parse('$baseUrl/$url').replace(
      queryParameters: queryParameters,
    );
  }

  Future<List<Genre>> getGenres() async {
    final response = await _httpClient.get(getUrl(url: 'genres'));

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return List<Genre>.from(
          json.decode(response.body)['results'].map(
                (data) => Genre.fromJson(data),
              ),
        );
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingGames('Error getting genres');
    }
  }
}
