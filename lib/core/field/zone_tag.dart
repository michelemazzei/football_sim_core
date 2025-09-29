import 'package:freezed_annotation/freezed_annotation.dart';

part 'zone_tag.freezed.dart';

@freezed
abstract class ZoneTag with _$ZoneTag {
  factory ZoneTag(String name) = _ZoneTag;
}
