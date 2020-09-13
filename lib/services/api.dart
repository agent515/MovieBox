import 'network_handler.dart';
import 'API_KEYS.dart';

class Api {

  static Future<dynamic> getMovies(int pageNo, String category) async {
    //    https://api.themoviedb.org/3/movie/popular?api_key=70b3fe419bc1af900e38f6e2fa89c1cf&language=en-US&page=1
    String url = "https://api.themoviedb.org/3/movie/$category?api_key=$apiKeyTMDB&language=en-US&page=$pageNo";
    Map<dynamic, dynamic> response =  await NetworkHandler.httpRequest(url);
    return response;
  }

}