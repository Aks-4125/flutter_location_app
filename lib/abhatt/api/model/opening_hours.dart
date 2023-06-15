import 'periods.dart';

class OpeningHours {
  bool? openNow;
  List<Periods>? periods;
  List<String>? weekdayText;

  OpeningHours({this.openNow, this.periods, this.weekdayText});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    openNow = json['open_now'];
    if (json['periods'] != null) {
      periods = <Periods>[];
      json['periods'].forEach((v) {
        periods!.add(Periods.fromJson(v));
      });
    }
    weekdayText = json['weekday_text'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['open_now'] = openNow;
    if (periods != null) {
      data['periods'] = periods!.map((v) => v.toJson()).toList();
    }
    data['weekday_text'] = weekdayText;
    return data;
  }
}
