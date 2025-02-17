import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testtt/widgets/small_text.dart';

import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: Dimensions.iconSize15,
                );
              }),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: "4.5"),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: "1212"),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: "comments")
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: Colors.yellowAccent),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: "1,7KM",
                iconColor: Colors.greenAccent),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: Colors.redAccent),
          ],
        ),
      ],
    );
  }
}
