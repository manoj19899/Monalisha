import 'dart:async';
import 'dart:convert';
import 'package:dakshattendance/const/config.dart';
import 'package:dakshattendance/model/login_model.dart';
import 'package:http/http.dart' as http;

import '../AppConst/AppConst.dart';

class UserLoginApi {
  Future<LoginModel?> onUserLoginAPI(String userid, String password) async {
    try {
      // final uri = Uri.parse(AppConst.baseUrl +
      //     Config.login +
      //     'username=${userid}&' +
      //     'password=${password}');
      // print(uri);
      // final request = http.MultipartRequest(
      //   'POST',
      //   uri,
      // );
      //
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
      };
      // request.headers.addAll(headers);
      // request.fields['username']=userid;
      // request.fields['password']=password;

      // final http.Response response = await http.Response.fromStream(
      //   await request.send(),
      // );
      var response = await http.post(Uri.parse(AppConst.baseUrl + Config.login),
          headers: headers,
          body: jsonEncode({'username': userid, 'password': password}));
      print(response.request!.url);
      print(response.body);
      dynamic responseJson;
      if (response.statusCode == 200) {
        print(response.statusCode);
        responseJson = json.decode(response.body);
        return LoginModel.fromJson(responseJson);
      } else {
        return null;
      }
    } catch (exception) {
      print('exception---- $exception');
      return null;
    }
  }
}
