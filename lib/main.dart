import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_app_sample/master_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // 基準となるデバイスサイズ
      designSize: const Size(360, 690),
      // デバイスの解像度に合わせて文字サイズが小さくなりすぎることを防ぐ
      minTextAdapt: true,
      // スプリットスクリーンーモードに対応するか
      splitScreenMode: true,
      builder: (context, child) {
        return child!;
      },
      child: MaterialApp(
        title: 'Responsive App Sample',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: const MasterDetailPage(),
      ),
    );
  }
}
