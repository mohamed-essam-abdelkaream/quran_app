class TafasirModel {
  Tafasir? tafasir;

  TafasirModel({this.tafasir});

  TafasirModel.fromJson(Map<String, dynamic> json) {
    tafasir =
        json['tafasir'] != null ? Tafasir.fromJson(json['tafasir']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tafasir != null) {
      data['tafasir'] = tafasir!.toJson();
    }
    return data;
  }
}

class Tafasir {
  String? name;
  List<Soar>? soar;

  Tafasir({this.name, this.soar});

  Tafasir.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['soar'] != null) {
      soar = <Soar>[];
      json['soar'].forEach((v) {
        soar!.add(Soar.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (soar != null) {
      data['soar'] = soar!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Soar {
  int? id;
  int? suraId;
  int? tafsirId;
  String? url;
  String? name;

  Soar({this.id, this.suraId, this.tafsirId, this.url, this.name});

  Soar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    suraId = json['sura_id'];
    tafsirId = json['tafsir_id'];
    url = json['url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sura_id'] = suraId;
    data['tafsir_id'] = tafsirId;
    data['url'] = url;
    data['name'] = name;
    return data;
  }
}
