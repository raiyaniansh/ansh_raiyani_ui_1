import 'package:ansh_raiyani_ui_1/screen/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

main()
{
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false ,
        getPages: [
          GetPage(name: '/', page: () => HomeScreen(),),
        ],
      ),
    )
  );
}