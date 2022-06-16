class User {
  String? _displayName;
  ExternalUrls? _externalUrls;
  Followers? _followers;
  String? _href;
  String? _id;
  List<Images>? _images;
  String? _type;
  String? _uri;

  User(
      {String? displayName,
        ExternalUrls? externalUrls,
        Followers? followers,
        String? href,
        String? id,
        List<Images>? images,
        String? type,
        String? uri}) {
    if (displayName != null) {
      this._displayName = displayName;
    }
    if (externalUrls != null) {
      this._externalUrls = externalUrls;
    }
    if (followers != null) {
      this._followers = followers;
    }
    if (href != null) {
      this._href = href;
    }
    if (id != null) {
      this._id = id;
    }
    if (images != null) {
      this._images = images;
    }
    if (type != null) {
      this._type = type;
    }
    if (uri != null) {
      this._uri = uri;
    }
  }

  String? get displayName => _displayName;
  set displayName(String? displayName) => _displayName = displayName;
  ExternalUrls? get externalUrls => _externalUrls;
  set externalUrls(ExternalUrls? externalUrls) => _externalUrls = externalUrls;
  Followers? get followers => _followers;
  set followers(Followers? followers) => _followers = followers;
  String? get href => _href;
  set href(String? href) => _href = href;
  String? get id => _id;
  set id(String? id) => _id = id;
  List<Images>? get images => _images;
  set images(List<Images>? images) => _images = images;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get uri => _uri;
  set uri(String? uri) => _uri = uri;

  User.fromJson(Map<String, dynamic> json) {
    _displayName = json['display_name'];
    _externalUrls = json['external_urls'] != null
        ? new ExternalUrls.fromJson(json['external_urls'])
        : null;
    _followers = json['followers'] != null
        ? new Followers.fromJson(json['followers'])
        : null;
    _href = json['href'];
    _id = json['id'];
    if (json['images'] != null) {
      _images = <Images>[];
      json['images'].forEach((v) {
        _images!.add(new Images.fromJson(v));
      });
    }
    _type = json['type'];
    _uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_name'] = this._displayName;
    if (this._externalUrls != null) {
      data['external_urls'] = this._externalUrls!.toJson();
    }
    if (this._followers != null) {
      data['followers'] = this._followers!.toJson();
    }
    data['href'] = this._href;
    data['id'] = this._id;
    if (this._images != null) {
      data['images'] = this._images!.map((v) => v.toJson()).toList();
    }
    data['type'] = this._type;
    data['uri'] = this._uri;
    return data;
  }
}

class ExternalUrls {
  String? _spotify;

  ExternalUrls({String? spotify}) {
    if (spotify != null) {
      this._spotify = spotify;
    }
  }

  String? get spotify => _spotify;
  set spotify(String? spotify) => _spotify = spotify;

  ExternalUrls.fromJson(Map<String, dynamic> json) {
    _spotify = json['spotify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spotify'] = this._spotify;
    return data;
  }
}

class Followers {
  Null? _href;
  int? _total;

  Followers({Null? href, int? total}) {
    if (href != null) {
      this._href = href;
    }
    if (total != null) {
      this._total = total;
    }
  }

  Null? get href => _href;
  set href(Null? href) => _href = href;
  int? get total => _total;
  set total(int? total) => _total = total;

  Followers.fromJson(Map<String, dynamic> json) {
    _href = json['href'];
    _total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this._href;
    data['total'] = this._total;
    return data;
  }
}

class Images {
  Null? _height;
  String? _url;
  Null? _width;

  Images({Null? height, String? url, Null? width}) {
    if (height != null) {
      this._height = height;
    }
    if (url != null) {
      this._url = url;
    }
    if (width != null) {
      this._width = width;
    }
  }

  Null? get height => _height;
  set height(Null? height) => _height = height;
  String? get url => _url;
  set url(String? url) => _url = url;
  Null? get width => _width;
  set width(Null? width) => _width = width;

  Images.fromJson(Map<String, dynamic> json) {
    _height = json['height'];
    _url = json['url'];
    _width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this._height;
    data['url'] = this._url;
    data['width'] = this._width;
    return data;
  }
}
