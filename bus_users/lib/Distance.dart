class Distance {
  Distance({
      required this.text,
      required this.value,});

  Distance.fromJson(dynamic json) {
    text = json['text'];
    value = json['value'];
  }
  String? text;
  int? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['value'] = value;
    return map;
  }

}