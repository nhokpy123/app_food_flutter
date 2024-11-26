import 'package:testtt/controllers/cart_controller.dart';
import 'package:testtt/controllers/popular_product_controller.dart';
import 'package:testtt/controllers/recommended_product_controller.dart';
import 'package:testtt/pages/cart/cart_page.dart';
import 'package:testtt/pages/food/popular_food_detail.dart';
import 'package:testtt/pages/food/recommended_food_detail.dart';
import 'package:testtt/pages/home/food_page_body.dart';
import 'package:testtt/pages/home/main_food_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testtt/pages/home/main_food_page.dart';
import 'package:testtt/route/route_helper.dart';
import 'package:testtt/splash/splash_page.dart';
import 'pages/home/main_food_page.dart';
import 'helper/dependencies.dart' as dep;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartDate();
    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',

          // home: SplashScreen(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });

  }
}
