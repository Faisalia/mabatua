import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:local_savekost/models/login_response_model.dart';
import 'package:local_savekost/models/register_response_model.dart';
import '../models/login_request_model.dart';
import '../models/register_request_model.dart';
import '../models/register_response_model.dart';
import '../config.dart';
import './shared_service.dart';
import 'package:dio/dio.dart';

class APIService {
  // LOGIN REQUEST
  static Future<Map<String, dynamic>> login(LoginRequestModel model) async {
    print("model login request: ");
    print(model.toJson());
    var url = Uri.https(Config.apiURL, Config.loginAPI);
    print("uri url :");
    print(url);

    var dio = Dio();
    var formData = FormData.fromMap(model.toJson());

    try {
      var response = await dio.post(
        url.toString(),
        data: formData,
        options: Options(responseType: ResponseType.plain),
      );
      print(response.data);
      print("response status login :");
      print(response.statusCode);

      String strResponseData = response.data;
      Map<String, dynamic> mapResponseData = json.decode(response.data);
      if (response.statusCode == 200) {
        return {
          "message": "success",
          "data": loginResponseJson(strResponseData)
        };
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        Map<String, dynamic> mapResponseData = json.decode(e.response!.data);

        print(e.response!.headers);
        print(e.response!.requestOptions);
        return {"message": mapResponseData["error"], "data": null};
      } else {
        print(e.requestOptions);
        print(e.message);
        return {"message": "error", "data": null};
      }
    }
    return {"message": "error", "data": null};
  }

  // REGISTER REQUEST
  static Future<Map<String, dynamic>> register(
      RegisterRequestModel model) async {
    print("model register request: ");
    print(model.toJson());
    var url = Uri.https(Config.apiURL, Config.registerAPI);
    print("uri url :");
    print(url);

    var dio = Dio();
    var formData = FormData.fromMap(model.toJson());

    var response = await dio.post(
      url.toString(),
      data: formData,
      options: Options(responseType: ResponseType.plain),
    );
    print(response.data);
    print("response status register :");
    print(response.statusCode);

    String strResponseData = response.data;
    Map<String, dynamic> mapResponseData = json.decode(response.data);

    if (mapResponseData.containsKey("error")) {
      return {"message": mapResponseData["error"], "data": null};
    } else {
      return {
        "message": "success",
        "data": registerResponseJson(strResponseData)
      };
    }
  }
}
