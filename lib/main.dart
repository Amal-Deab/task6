import 'package:api_focal/binding/initial_binding.dart';
import 'package:api_focal/core/servies/my_services.dart';
import 'package:api_focal/view/splash_screen/view/splash_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await MyServices().initialize;
  await intialService();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return GetMaterialApp(
            theme: ThemeData(
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                  fontFamily: 'Raleway',
               
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            initialBinding: InitialBinding(),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        });
  }
}
