class RiwayatModel {
  List<Riwayat>? riwayat;

  RiwayatModel({this.riwayat});

  RiwayatModel.fromJson(Map<String, dynamic> json) {
    if (json['riwayat'] != null) {
      riwayat = <Riwayat>[];
      json['riwayat'].forEach((v) {
        riwayat!.add(Riwayat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (riwayat != null) {
      data['riwayat'] = riwayat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Riwayat {
  int? id;
  String? name;

  Riwayat({this.id, this.name});

  Riwayat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
