import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model/place_details.dart';
import 'model/prediction.dart';
import 'model/result.dart';

class PlacesService {
  PlacesService({required this.sessionId, required this.apiKey});
  final String sessionId;
  final String apiKey;
  Future<List<Prediction>> fetchPredictions(String term) async {
    final url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$term&radius=50000&sessiontoken=$sessionId&key=$apiKey&types=address";
    final res = await http.get(Uri.parse(url));
    final json = jsonDecode(res.body);
    final data = List<Map<String, dynamic>>.from(json['predictions']);
    final ps = data.map((e) => Prediction.fromJson(e));
    return ps.toList();
  }

  Future<Result?> fetchDetails(String placeId) async {
    final url =
        "https://maps.googleapis.com/maps/api/place/details/json?fields=&place_id=$placeId&key=$apiKey&sessiontoken=$sessionId&fields=address_components,adr_address,formatted_address,geometry";
    final res = await http.get(Uri.parse(url));
    final json = jsonDecode(res.body);
    final data = PlaceDetails.fromJson(json);
    return data.result;
  }
}
