import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
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
import '../models/rekomendasi.dart';
import '../models/restoran.dart';
import '../models/mahasiswa.dart';

class APIService {
  // LOGIN REQUEST
  static Future<Map<String, dynamic>> login(LoginRequestModel model) async {
    var plainPassword = model.password;
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

      Map<String, dynamic> mapResponseData = json.decode(response.data);
      mapResponseData['mahasiswa']['password'] = plainPassword;
      String strResponseData = jsonEncode(mapResponseData);
      print(mapResponseData);
      if (response.statusCode == 200) {
        await SharedService.setLoginDetails(loginResponseJson(strResponseData));
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

  static Future<Rekomendasi?> getRekomendasi(String budget, String hari) async {
    // DEFINE URL
    print("get rekomendasi request: ");
    // print(model.toJson());
    var url = Uri.https(
        Config.apiURL, Config.rekomendasiAPI, {'budget': budget, 'hari': hari});
    print("uri url :");
    print(url);

    // get request
    Response response;
    var dio = Dio();
    response = await dio.get(
      url.toString(),
      options: Options(responseType: ResponseType.plain),
    );
    if (response.statusCode == 200) {
      var json = response.data;
      return rekomendasiFromJson(json);
    }
  }

  // GET RESTAURANTS
  static Future<List<Restoran>?> getListRestoran() async {
    // DEFINE URL
    print("get all restoran request: ");
    // print(model.toJson());
    var url = Uri.https(Config.apiURL, Config.restoranAPI);
    print("uri url :");
    print(url);

    // get request
    Response response;
    var dio = Dio();
    response = await dio.get(
      url.toString(),
      options: Options(responseType: ResponseType.plain),
    );
    if (response.statusCode == 200) {
      var json = response.data;
      return restoranFromJson(json);
    }
  }

  // GET RESTO BY ID
  // static Future<Restoran?> getRestoran(String id) async {
  //   // DEFINE URL
  //   print("get restoran by id request: ");
  //   print('restoran id : ${id}');
  //   // print(model.toJson());
  //   String query = Config.restoranAPI + id;
  //   var url = Uri.https(Config.apiURL, query);
  //   print("uri url :");
  //   print(url);

  //   // get request
  //   Response response;
  //   var dio = Dio();
  //   response = await dio.get(
  //     url.toString(),
  //     options: Options(responseType: ResponseType.plain),
  //   );
  //   if (response.statusCode == 200) {
  //     var json = response.data;
  //     print('response data : ${json}');
  //     return restoranFromJson(json);
  //   }
  // }

  // GET USER BY ID
  static Future<Mahasiswa?> getUser() async {
    var loginDetails = await SharedService.loginDetails();
    if (loginDetails != null) {
      var user = loginDetails.mahasiswa;
      debugPrint('logindetails data: ');
      debugPrint(loginDetails.mahasiswa.id);

      var userId = loginDetails.mahasiswa.id;
      var userPlainPassword = loginDetails.mahasiswa.password;

      String query = Config.userAPI + userId;
      var url = Uri.https(Config.apiURL, query);
      print("uri url :");
      print(url);

      // get request
      Response response;
      var dio = Dio();
      response = await dio.get(
        url.toString(),
        options: Options(responseType: ResponseType.plain),
      );
      if (response.statusCode == 200) {
        var json = response.data;
        print('response data : ${json}');
        user = mahasiswaFromJson(json);
        user.password = userPlainPassword;
        return user;
      }
    }
  }

  // UPDATE USER
  static Future<Map<String, dynamic>> updateUser(
      String userId, Map<String, dynamic> userRequest) async {
    String query = Config.userAPI + userId;
    var url = Uri.https(Config.apiURL, query);
    print("uri url :");
    print(url);

    var dio = Dio();

    var formData = FormData.fromMap(userRequest);
    var response = await dio.put(
      url.toString(),
      data: formData,
      options: Options(responseType: ResponseType.plain),
    );
    print(response.data);
    Map<String, dynamic> mapResponseData = json.decode(response.data);
    if (response.statusCode == 200) {
      debugPrint('success update');
      return {'message': 'updateSuccess', 'data': response.data};
    } else {
      return {"message": mapResponseData["error"], "data": null};
    }
  }
}
