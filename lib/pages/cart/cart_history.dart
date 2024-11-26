import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testtt/controllers/cart_controller.dart';
import 'package:testtt/utils/colors.dart';
import 'package:testtt/utils/dimensions.dart';
import 'package:testtt/widgets/app_icon.dart';
import 'package:testtt/widgets/big_text.dart';
import 'package:google_fonts/google_fonts.dart'; // Dùng font đẹp hơn
import 'package:get/get.dart';

import '../../utils/app_constant.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          // Header
          Container(
            height: Dimensions.height20 * 6,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(
              top: Dimensions.height20 * 2,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(
                  text: "Cart History",
                  color: Colors.white,
                  size: 24,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainColor,
                  backgroundColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),

          // Cart History List
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height10,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              child: getCartHistoryList.isNotEmpty
                  ? ListView.builder(
                      itemCount: getCartHistoryList.length,
                      itemBuilder: (context, index) {
                        // Giả lập một sản phẩm (dựa trên logic trong CartController)
                        var product = getCartHistoryList[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: Dimensions.height15),
                          padding: EdgeInsets.all(Dimensions.height10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 5,
                                spreadRadius: 2,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // Product Image
                              Container(
                                height: Dimensions.height20 * 5,
                                width: Dimensions.height20 * 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius15),
                                  image: DecorationImage(
                                    image: NetworkImage(AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URL
                                        + product.img!
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: Dimensions.width10),
                              // Product Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BigText(
                                      text: product.name!,
                                      size: 16,
                                      color: Colors.black87,
                                    ),
                                    SizedBox(height: Dimensions.height10 / 2),
                                    Text(
                                      "Price: \$${product.price}",
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    SizedBox(height: Dimensions.height10 / 2),
                                    Text(
                                      "Quantity: ${product.quantity}",
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    SizedBox(height: Dimensions.height10 / 2),
                                    Text(
                                      "Date: ${product.date}",
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Total Price
                              Column(
                                children: [
                                  BigText(
                                    text:
                                        "\$${product.price! * product.quantity!}",
                                    color: Colors.redAccent,
                                    size: 16,
                                  ),
                                  Text(
                                    "Total",
                                    style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.history,
                            size: 100,
                            color: Colors.grey[400],
                          ),
                          SizedBox(height: Dimensions.height20),
                          BigText(
                            text: "No items in cart history!",
                            size: 18,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
