// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookEntityAdapter extends TypeAdapter<BookEntity> {
  @override
  final int typeId = 0;

  @override
  BookEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookEntity(
      volumeInfo: fields[1] as VolumeInfo?,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, BookEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.volumeInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VolumeInfoAdapter extends TypeAdapter<VolumeInfo> {
  @override
  final int typeId = 1;

  @override
  VolumeInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VolumeInfo(
      title: fields[0] as String?,
      subtitle: fields[1] as String?,
      publisher: fields[2] as String?,
      publishedDate: fields[3] as String?,
      pageCount: fields[4] as int?,
      imageLinks: fields[5] as ImageLinks?,
      authors: (fields[6] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, VolumeInfo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subtitle)
      ..writeByte(2)
      ..write(obj.publisher)
      ..writeByte(3)
      ..write(obj.publishedDate)
      ..writeByte(4)
      ..write(obj.pageCount)
      ..writeByte(5)
      ..write(obj.imageLinks)
      ..writeByte(6)
      ..write(obj.authors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VolumeInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImageLinksAdapter extends TypeAdapter<ImageLinks> {
  @override
  final int typeId = 2;

  @override
  ImageLinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageLinks(
      smallThumbnail: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ImageLinks obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.smallThumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageLinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookEntity _$BookEntityFromJson(Map<String, dynamic> json) => BookEntity(
      volumeInfo: json['volumeInfo'] == null
          ? null
          : VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
    )..id = json['id'] as String?;

Map<String, dynamic> _$BookEntityToJson(BookEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'volumeInfo': instance.volumeInfo,
    };

VolumeInfo _$VolumeInfoFromJson(Map<String, dynamic> json) => VolumeInfo(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      publisher: json['publisher'] as String?,
      publishedDate: json['publishedDate'] as String?,
      pageCount: json['pageCount'] as int?,
      imageLinks: json['imageLinks'] == null
          ? null
          : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$VolumeInfoToJson(VolumeInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'publisher': instance.publisher,
      'publishedDate': instance.publishedDate,
      'pageCount': instance.pageCount,
      'imageLinks': instance.imageLinks,
      'authors': instance.authors,
    };

ImageLinks _$ImageLinksFromJson(Map<String, dynamic> json) => ImageLinks(
      smallThumbnail: json['smallThumbnail'] as String?,
    );

Map<String, dynamic> _$ImageLinksToJson(ImageLinks instance) =>
    <String, dynamic>{
      'smallThumbnail': instance.smallThumbnail,
    };
