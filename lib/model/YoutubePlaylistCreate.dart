
class YoutubePlaylistCreate {
  String? kind;
  String? etag;
  String? id;

  YoutubePlaylistCreate({this.kind, this.etag, this.id});

  YoutubePlaylistCreate.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    etag = json['etag'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['etag'] = this.etag;
    data['id'] = this.id;
    return data;
  }
}
