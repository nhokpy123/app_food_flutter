import 'package:flutter/material.dart';
import 'package:testtt/utils/colors.dart';
import 'package:testtt/utils/dimensions.dart';
import 'package:testtt/widgets/big_text.dart';
import 'package:testtt/widgets/small_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        title: BigText(
          text: "Profile",
          color: Colors.white,
          size: 20,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: Dimensions.height20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: Dimensions.height20 * 2.5,
                    backgroundImage: NetworkImage(
                      "https://cdn.tgdd.vn/2020/07/content/bo-anh-yasuo-lol-dep-va-chat-de-lam-hinh-nen-dien-thoai-may1-575x1020-1.jpg", // Demo ảnh đại diện
                    ),
                  ),
                  SizedBox(height: Dimensions.height10),
                  BigText(
                    text: "Phi VIP",
                    color: AppColors.mainColor,
                    size: 22,
                  ),
                  SmallText(
                    text: "phi101066@donga.edu.vn",
                    color: AppColors.mainColor,
                  ),
                ],
              ),
            ),
            // Profile Options
            SizedBox(height: Dimensions.height20),
            _profileOption(Icons.person, "Personal Information", () {}),
            _profileOption(Icons.security, "Change Password", () {}),
            _profileOption(Icons.history, "Order History", () {}),
            _profileOption(Icons.settings, "Settings", () {}),
            _profileOption(Icons.help_outline, "Help Center", () {}),
            _profileOption(Icons.logout, "Logout", () {}),
          ],
        ),
      ),
    );
  }


  Widget _profileOption(IconData icon, String text, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: Dimensions.height10 / 2,
          horizontal: Dimensions.width20,
        ),
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
            Icon(icon, color: AppColors.mainColor, size: Dimensions.iconSize24),
            SizedBox(width: Dimensions.width10),
            BigText(
              text: text,
              size: 16,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}
