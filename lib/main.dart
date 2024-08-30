import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ticket/controller/userController.dart';
import 'package:ticket/core/theme/theme.dart';
import 'package:ticket/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(Usercontroller());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: FToastBuilder(),
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      initialRoute: PagesRoutes.login,
      getPages: AppPages.pages,
    );
  }
}
