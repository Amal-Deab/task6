import 'dart:convert';
import 'package:api_focal/core/const_data/const_data.dart';
import 'package:api_focal/core/servies/shared_prefernces.dart';
import 'package:api_focal/model/user_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/notification_model.dart';
import '../../view/notification_screen/controller/notification_controller.dart';

class MyServices extends GetxService {
  static late SharedPreferences shared;

  Future<MyServices> initialize() async {
    shared = await SharedPreferences.getInstance();

    ConstData.token = await getValue(SharedPreferencesKey.tokenkey) ?? '';
    ConstData.isBoarding =
        await getValue(SharedPreferencesKey.isBoarding) ?? '';
    UserModel? userInfo = await getUserInfo();

    if (userInfo != null) {
      ConstData.user = userInfo;
    } else {
      print('User info is null, handle accordingly');
    }
    ;
    return this;
  }

  static Future<void> saveValue(String key, String value) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
    } catch (e) {
      print("Error saving value: $e");
    }
  }

  static getValue(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    } catch (e) {
      print("Error getting value: $e");
      return null;
    }
  }

  setConstToken() async {
    ConstData.token = await getValue(SharedPreferencesKey.tokenkey) ?? '';
    print('your token is ......');
    print(ConstData.token);
    return ConstData.token;
  }

  setConstuser() async {
    ConstData.user = (await getUserInfo())!;
    print('your user is ......');
    print(ConstData.user);
    return ConstData.user;
  }

  setConstBoarding() async {
    ConstData.isBoarding =
        await getValue(SharedPreferencesKey.isBoarding) ?? '';
    print('your isBoarding is ......');
    print(ConstData.isBoarding);
    return ConstData.isBoarding;
  }

  Future<UserModel?> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(SharedPreferencesKey.user);

    if (userJson != null && userJson.isNotEmpty) {
      return UserModel.fromJson(jsonDecode(userJson));
    }

    return null;
  }

//save User Information
  Future<void> saveUserInfo(UserModel user) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String userJson = jsonEncode(user.toJson());

      await prefs.setString(SharedPreferencesKey.user, userJson);
      print(' user is ......');
      print(user);
    } catch (e) {
      print("Error saving user info: $e");
    }
  }

//save Notification list
  Future<void> saveNotificationList(
      List<NotificationModel> notifications) async {
    try {
      List<String> notificationJsonList = notifications
          .map((notification) => jsonEncode(notification.toJson()))
          .toList();
      await shared.setStringList(
          SharedPreferencesKey.notifications, notificationJsonList);
    } catch (e) {
      print("Error saving notification list: $e");
    }
  }

//Notification list
  Future<List<NotificationModel>> getNotificationList() async {
    try {
      List<String>? notificationJsonList =
          shared.getStringList(SharedPreferencesKey.notifications);
      if (notificationJsonList != null) {
        return notificationJsonList
            .map((json) => NotificationModel.fromJson(jsonDecode(json)))
            .toList();
      }
    } catch (e) {
      print("Error getting notification list: $e");
    }

    return [];
  }

// clear shared
  Future<void> clear() async {
    try {
      await shared.clear();
      ConstData.token = '';
      ConstData.isBoarding = '';
      print("All shared preferences cleared");
    } catch (e) {
      print("Error clearing shared preferences: $e");
    }
  }
}

Future<void> intialService() async {
// FirebaseMessaging
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print(
          'Message also contained a notification: ${message.notification!.title}');

      Get.find<NotificationController>().addNotifications(
        message.notification!.title ?? 'No Title',
        message.notification!.body ?? 'No Body',
      );

      Get.snackbar(
          '${message.notification!.title}', '${message.notification!.body}',
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color.fromARGB(255, 127, 229, 243));
    }
  });

  await Get.putAsync(() => MyServices().initialize());
}
