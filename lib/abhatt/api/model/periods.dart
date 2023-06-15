import 'close.dart';

class Periods {
  Close? close;
  Close? open;

  Periods({this.close, this.open});

  Periods.fromJson(Map<String, dynamic> json) {
    close = json['close'] != null ? Close.fromJson(json['close']) : null;
    open = json['open'] != null ? Close.fromJson(json['open']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (close != null) {
      data['close'] = close!.toJson();
    }
    if (open != null) {
      data['open'] = open!.toJson();
    }
    return data;
  }
}
