import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:testtt/utils/dimensions.dart';
import 'package:testtt/widgets/app_column.dart';
import 'package:testtt/widgets/big_text.dart';
import 'package:testtt/widgets/icon_and_text_widget.dart';
import 'package:testtt/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});
  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPagevalue=0.0;
  double _scaleFactor=0.8;
  double _height=Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener((){
      setState(() {
        _currPagevalue= pageController.page!;
        print("Current value is"+_currPagevalue.toString());
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        Container(
          color: Colors.white,
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
    //dots
    new DotsIndicator(
    dotsCount: 5,
    position: _currPagevalue,
    decorator: DotsDecorator(
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    ),

        //popular text
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Popular"),
                SizedBox(width: Dimensions.width10,),
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(text: '.', color:Colors.black26),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(text: "Food pairing", color: Colors.green,),
                ),
              ],


          ),
        ),
         //list product
          ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder:(context, index){
            return Container(
              margin: EdgeInsets.only(left: Dimensions.width20, right:Dimensions.width20, bottom: Dimensions.height10),
              child: Row(
                children: [
                  //image section
                  Container(
                    width: Dimensions.listViewImgSize,
                    height:Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: DecorationImage(
                            image: AssetImage("assets/image/food0.jpg")
                        )
                    ),
                  ),
                  //text container
                  Expanded(
                      child: Container(
                        height: Dimensions.listViewTextContSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20)
                          ),
                          color: Colors.white,
                        ),

                        child: Padding(padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: "Nutritious fruit meal in ANDO"),
                            SizedBox(height: Dimensions.height10,),
                            SmallText(text: "With AnDo characteristics"),
                            SizedBox(height: Dimensions.height10,),
                            Row(
                              children: [
                                IconAndTextWidget(icon: Icons.circle_sharp,
                                    text: "Normal",
                                    iconColor: Colors.yellowAccent),
                                IconAndTextWidget(icon: Icons.location_on,
                                    text: "Normal",
                                    iconColor: Colors.greenAccent),
                                IconAndTextWidget(icon: Icons.access_time_rounded,
                                    text: "Normal",
                                    iconColor: Colors.redAccent),
                              ],
                            )
                          ],
                        ),
                        ),
                      ),),
                ],
              ),
            );
          }),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if(index==_currPagevalue.floor()){
      var currScale = 1-(_currPagevalue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index ==_currPagevalue.floor()+1){
      var currScale = _scaleFactor+(_currPagevalue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index ==_currPagevalue.floor()-1){
      var currScale = 1-(_currPagevalue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else{
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }

    return Transform(
        transform: matrix,
    child: Stack(
        children: [
        Container(
        height: Dimensions.pageViewContainer,
        margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(Dimensions.radius30),
    color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
    image: DecorationImage(
    fit: BoxFit.cover,
    image: AssetImage(
    "assets/image/food0.jpg",
    ),
    ),
    ),
    ),
    Align(
    alignment: Alignment.bottomCenter,
    child: Container(
    height: Dimensions.pageViewTextContainer,
    margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(Dimensions.radius20),
    color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Color(0xFFe8e8e8),
          blurRadius: 5.0,
          offset: Offset(0, 5)
        ),
        BoxShadow(
          color: Colors.white,
          offset: Offset(-5, 0)
        ),
        BoxShadow(
            color: Color(0xFFe8e8e8),
            blurRadius: 5.0,
            offset: Offset(0, 5)
        ),
      ]
    ),
    child: Container(
    padding: EdgeInsets.only(top: Dimensions.height15, left: 15, right: 15),
    child: AppColumn(text: "Chinese side",),
    ),

    ),
    )
    ],
    ),
    );
  }
}
