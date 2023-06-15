class Prediction {
  String description;
  List<Map<String, dynamic>> matchedSubstrings;
  String placeId;
  String reference;
  Map<String, dynamic> structuredFormatting;
  List<Map<String, dynamic>> terms;
  List<String> types;

  Prediction(
      {required this.description,
      required this.matchedSubstrings,
      required this.placeId,
      required this.reference,
      required this.structuredFormatting,
      required this.terms,
      required this.types});

  factory Prediction.fromJson(Map<String, dynamic> data) {
    return Prediction(
        description: data['description'],
        matchedSubstrings:
            List<Map<String, dynamic>>.from(data['matched_substrings']),
        placeId: data['place_id'],
        reference: data['reference'],
        structuredFormatting: data['structured_formatting'],
        terms: List<Map<String, dynamic>>.from(data['terms']),
        types: List<String>.from(data['types']));
  }
}
