import 'network_handler.dart';
import 'API_KEYS.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static Future<dynamic> getMovies(int pageNo, String category) async {
    //    https://api.themoviedb.org/3/movie/popular?api_key=70b3fe419bc1af900e38f6e2fa89c1cf&language=en-US&page=1
    String url =
        "https://api.themoviedb.org/3/movie/$category?api_key=$apiKeyTMDB&language=en-US&page=$pageNo";
    Map<dynamic, dynamic> response = await NetworkHandler.httpRequest(url);
    return response;
  }

  static Future<dynamic> getDetails(int id, String category) async {
    //  https://api.themoviedb.org/3/movie/14817?api_key=70b3fe419bc1af900e38f6e2fa89c1cf&language=en-US
    String url =
        "https://api.themoviedb.org/3/$category/$id?api_key=$apiKeyTMDB&language=en-US";
    Map<dynamic, dynamic> response = await NetworkHandler.httpRequest(url);
    return response;
  }

  static Future<dynamic> search(String query, String category,
      {int pageNo = 1,
      String lang = "en-US",
      int year,
      String region,
      int releaseYear,
      bool includeAdult = false}) async {
    // https://api.themoviedb.org/3/search/movie?api_key=70b3fe419bc1af900e38f6e2fa89c1cf&language=en-US&query=joker&page=1&include_adult=false
    // TODO: add filters in the query
    String url =
        "https://api.themoviedb.org/3/search/$category?api_key=$apiKeyTMDB&language=$lang&query=$query&page=${pageNo.toString()}&include_adult=${includeAdult.toString()}";
    Map<dynamic, dynamic> response = await NetworkHandler.httpRequest(url);
    return response;
  }

  static Future<dynamic> getVideoLink(String ImdbId) async {
    String url =
        "https://imdb-internet-movie-database-unofficial.p.rapidapi.com/film/$ImdbId";
    http.Response res = await http.get((url), headers: {
      "x-rapidapi-host":
          "imdb-internet-movie-database-unofficial.p.rapidapi.com",
      "x-rapidapi-key": "b90d14fcd0msh89be01094cab7fap14e6a0jsn783bb007bd9a",
    });
    Map<dynamic, dynamic> response = JsonDecoder().convert(res.body);
    return response["trailer"]["link"];
  }

  static Future<dynamic> getCastCrew(int id) async {
    // https://api.themoviedb.org/3/movie/$id/credits?api_key=$apiKeyTMDB
    String url = "https://api.themoviedb.org/3/movie/$id/credits?api_key=$apiKeyTMDB";
    Map<dynamic, dynamic> response = await NetworkHandler.httpRequest(url);
    return response;
  }

  static Future<dynamic> getReviews(int id, {int pageNo = 1}) async {
    // https://api.themoviedb.org/3/movie/475557/reviews?api_key=70b3fe419bc1af900e38f6e2fa89c1cf&language=en-US&page=1
    String url = "https://api.themoviedb.org/3/movie/$id/reviews?api_key=70b3fe419bc1af900e38f6e2fa89c1cf&language=en-US&page=$pageNo";
    Map<dynamic, dynamic> response = await NetworkHandler.httpRequest(url);
    return response;
  }
}
