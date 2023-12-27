class VideosModel {
  List<Videos>? videos;

  VideosModel({this.videos});

  VideosModel.fromJson(Map<String, dynamic> json) {
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Videos {
  int? id;
  String? reciterName;
  List<VideosVideos>? videosVideos;

  Videos({this.id, this.reciterName, this.videosVideos});

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reciterName = json['reciter_name'];
    if (json['videos'] != null) {
      videosVideos = <VideosVideos>[];
      json['videos'].forEach((v) {
        videosVideos!.add(VideosVideos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['reciter_name'] = reciterName;
    if (videosVideos != null) {
      data['videos'] = videosVideos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VideosVideos {
  int? id;
  int? videoType;
  String? videoUrl;
  String? videoThumbUrl;

  VideosVideos({this.id, this.videoType, this.videoUrl, this.videoThumbUrl});

  VideosVideos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoType = json['video_type'];
    videoUrl = json['video_url'];
    videoThumbUrl = json['video_thumb_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['video_type'] = videoType;
    data['video_url'] = videoUrl;
    data['video_thumb_url'] = videoThumbUrl;
    return data;
  }
}
