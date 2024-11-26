import 'package:testtt/pages/home/food_page_body.dart';
import 'package:testtt/utils/colors.dart';
import 'package:testtt/utils/dimensions.dart';
import 'package:testtt/widgets/big_text.dart';
import 'package:testtt/widgets/small_text.dart';
import 'package:flutter/material.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Container(
            margin: EdgeInsets.only(
                top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                        text: "WellCome",
                        color: const Color.fromARGB(255, 162, 234, 164)),
                    Row(
                      children: [
                        SmallText(text: "Languages", color: Colors.black),
                        const Icon(Icons.arrow_drop_down_rounded),
                      ],
                    )
                  ],
                ),
                Container(
                  width: Dimensions.height45,
                  height: Dimensions.height45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: const Color.fromARGB(255, 255, 239, 95),
                  ),
                  child: Icon(
                    Icons.search,
                    color: AppColors.mainColor,
                    size: Dimensions.iconSize24,
                  ),
                )
              ],
            ),
          ),
        ),
        const Expanded(
            child: SingleChildScrollView(
          child: FoodPageBody(),
        )),
      ],
    ));
  }
}
