import 'dart:convert';

import 'package:api_focal/core/servies/my_services.dart';
import 'package:api_focal/main.dart';
import 'package:api_focal/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../servies/shared_prefernces.dart';
import 'check_internet.dart';
import 'status_request.dart';

class Crud {
  Future<Either<StatusRequest, String>> postData(
      String url,
      Map<String, dynamic> data,
      Map<String, String> headers,
      bool saveToken) async {
    try {
      if (await CheckInternet()) {
        var response = await http.post(
          Uri.parse(url),
          body: data,
          headers: headers,
        );

        var decodeResponse = json.decode(response.body);
        print('Response: ${response.body}');

        if (response.statusCode == 200 || response.statusCode == 201) {
          if (saveToken) {
            var token = decodeResponse['data']['access_token'];
            var user = UserModel.fromRawJson(response.body);
            await MyServices().saveUserInfo(user);
               await MyServices().setConstuser();
            await MyServices.saveValue(SharedPreferencesKey.tokenkey, token);
            await MyServices().setConstToken();
          }
          return Left(StatusRequest.success);
        } else {
          var message = decodeResponse['message'] ?? 'Unknown error occurred';
          return Right(decodeResponse);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (error) {
      print('Error: $error');
      return const Left(StatusRequest.failure);
    }
  }

  Future<Either<StatusRequest, dynamic>> getData(
      String url, Map<String, String>? headers) async {
    try {
      if (await CheckInternet()) {
        var response = await http.get(
          Uri.parse(url),
          headers: headers,
        );

        print(response);

        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(response.body);
          print(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      print(_);
      return const Left(StatusRequest.serverFailure);
    }
  }
}
