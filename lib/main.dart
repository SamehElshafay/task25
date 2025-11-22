import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/di/init_di.dart';
import 'package:task/core/router/app_router.dart';
import 'package:task/core/themes/app_theme_manager.dart';
import 'package:task/core/utils/screen_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtils.getDesignSize(context) ,
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: themeDataManager ,
          themeMode: ThemeMode.light,
          routerConfig: appRouter ,
        );
      }
    );
  }
}