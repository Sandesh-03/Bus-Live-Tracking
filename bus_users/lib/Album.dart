class Album {
  Album({
    List<String>? destinationAddresses,
    List<String>? originAddresses,
    List<Rows>? rows,
    String? status,
  }) {
    _destinationAddresses = destinationAddresses;
    _originAddresses = originAddresses;
    _rows = rows;
    _status = status;
  }

  Album.fromJson(dynamic json) {
    _destinationAddresses = json['destination_addresses'] != null
        ? json['destination_addresses'].cast<String>()
        : [];
    _originAddresses = json['origin_addresses'] != null
        ? json['origin_addresses'].cast<String>()
        : [];
    if (json['rows'] != null) {
      _rows = [];
      json['rows'].forEach((v) {
        _rows?.add(Rows.fromJson(v));
      });
    }
    _status = json['status'];
  }
  List<String>? _destinationAddresses;
  List<String>? _originAddresses;
  List<Rows>? _rows;
  String? _status;
  Album copyWith({
    List<String>? destinationAddresses,
    List<String>? originAddresses,
    List<Rows>? rows,
    String? status,
  }) =>
      Album(
        destinationAddresses: destinationAddresses ?? _destinationAddresses,
        originAddresses: originAddresses ?? _originAddresses,
        rows: rows ?? _rows,
        status: status ?? _status,
      );
  List<String>? get destinationAddresses => _destinationAddresses;
  List<String>? get originAddresses => _originAddresses;
  List<Rows>? get rows => _rows;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['destination_addresses'] = _destinationAddresses;
    map['origin_addresses'] = _originAddresses;
    if (_rows != null) {
      map['rows'] = _rows?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }
}

/// elements : [{"distance":{"text":"4.6 km","value":4628},"duration":{"text":"18 mins","value":1109},"status":"OK"},{"distance":{"text":"13.8 km","value":13758},"duration":{"text":"23 mins","value":1371},"status":"OK"},{"distance":{"text":"25.7 km","value":25676},"duration":{"text":"30 mins","value":1790},"status":"OK"},{"distance":{"text":"21.3 km","value":21306},"duration":{"text":"35 mins","value":2102},"status":"OK"}]

class Rows {
  Rows({
    List<Elements>? elements,
  }) {
    _elements = elements;
  }

  Rows.fromJson(dynamic json) {
    if (json['elements'] != null) {
      _elements = [];
      json['elements'].forEach((v) {
        _elements?.add(Elements.fromJson(v));
      });
    }
  }
  List<Elements>? _elements;
  Rows copyWith({
    List<Elements>? elements,
  }) =>
      Rows(
        elements: elements ?? _elements,
      );
  List<Elements>? get elements => _elements;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_elements != null) {
      map['elements'] = _elements?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// distance : {"text":"4.6 km","value":4628}
/// duration : {"text":"18 mins","value":1109}
/// status : "OK"

class Elements {
  Elements({
    Distance? distance,
    Duration? duration,
    String? status,
  }) {
    _distance = distance;
    _duration = duration;
    _status = status;
  }

  Elements.fromJson(dynamic json) {
    _distance =
        json['distance'] != null ? Distance.fromJson(json['distance']) : null;
    _duration =
        json['duration'] != null ? Duration.fromJson(json['duration']) : null;
    _status = json['status'];
  }
  Distance? _distance;
  Duration? _duration;
  String? _status;
  Elements copyWith({
    Distance? distance,
    Duration? duration,
    String? status,
  }) =>
      Elements(
        distance: distance ?? _distance,
        duration: duration ?? _duration,
        status: status ?? _status,
      );
  Distance? get distance => _distance;
  Duration? get duration => _duration;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_distance != null) {
      map['distance'] = _distance?.toJson();
    }
    if (_duration != null) {
      map['duration'] = _duration?.toJson();
    }
    map['status'] = _status;
    return map;
  }
}

/// text : "18 mins"
/// value : 1109

class Duration {
  Duration({
    String? text,
    num? value,
    required int seconds,
    required int milliseconds,
  }) {
    _text = text;
    _value = value;
  }

  Duration.fromJson(dynamic json) {
    _text = json['text'];
    _value = json['value'];
  }
  String? _text;
  num? _value;
  Duration copyWith({
    String? text,
    num? value,
  }) =>
      Duration(
        text: text ?? _text,
        value: value ?? _value,
        seconds: 0,
        milliseconds: 0,
      );
  String? get text => _text;
  num? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = _text;
    map['value'] = _value;
    return map;
  }
}

/// text : "4.6 km"
/// value : 4628

class Distance {
  Distance({
    String? text,
    num? value,
  }) {
    _text = text;
    _value = value;
  }

  Distance.fromJson(dynamic json) {
    _text = json['text'];
    _value = json['value'];
  }
  String? _text;
  num? _value;
  Distance copyWith({
    String? text,
    num? value,
  }) =>
      Distance(
        text: text ?? _text,
        value: value ?? _value,
      );
  String? get text => _text;
  num? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = _text;
    map['value'] = _value;
    return map;
  }
}
