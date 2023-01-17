import 'Elements.dart';

class Rows {
  Rows({
      required this.elements,});

  Rows.fromJson(dynamic json) {
    if (json['elements'] != null) {
      elements = [];
      json['elements'].forEach((v) {
        elements.add(Elements.fromJson(v));
      });
    }
  }
 late List<Elements> elements;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (elements != null) {
      map['elements'] = elements.map((v) => v.toJson()).toList();
    }
    return map;
  }

}