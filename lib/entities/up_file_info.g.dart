// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'up_file_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpFileInfo _$UpFileInfoFromJson(Map<String, dynamic> json) {
  return UpFileInfo(
      json['name'] as String,
      json['thumbnailName'] as String,
      json['nameNoSuffix'] as String,
      json['thumbnailNameNoSuffix'] as String,
      json['filePath'] as String,
      json['dirPath'] as String,
      json['ftpDirPath'] as String,
      json['remoteFilePath'] as String,
      json['remoteFileDirPath'] as String,
      json['md5'] as String,
      json['url'] as String,
      json['thumbnailUrl'] as String,
      json['createTime'] as String);
}

Map<String, dynamic> _$UpFileInfoToJson(UpFileInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'thumbnailName': instance.thumbnailName,
      'nameNoSuffix': instance.nameNoSuffix,
      'thumbnailNameNoSuffix': instance.thumbnailNameNoSuffix,
      'filePath': instance.filePath,
      'dirPath': instance.dirPath,
      'ftpDirPath': instance.ftpDirPath,
      'remoteFilePath': instance.remoteFilePath,
      'remoteFileDirPath': instance.remoteFileDirPath,
      'md5': instance.md5,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
      'createTime': instance.createTime
    };
