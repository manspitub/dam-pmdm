import 'package:dio/dio.dart';
import 'package:movies/models/upcoming.dart';

class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = 'https://api.themovie.org/3';
  final String apiKey = '6f3f957d9d8dc6a98fed68a333b8209c';

  Future<List<Upcoming>> getUpcomingMovies() async {
    try{
      final response await _dio.get('$baseUrl/get-upcoming?$apiKey');
      
    }catch(error, stackTrace){
      throw Exception(
        'Excepcion'
      );
    }
  }


}