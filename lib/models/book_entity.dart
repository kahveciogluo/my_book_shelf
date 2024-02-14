import 'package:json_annotation/json_annotation.dart';

part 'book_entity.g.dart';

@JsonSerializable()
class BookEntity {
  @JsonKey(name: "volumeInfo")
  VolumeInfo? volumeInfo;

  BookEntity({this.volumeInfo});

  factory BookEntity.fromJson(Map<String, dynamic> json) =>
      _$BookEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BookEntityToJson(this);
}

@JsonSerializable()
class VolumeInfo {
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "subtitle")
  String? subtitle;
  @JsonKey(name: "publisher")
  String? publisher;
  @JsonKey(name: "publishedDate")
  String? publishedDate;
  @JsonKey(name: "pageCount")
  int? pageCount;
  @JsonKey(name: "imageLinks")
  ImageLinks? imageLinks;
  @JsonKey(name: "authors")
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
class ImageLinks {
  @JsonKey(name: "smallThumbnail")
  String? smallThumbnail;

  ImageLinks({this.smallThumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksFromJson(json);

  Map<String, dynamic> toJson() => _$ImageLinksToJson(this);
}
