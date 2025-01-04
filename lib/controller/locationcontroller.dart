import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projectapp/model/locationmodel.dart';

class ControlClass {

  ControlClass();

  Future<List<ModelClass>> getPlaceSuggestions(String input) async {
    final String apikey="AIzaSyBNH2IQQ0zy3KzmI8y5K_qAFU-wKIC-WmE";
    final String baseUrl = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    final Uri uri = Uri.parse('$baseUrl?input=$input&key=$apikey&components=country:us');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List predictions = json.decode(response.body)['predictions'];
        return predictions.map((e) => ModelClass.fromJson(e)).toList();
      } else {
        throw Exception('Failed to fetch suggestions');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
