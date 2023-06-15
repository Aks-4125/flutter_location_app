import 'result.dart';

class PlaceDetails {
  List<String>? htmlAttributions;
  Result? result;
  String? status;

  PlaceDetails({this.htmlAttributions, this.result, this.status});

  PlaceDetails.fromJson(Map<String, dynamic> json) {
    if (json['html_attributions'] != null) {
      htmlAttributions = <String>[];
      json['html_attributions'].forEach((v) {
        htmlAttributions!.add(v);
      });
    }
    result =
        json['result'] != null ? Result.fromJson(json['result']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (htmlAttributions != null) {
      data['html_attributions'] = htmlAttributions!.map((v) => v).toList();
    }
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['status'] = status;
    return data;
  }
}
