import 'dart:io';
import 'package:device_info/device_info.dart';
import 'dart:async';

class CommonDevice{

  static final DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();

  static bool isAndroid(){
    return Platform.isAndroid;
  }

  static bool isIos(){
    return Platform.isIOS;
  }



  /// get current device model
  static Future<String> model() async{
    return isIos()? _getIosModel(): _getAndroidModel();
  }

  static Future<String> _getAndroidModel() async{
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.model;
  }

  static Future<String> _getIosModel() async{
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo.model;
  }



  /// get current device system version
  static Future<String> releaseVersion() async{
    return isIos()? _getIosReleaseVersion(): _getAndroidReleaseVersion();
  }

  static Future<String> _getAndroidReleaseVersion() async{
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.version.release;
  }

  static Future<String> _getIosReleaseVersion() async{
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo.systemVersion;
  }



  /// get current device identifier
  static Future<String> identifier() async{
    return isIos()? _getIosIdentifier(): _getAndroidIdentifier();
  }

  static Future<String> _getAndroidIdentifier() async{
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.androidId;
  }

  static Future<String> _getIosIdentifier() async{
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo.identifierForVendor;
  }



  /// get current device description
  static Future<String> description() async{
    if(isIos()){
      return _getIosDescription();
    }else{
      return _getAndroidDescription();
    }
  }

  static Future<String> _getAndroidDescription() async{
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.model + "_" + androidInfo.version.release + "_" + androidInfo.androidId;
  }

  static Future<String> _getIosDescription() async{
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo.model + "_" + iosInfo.systemVersion + "_" + iosInfo.identifierForVendor;
  }

  static Future<String> getLanIp() async{
    String lanIp = '';
    for (var interface in await NetworkInterface.list()) {
      if("en0" == interface.name) {
        for (var address in interface.addresses) {
          if(address.type == InternetAddressType.IPv4){
            lanIp = address.address;
          }
        }
      }
    }
    return lanIp;
  }

  static Future<bool> compareIp(String localIp, String remoteHost) async{
    if(localIp != null && localIp.length > 0){
      List<String> localeS = localIp.split(".");
      List<String> hostS = remoteHost.split(".");
      if(localeS.length != 4 || hostS.length != 4 || localeS.length != hostS.length){
        return false;
      }
      if(localeS[0] != hostS[0]){
        return false;
      }
      if(localeS[1] != hostS[1]){
        return false;
      }
      if(localeS[2] != hostS[2]){
        return false;
      }
    }
    return true;
  }

}