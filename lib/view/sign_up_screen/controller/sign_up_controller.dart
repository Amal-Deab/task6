import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/class/status_request.dart';

import '../../../core/servies/link.dart';
import '../../../model/user_model.dart';
import '../../bottom_navigation_bar/view/bottom_navigation_bar_Screen.dart';

class SignUpController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  Crud crud = Crud();
  UserModel? user;
  String fcm_token = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool obscureText = false;

  changeObscureText() {
    obscureText = !obscureText;
    update();
  }

  Future<void> getToken() async {
    fcm_token = (await FirebaseMessaging.instance.getToken())!;
    update();
    print(' Fcm Token: $fcm_token');
  }

  @override
  void onInit() {
    getToken();
    super.onInit();
  }

  signUp() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      statusRequest = StatusRequest.loading;
      update();

      var result = await crud.postData(
          AppLink.register,
          {
            'name': this.nameController.text,
            'email': this.emailController.text,
            'password': this.passWordController.text,
            'fcm_token': fcm_token,
          },
          AppLink().getHeader(),
          true);

      result.fold((left) {
        isLoading = false;
        statusRequest = left;
        update();

        Get.snackbar('Success', 'Registration successful');
        if (statusRequest == StatusRequest.success) {
          Get.off(BottomNavigationBarScreen());
        }
      }, (right) {
        isLoading = false;

        var errorMessage = _parseErrors(right);
        Get.snackbar('Error', errorMessage);
        update();
      });
    }
  }

  String _parseErrors(String responseBody) {
    try {
      print('Server response: $responseBody');

      var decoded = json.decode(responseBody);

      var errorMessage = decoded['message'] ?? 'Unknown error occurred';

      if (decoded['errors'] != null) {
        var errors = decoded['errors'];
        errorMessage += '\n';
        errors.forEach((field, messages) {
          errorMessage += '${field.toUpperCase()}: ${messages.join(", ")}\n';
        });
      }

      return errorMessage.trim();
    } catch (e) {
      print('Error parsing server response: $e');

      return responseBody.isNotEmpty
          ? responseBody
          : 'Error: Invalid server response';
    }
  }
}