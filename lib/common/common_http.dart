import 'dart:async';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_common/common/common_log.dart';
import 'package:flutter_common/entities/up_file_info.dart';


class Result<T>{

  int code;
  String msg;
  T data;

  @override
  String toString() {
    return 'Result{code: $code, msg: $msg, data: $data}';
  }

}

class CommonHttp {

  static CommonHttp _instance;
  static Dio dio;
  static CommonHttp get instance {
    if (_instance == null) {
      _instance = new CommonHttp();
    }
    return _instance;
  }

  CommonHttp() {
    BaseOptions options = new BaseOptions(
      connectTimeout: 50000,
      receiveTimeout: 50000,
      headers: {
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36",
      },
    );
    dio = new Dio(options);
//    dio.interceptor.request.onSend = (Options options) async {
//      User userModel = await User.instance;
//      // userModel.
//      Map u = await userModel.findID1();
//      if (options.headers["Authorization"] == null && u != null) {
//        options.headers["Authorization"] = "Bearer " + u["token"];
//      }
//      print(options.path);
//      print(options.data);
//      return options;
//    };
//    dio.interceptor.response.onSuccess = (Response response) {
//      Map data = response.data;
//      bool success = data["success"];
//      if (!success) {
//        return dio.resolve(null);
//      }
//      return dio.resolve(data["payload"]);
//    };
//    dio.interceptor.response.onError = (DioError e) {
//      String msg = this.formatErrorMessage(e.type);
//      if (e.response != null) {
//        msg = e.response.data["message"];
//      }
//      if (msg != "") {
//      }
//      return dio.resolve(null);
//    };
  }


  Future<Result> get(String url, {params, options, CancelToken cancelToken}) async {
    try {
      Response response = await dio.get(url, queryParameters: params, options: options, cancelToken: cancelToken);
      Result result = Result();
      result.code = response.data['code'];
      result.msg = response.data['msg'];
      result.data = response.data['data'];
      return result;
    } on DioError catch (e) {
      log(e);
      String msg = this.formatErrorMessage(e.type);
      Result result = Result();
      result.code = 510;
      result.msg = msg;
      return result;
    }
  }


  Future<Response> getResponse(String url, {params, options, CancelToken cancelToken}) async {
    try {
      return await dio.get(url, queryParameters: params, options: options, cancelToken: cancelToken);
    } on DioError catch (e) {
      log(e);
      String msg = this.formatErrorMessage(e.type);
      print(msg);
      return null;
    }
  }


  Future<Result> post(String url, {jsonData, Options options, CancelToken cancelToken}) async {
    try {
      Response response = await dio.post(url,
          data: jsonData, options: options, cancelToken: cancelToken);
      Result result = Result();
      result.code = response.data['code'];
      result.msg = response.data['msg'];
      result.data = response.data['data'];
      return result;
    } on DioError catch (e) {
      log(e);
      String msg = this.formatErrorMessage(e.type);
      Result result = Result();
      result.code = 510;
      result.msg = msg;
      return result;
    }
  }


  Future<Response> postResponse(String url, {jsonData, Options options, CancelToken cancelToken}) async {
    try {
      return await dio.post(url,
          data: jsonData, options: options, cancelToken: cancelToken);
    } on DioError catch (e) {
      log(e);
      String msg = this.formatErrorMessage(e.type);
      print(msg);
      return null;
    }
  }



  Future<Result> formPost(String url, {Map<String, dynamic> formParams}) async {
    try {
      FormData formData = new FormData.fromMap(formParams);
      Response response = await dio.post(url, data: formData);
      Result result = Result();
      result.code = response.data['code'];
      result.msg = response.data['msg'];
      result.data = response.data['data'];
      return result;
    } on DioError catch (e) {
      log(e);
      String msg = this.formatErrorMessage(e.type);
      Result result = Result();
      result.code = 510;
      result.msg = msg;
      return result;
    }
  }

