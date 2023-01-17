import 'Distance.dart';
import 'Duration.dart';

class Elements {
  Elements({
      required this.distance,
      required this.duration,
      required this.status,});

  Elements.fromJson(dynamic json) {
    distance = json['distance'] != null ? Distance.fromJson(json['distance']) : null;
    duration = json['duration'] != null ? Duration.fromJson(json['duration']) : null;
    status = json['status'];
  }
  Distance? distance;
  Duration? duration;
  String? status;

   Map<String?, dynamic> toJson() {
    late final map = <String, dynamic>{};
    final distance = this.distance;
    if (distance != null) {
      map['distance'] = distance.toJson();
    }
    final duration = this.duration;
    if (duration != null) {
      map['duration'] = duration.toJson();
    }
    map['status'] = status;
    return map;
  }

}