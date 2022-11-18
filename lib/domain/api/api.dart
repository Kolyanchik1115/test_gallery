import 'dart:convert';
import 'package:gallery_simple/domain/entity/photos.dart';
import 'package:http/http.dart' as http;

class PhotoProvider {
  Future<List<Photo>> getPhotos(int page) async {
    final responce = await http.get(Uri.parse(
        'https://api.unsplash.com/photos/?page=$page&per_page=30&client_id=ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9'));
    if (responce.statusCode == 200) {
      final List<dynamic> userJson = json.decode(responce.body);
      return userJson.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}
