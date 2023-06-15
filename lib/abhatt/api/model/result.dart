import 'address_components.dart';

class Result {
  List<AddressComponents>? addressComponents;
  String? adrAddress;
  String? businessStatus;
  String? formattedAddress;
  String? formattedPhoneNumber;
  String? icon;
  String? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? internationalPhoneNumber;
  String? name;
  String? placeId;
  int? rating;
  String? reference;
  List<String>? types;
  String? url;
  int? userRatingsTotal;
  int? utcOffset;
  String? vicinity;
  String? website;

  Result(
      {this.addressComponents,
      this.adrAddress,
      this.businessStatus,
      this.formattedAddress,
      this.formattedPhoneNumber,
      this.icon,
      this.iconBackgroundColor,
      this.iconMaskBaseUri,
      this.internationalPhoneNumber,
      this.name,
      this.placeId,
      this.rating,
      this.reference,
      this.types,
      this.url,
      this.userRatingsTotal,
      this.utcOffset,
      this.vicinity,
      this.website});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['address_components'] != null) {
      addressComponents = <AddressComponents>[];
      json['address_components'].forEach((v) {
        addressComponents!.add(AddressComponents.fromJson(v));
      });
    }
    adrAddress = json['adr_address'];
    businessStatus = json['business_status'];
    formattedAddress = json['formatted_address'];
    formattedPhoneNumber = json['formatted_phone_number'];
    icon = json['icon'];
    iconBackgroundColor = json['icon_background_color'];
    iconMaskBaseUri = json['icon_mask_base_uri'];
    internationalPhoneNumber = json['international_phone_number'];
    name = json['name'];
    placeId = json['place_id'];
    rating = json['rating'];
    reference = json['reference'];
    types = json['types'].cast<String>();
    url = json['url'];
    userRatingsTotal = json['user_ratings_total'];
    utcOffset = json['utc_offset'];
    vicinity = json['vicinity'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (addressComponents != null) {
      data['address_components'] =
          addressComponents!.map((v) => v.toJson()).toList();
    }
    data['adr_address'] = adrAddress;
    data['business_status'] = businessStatus;
    data['formatted_address'] = formattedAddress;
    data['formatted_phone_number'] = formattedPhoneNumber;
    data['icon'] = icon;
    data['icon_background_color'] = iconBackgroundColor;
    data['icon_mask_base_uri'] = iconMaskBaseUri;
    data['international_phone_number'] = internationalPhoneNumber;
    data['name'] = name;
    data['place_id'] = placeId;
    data['rating'] = rating;
    data['reference'] = reference;
    data['types'] = types;
    data['url'] = url;
    data['user_ratings_total'] = userRatingsTotal;
    data['utc_offset'] = utcOffset;
    data['vicinity'] = vicinity;
    data['website'] = website;
    return data;
  }
}
