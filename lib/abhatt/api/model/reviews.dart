class Reviews {
  String? authorName;
  String? authorUrl;
  String? language;
  String? profilePhotoUrl;
  int? rating;
  String? relativeTimeDescription;
  String? text;
  int? time;

  Reviews(
      {this.authorName,
      this.authorUrl,
      this.language,
      this.profilePhotoUrl,
      this.rating,
      this.relativeTimeDescription,
      this.text,
      this.time});

  Reviews.fromJson(Map<String, dynamic> json) {
    authorName = json['author_name'];
    authorUrl = json['author_url'];
    language = json['language'];
    profilePhotoUrl = json['profile_photo_url'];
    rating = json['rating'];
    relativeTimeDescription = json['relative_time_description'];
    text = json['text'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author_name'] = authorName;
    data['author_url'] = authorUrl;
    data['language'] = language;
    data['profile_photo_url'] = profilePhotoUrl;
    data['rating'] = rating;
    data['relative_time_description'] = relativeTimeDescription;
    data['text'] = text;
    data['time'] = time;
    return data;
  }
}