  Future<Response> formPostResponse(String url, {Map<String, dynamic> formParams, Map<String, String> headers}) async {
    try {
      FormData formData = new FormData.fromMap(formParams);
      return await dio.post(url, data: formData, options: Options(headers: headers));
    } on DioError catch (e) {
      log(e);
      String msg = this.formatErrorMessage(e.type);
      print(msg);
      return null;
    }
  }

  Future<Result> put(String url, {jsonData, Options options, CancelToken cancelToken}) async {
    try {
      Response response = await dio.put(url,
          data: jsonData, options: options, cancelToken: cancelToken);
      Result result = Result();
      result.code = response.data['code'];
      result.msg = response.data['msg'];
      result.data = response.data['data'];
      return result;
    } on DioError catch (e) {
      log(e);
      String msg = this.formatErrorMessage(e.type);
      Result result = Result();
      result.code = 510;
      result.msg = msg;
      return result;
    }
  }


  Future<Result> formPut(String url, {Map<String, dynamic> formParams}) async {
    try {
      FormData formData = new FormData.fromMap(formParams);
      Response response = await dio.put(url, data: formData);
      Result result = Result();
      result.code = response.data['code'];
      result.msg = response.data['msg'];
      result.data = response.data['data'];
      return result;
    } on DioError catch (e) {
      log(e);
      String msg = this.formatErrorMessage(e.type);
      Result result = Result();
      result.code = 510;
      result.msg = msg;
      return result;
    }
  }


  Future<Result> delete(String url, {jsonData, Options options, CancelToken cancelToken}) async {
    try {
      Response response = await dio.delete(url, data: jsonData, options: options, cancelToken: cancelToken);
      Result result = Result();
      result.code = response.data['code'];
      result.msg = response.data['msg'];
      result.data = response.data['data'];
      return result;
    } on DioError catch (e) {
      log(e);
      String msg = this.formatErrorMessage(e.type);
      Result result = Result();
      result.code = 510;
      result.msg = msg;
      return result;
    }
  }


  Future<Result> formDelete(String url, {Map<String, dynamic> formParams}) async {
    try {
      FormData formData = new FormData.fromMap(formParams);
      Response response = await dio.delete(url, data: formData);
      Result result = Result();
      result.code = response.data['code'];
      result.msg = response.data['msg'];
      result.data = response.data['data'];
      return result;
    } on DioError catch (e) {
      log(e);
      String msg = this.formatErrorMessage(e.type);
      Result result = Result();
      result.code = 510;
      result.msg = msg;
      return result;
    }
  }


  Future<Result> formUpload(String url, {Map<String, dynamic> formParams, Function onProgress}) async {
    try {
      FormData formData = FormData.fromMap(formParams);
      if(formParams.containsKey("files")){
        List<MapEntry<String, MultipartFile>> list = formParams['files'];
        formData.files.addAll(list);
      }
      Response response = await dio.post(url, data: formData, onSendProgress: onProgress);
      Result result = Result();
      result.code = response.data['code'];
      result.msg = response.data['msg'];
      result.data = response.data['data'];
      return result;
    } on DioError catch (e) {
      log(e);
      String msg = this.formatErrorMessage(e.type);
      Result result = Result();
      result.code = 510;
      result.msg = msg;
      return result;
    }
  }


  Future<void> download(String urlPath, String savePath, {ProgressCallback onProgress,
        data, Options options, CancelToken cancelToken}) async{
    Response response = await dio.download(urlPath, savePath, onReceiveProgress: onProgress,
      data: data, options: options, cancelToken: cancelToken,);
    print(response.statusCode);
  }


  String formatErrorMessage(DioErrorType type) {
    switch (type) {
      case DioErrorType.DEFAULT:
        return "Network connection error";
      case DioErrorType.CONNECT_TIMEOUT:
        return "Connect timeout";
      case DioErrorType.RECEIVE_TIMEOUT:
        return "Connect timeout";
      case DioErrorType.RESPONSE:
        return "Server reponse failure";
      default:
        return "";
    }
  }

}