import 'package:flutter_common/flutter_common.dart';
import 'package:local_auth/local_auth.dart';

class CommonBiometrics{

  final LocalAuthentication auth = LocalAuthentication();


  Future<List<BiometricType>> getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics = [];
    try {
      bool canCheckBiometrics = await auth.canCheckBiometrics;
      if(canCheckBiometrics) {
        availableBiometrics = await auth.getAvailableBiometrics();
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return availableBiometrics;
  }


  void authenticate({Function onAuthSuccess, Function onAuthError, Function onError}) async{
    List<BiometricType> availableBiometrics = await getAvailableBiometrics();
    authenticateBy(availableBiometrics, onAuthSuccess: onAuthSuccess, onAuthError: onAuthError, onError: onError);
  }


  void authenticateBy(List<BiometricType> availableBiometrics,
      {Function onAuthSuccess, Function onAuthError, Function onError}) async{
    try {
      if(availableBiometrics == null || availableBiometrics.length <= 0){
        log("no found biometrics");
        if(onError != null){
          onError("no found biometrics");
        }
        return;
      }
      BiometricType type;
      if(availableBiometrics.contains(BiometricType.face)){
        type = BiometricType.face;
      }else if(availableBiometrics.contains(BiometricType.fingerprint)){
        type = BiometricType.fingerprint;
      }else{
        if(onError != null){
          onError("no found biometrics");
        }
        return;
      }
      bool authenticated = await auth.authenticateWithBiometrics(
            localizedReason: type == BiometricType.face? 'Scan your face to authenticate':
              type == BiometricType.fingerprint? 'Scan your fingerprint to authenticate': '',
            useErrorDialogs: true,
            stickyAuth: true);
      if(authenticated){
        if(onAuthSuccess != null){
          onAuthSuccess();
        }
      }else{
        if(onAuthError != null){
          onAuthError();
        }
      }
    } on Exception catch (e) {
      log(e.toString());
      if(onError != null) {
        onError(e.toString());
      }
    }
  }


}

