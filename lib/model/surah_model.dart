class SurahModel {
  List<Suwar>? suwar;

  SurahModel({this.suwar});

  SurahModel.fromJson(Map<String, dynamic> json) {
    if (json['suwar'] != null) {
      suwar = <Suwar>[];
      json['suwar'].forEach((v) {
        suwar!.add(Suwar.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (suwar != null) {
      data['suwar'] = suwar!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Suwar {
  int? id;
  String? name;
  int? startPage;
  int? endPage;
  int? makkia;
  int? type;

  Suwar(
      {this.id,
      this.name,
      this.startPage,
      this.endPage,
      this.makkia,
      this.type});

  Suwar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startPage = json['start_page'];
    endPage = json['end_page'];
    makkia = json['makkia'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['start_page'] = startPage;
    data['end_page'] = endPage;
    data['makkia'] = makkia;
    data['type'] = type;
    return data;
  }
}
