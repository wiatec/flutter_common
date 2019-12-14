import 'package:json_annotation/json_annotation.dart';
part 'up_file_info.g.dart';

@JsonSerializable()
class UpFileInfo extends Object{

  @JsonKey()
  String name;

  @JsonKey()
  String thumbnailName;

  @JsonKey()
  String nameNoSuffix;

  @JsonKey()
  String thumbnailNameNoSuffix;

  @JsonKey()
  String filePath;

  @JsonKey()
  String dirPath;

  @JsonKey()
  String ftpDirPath;

  @JsonKey()
  String remoteFilePath;

  @JsonKey()
  String remoteFileDirPath;

  @JsonKey()
  String md5;

  @JsonKey()
  String url;

  @JsonKey()
  String thumbnailUrl;

  @JsonKey()
  String createTime;

  factory UpFileInfo.fromJson(Map<String, dynamic> json) => _$UpFileInfoFromJson(json);

  UpFileInfo(this.name, this.thumbnailName, this.nameNoSuffix,
      this.thumbnailNameNoSuffix, this.filePath, this.dirPath, this.ftpDirPath,
      this.remoteFilePath, this.remoteFileDirPath, this.md5, this.url,
      this.thumbnailUrl, this.createTime);

  @override
  String toString() {
    return 'UpFileInfo{name: $name, thumbnailName: $thumbnailName, nameNoSuffix: $nameNoSuffix, thumbnailNameNoSuffix: $thumbnailNameNoSuffix, filePath: $filePath, dirPath: $dirPath, ftpDirPath: $ftpDirPath, remoteFilePath: $remoteFilePath, remoteFileDirPath: $remoteFileDirPath, md5: $md5, url: $url, thumbnailUrl: $thumbnailUrl, createTime: $createTime}';
  }


}