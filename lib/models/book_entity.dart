import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_entity.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class BookEntity {
  @JsonKey(name: "id")
  @HiveField(0)
  String? id;
  @JsonKey(name: "volumeInfo")
  @HiveField(1)
  VolumeInfo? volumeInfo;

  BookEntity({this.volumeInfo});

  factory BookEntity.fromJson(Map<String, dynamic> json) =>
      _$BookEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BookEntityToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 1)
class VolumeInfo {
  @JsonKey(name: "title")
  @HiveField(0)
  String? title;
  @JsonKey(name: "subtitle")
  @HiveField(1)
  String? subtitle;
  @JsonKey(name: "publisher")
  @HiveField(2)
  String? publisher;
  @JsonKey(name: "publishedDate")
  @HiveField(3)
  String? publishedDate;
  @JsonKey(name: "pageCount")
  @HiveField(4)
  int? pageCount;
  @JsonKey(name: "imageLinks")
  @HiveField(5)
  ImageLinks? imageLinks;
  @JsonKey(name: "authors")
  @HiveField(6)
  List<String>? authors;

  VolumeInfo(
      {this.title,
      this.subtitle,
      this.publisher,
      this.publishedDate,
      this.pageCount,
      this.imageLinks,
      this.authors});

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeInfoToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 2)
class ImageLinks {
  @JsonKey(name: "smallThumbnail")
  @HiveField(0)
  String? smallThumbnail;

  ImageLinks({this.smallThumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksFromJson(json);

  Map<String, dynamic> toJson() => _$ImageLinksToJson(this);
}
