import 'package:json_annotation/json_annotation.dart';
import 'package:my_book_shelf/features/domain/entities/book_entity.dart';

part 'search_entity.g.dart';

@JsonSerializable()
class SearchEntity {
  @JsonKey(name: "items")
  List<BookEntity>? items;

  SearchEntity({this.items});

  factory SearchEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SearchEntityToJson(this);
}
