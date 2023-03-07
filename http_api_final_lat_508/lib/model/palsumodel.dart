//cara membuat model dengan cepat pakai situs quicktype.io
//caranya 1.klik open quick type
//2. buka reqres.in
//3. copy salah satu datanya (yang list users)
//4. pilih bahasa pemrograman dart di kanan
//5. paste ke quicktype

// kesini kalau mau convert data https://app.quicktype.io/

// To parse this JSON data, do
//
//     final palsuModel = palsuModelFromJson(jsonString);

import 'dart:convert';

PalsuModel palsuModelFromJson(String str) =>
    PalsuModel.fromJson(json.decode(str));

String palsuModelToJson(PalsuModel data) => json.encode(data.toJson());

class PalsuModel {
  PalsuModel({
    required this.confirmed,
    required this.recovered,
    required this.deaths,
    required this.dailySummary,
    required this.dailyTimeSeries,
    required this.image,
    required this.source,
    required this.countries,
    required this.countryDetail,
    required this.lastUpdate,
  });

  Confirmed confirmed;
  Confirmed recovered;
  Confirmed deaths;
  String dailySummary;
  CountryDetail dailyTimeSeries;
  String image;
  String source;
  String countries;
  CountryDetail countryDetail;
  DateTime lastUpdate;

  factory PalsuModel.fromJson(Map<String, dynamic> json) => PalsuModel(
        confirmed: Confirmed.fromJson(json["confirmed"]),
        recovered: Confirmed.fromJson(json["recovered"]),
        deaths: Confirmed.fromJson(json["deaths"]),
        dailySummary: json["dailySummary"],
        dailyTimeSeries: CountryDetail.fromJson(json["dailyTimeSeries"]),
        image: json["image"],
        source: json["source"],
        countries: json["countries"],
        countryDetail: CountryDetail.fromJson(json["countryDetail"]),
        lastUpdate: DateTime.parse(json["lastUpdate"]),
      );

  Map<String, dynamic> toJson() => {
        "confirmed": confirmed.toJson(),
        "recovered": recovered.toJson(),
        "deaths": deaths.toJson(),
        "dailySummary": dailySummary,
        "dailyTimeSeries": dailyTimeSeries.toJson(),
        "image": image,
        "source": source,
        "countries": countries,
        "countryDetail": countryDetail.toJson(),
        "lastUpdate": lastUpdate.toIso8601String(),
      };
}

class Confirmed {
  Confirmed({
    required this.value,
    required this.detail,
  });

  int value;
  String detail;

  factory Confirmed.fromJson(Map<String, dynamic> json) => Confirmed(
        value: json["value"],
        detail: json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "detail": detail,
      };
}

class CountryDetail {
  CountryDetail({
    required this.pattern,
    required this.example,
  });

  String pattern;
  String example;

  factory CountryDetail.fromJson(Map<String, dynamic> json) => CountryDetail(
        pattern: json["pattern"],
        example: json["example"],
      );

  Map<String, dynamic> toJson() => {
        "pattern": pattern,
        "example": example,
      };
}
