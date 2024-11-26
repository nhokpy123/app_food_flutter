import 'package:flutter/material.dart';
import 'package:testtt/utils/colors.dart';
import 'package:testtt/utils/dimensions.dart';
import 'package:testtt/widgets/big_text.dart';
import 'package:testtt/widgets/small_text.dart';

class AchievePage extends StatelessWidget {
  const AchievePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        title: BigText(
          text: "Achievements",
          color: Colors.white,
          size: 20,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.width20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(
              text: "Your Milestones",
              size: 18,
              color: Colors.black87,
            ),
            SizedBox(height: Dimensions.height10),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Số lượng achievements (thay đổi nếu cần)
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: Dimensions.height15),
                    padding: EdgeInsets.all(Dimensions.height15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Icon or img
                        CircleAvatar(
                          radius: Dimensions.height20,
                          backgroundColor: AppColors.mainColor,
                          child: Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: Dimensions.width20),
                        // content
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(
                              text: "Achievement Title ${index + 1}",
                              size: 16,
                              color: Colors.black87,
                            ),
                            SizedBox(height: Dimensions.height10 / 2),
                            SmallText(
                              text: "Description of this achievement.",
                              color: Colors.grey[700],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
