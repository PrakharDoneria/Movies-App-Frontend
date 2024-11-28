import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://movies-backend-api.vercel.app';

  Future<List<dynamic>> getTrendingMovies({String country = 'IN'}) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/trending?country=$country'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['trending'];
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  Future<List<dynamic>> searchMovies(String query) async {
    final response = await http.get(Uri.parse('$_baseUrl/search?query=$query'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['movies'];
    } else {
      throw Exception('Failed to search movies');
    }
  }
}
