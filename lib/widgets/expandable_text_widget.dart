import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testtt/utils/dimensions.dart';
import 'package:testtt/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {

  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExandableTextWidgetState();
}

class _ExandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight/5.63;

  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(text: firstHalf):Column(
        children: [
          SmallText(text: hiddenText?(firstHalf+"...."):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: "Show more", color: Colors.greenAccent,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_down, color: Colors.greenAccent,)
              ],
            ),
          )
        ],
      ),
      
    );
  }
}
