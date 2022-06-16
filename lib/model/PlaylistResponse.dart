class PlaylistResponse {
  String? _href;
  List<Items>? _items;
  int? _limit;
  Null? _next;
  int? _offset;
  Null? _previous;
  int? _total;

  PlaylistResponse(
      {String? href,
        List<Items>? items,
        int? limit,
        Null? next,
        int? offset,
        Null? previous,
        int? total}) {
    if (href != null) {
      this._href = href;
    }
    if (items != null) {
      this._items = items;
    }
    if (limit != null) {
      this._limit = limit;
    }
    if (next != null) {
      this._next = next;
    }
    if (offset != null) {
      this._offset = offset;
    }
    if (previous != null) {
      this._previous = previous;
    }
    if (total != null) {
      this._total = total;
    }
  }

  String? get href => _href;
  set href(String? href) => _href = href;
  List<Items>? get items => _items;
  set items(List<Items>? items) => _items = items;
  int? get limit => _limit;
  set limit(int? limit) => _limit = limit;
  Null? get next => _next;
  set next(Null? next) => _next = next;
  int? get offset => _offset;
  set offset(int? offset) => _offset = offset;
  Null? get previous => _previous;
  set previous(Null? previous) => _previous = previous;
  int? get total => _total;
  set total(int? total) => _total = total;

  PlaylistResponse.fromJson(Map<String, dynamic> json) {
    _href = json['href'];
    if (json['items'] != null) {
      _items = <Items>[];
      json['items'].forEach((v) {
        _items!.add(new Items.fromJson(v));
      });
    }
    _limit = json['limit'];
    _next = json['next'];
    _offset = json['offset'];
    _previous = json['previous'];
    _total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this._href;
    if (this._items != null) {
      data['items'] = this._items!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this._limit;
    data['next'] = this._next;
    data['offset'] = this._offset;
    data['previous'] = this._previous;
    data['total'] = this._total;
    return data;
  }
}

class Items {
  bool? _collaborative;
  String? _description;
  ExternalUrls? _externalUrls;
  String? _href;
  String? _id;
  List<Images>? _images;
  String? _name;
  Owner? _owner;
  Null? _primaryColor;
  bool? _public;
  String? _snapshotId;
  Tracks? _tracks;
  String? _type;
  String? _uri;

  Items(
      {bool? collaborative,
        String? description,
        ExternalUrls? externalUrls,
        String? href,
        String? id,
        List<Images>? images,
        String? name,
        Owner? owner,
        Null? primaryColor,
        bool? public,
        String? snapshotId,
        Tracks? tracks,
        String? type,
        String? uri}) {
    if (collaborative != null) {
      this._collaborative = collaborative;
    }
    if (description != null) {
      this._description = description;
    }
    if (externalUrls != null) {
      this._externalUrls = externalUrls;
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
    if (name != null) {
      this._name = name;
    }
    if (owner != null) {
      this._owner = owner;
    }
    if (primaryColor != null) {
      this._primaryColor = primaryColor;
    }
    if (public != null) {
      this._public = public;
    }
    if (snapshotId != null) {
      this._snapshotId = snapshotId;
    }
    if (tracks != null) {
      this._tracks = tracks;
    }
    if (type != null) {
      this._type = type;
    }
    if (uri != null) {
      this._uri = uri;
    }
  }

  bool? get collaborative => _collaborative;
  set collaborative(bool? collaborative) => _collaborative = collaborative;
  String? get description => _description;
  set description(String? description) => _description = description;
  ExternalUrls? get externalUrls => _externalUrls;
  set externalUrls(ExternalUrls? externalUrls) => _externalUrls = externalUrls;
  String? get href => _href;
  set href(String? href) => _href = href;
  String? get id => _id;
  set id(String? id) => _id = id;
  List<Images>? get images => _images;
  set images(List<Images>? images) => _images = images;
  String? get name => _name;
  set name(String? name) => _name = name;
  Owner? get owner => _owner;
  set owner(Owner? owner) => _owner = owner;
  Null? get primaryColor => _primaryColor;
  set primaryColor(Null? primaryColor) => _primaryColor = primaryColor;
  bool? get public => _public;
  set public(bool? public) => _public = public;
  String? get snapshotId => _snapshotId;
  set snapshotId(String? snapshotId) => _snapshotId = snapshotId;
  Tracks? get tracks => _tracks;
  set tracks(Tracks? tracks) => _tracks = tracks;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get uri => _uri;
  set uri(String? uri) => _uri = uri;

  Items.fromJson(Map<String, dynamic> json) {
    _collaborative = json['collaborative'];
    _description = json['description'];
    _externalUrls = json['external_urls'] != null
        ? new ExternalUrls.fromJson(json['external_urls'])
        : null;
    _href = json['href'];
    _id = json['id'];
    if (json['images'] != null) {
      _images = <Images>[];
      json['images'].forEach((v) {
        _images!.add(new Images.fromJson(v));
      });
    }
    _name = json['name'];
    _owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    _primaryColor = json['primary_color'];
    _public = json['public'];
    _snapshotId = json['snapshot_id'];
    _tracks =
    json['tracks'] != null ? new Tracks.fromJson(json['tracks']) : null;
    _type = json['type'];
    _uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collaborative'] = this._collaborative;
    data['description'] = this._description;
    if (this._externalUrls != null) {
      data['external_urls'] = this._externalUrls!.toJson();
    }
    data['href'] = this._href;
    data['id'] = this._id;
    if (this._images != null) {
      data['images'] = this._images!.map((v) => v.toJson()).toList();
    }
    data['name'] = this._name;
    if (this._owner != null) {
      data['owner'] = this._owner!.toJson();
    }
    data['primary_color'] = this._primaryColor;
    data['public'] = this._public;
    data['snapshot_id'] = this._snapshotId;
    if (this._tracks != null) {
      data['tracks'] = this._tracks!.toJson();
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

class Images {
  int? _height;
  String? _url;
  int? _width;

  Images({int? height, String? url, int? width}) {
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

  int? get height => _height;
  set height(int? height) => _height = height;
  String? get url => _url;
  set url(String? url) => _url = url;
  int? get width => _width;
  set width(int? width) => _width = width;

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

class Owner {
  String? _displayName;
  ExternalUrls? _externalUrls;
  String? _href;
  String? _id;
  String? _type;
  String? _uri;

  Owner(
      {String? displayName,
        ExternalUrls? externalUrls,
        String? href,
        String? id,
        String? type,
        String? uri}) {
    if (displayName != null) {
      this._displayName = displayName;
    }
    if (externalUrls != null) {
      this._externalUrls = externalUrls;
    }
    if (href != null) {
      this._href = href;
    }
    if (id != null) {
      this._id = id;
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
  String? get href => _href;
  set href(String? href) => _href = href;
  String? get id => _id;
  set id(String? id) => _id = id;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get uri => _uri;
  set uri(String? uri) => _uri = uri;

  Owner.fromJson(Map<String, dynamic> json) {
    _displayName = json['display_name'];
    _externalUrls = json['external_urls'] != null
        ? new ExternalUrls.fromJson(json['external_urls'])
        : null;
    _href = json['href'];
    _id = json['id'];
    _type = json['type'];
    _uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_name'] = this._displayName;
    if (this._externalUrls != null) {
      data['external_urls'] = this._externalUrls!.toJson();
    }
    data['href'] = this._href;
    data['id'] = this._id;
    data['type'] = this._type;
    data['uri'] = this._uri;
    return data;
  }
}

class Tracks {
  String? _href;
  int? _total;

  Tracks({String? href, int? total}) {
    if (href != null) {
      this._href = href;
    }
    if (total != null) {
      this._total = total;
    }
  }

  String? get href => _href;
  set href(String? href) => _href = href;
  int? get total => _total;
  set total(int? total) => _total = total;

  Tracks.fromJson(Map<String, dynamic> json) {
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
