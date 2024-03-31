import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/components/onBoarding/CustomOnBoardingData.dart';
import 'package:shop/components/onBoarding/on_boarding_item.dart';
import 'package:shop/models/onBoarding_model/onBoarding_model.dart';
import 'package:get/get.dart';
import 'package:shop/routes/app_links.dart';
import 'package:shop/services/cache_helper.dart';
import 'package:shop/utility/app_colores.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  List<OnBoardingModel> listOnBoardingModel;

  OnBoarding({super.key, required this.listOnBoardingModel});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  CustomOnBoardingData customOnBoardingData = CustomOnBoardingData();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                const Spacer(),
                TextButton(
                    onPressed: () {
                      CacheHelper.saveData(key: "onBoarding", value: true).then((value){
                        if(value){
                          Navigator.pushReplacementNamed(context, ScreensNames.login);
                        }
                      });
                    },
                    child:  Text(
                      "Skip",
                      style: Theme.of(context).textTheme.titleSmall
                      ),
                )
              ],
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return OnBoardingItem(
                      boardingModel: widget.listOnBoardingModel[index],
                    );
                  },
                  itemCount: widget.listOnBoardingModel.length,
                  physics: const BouncingScrollPhysics(),
                  controller: customOnBoardingData.boardingController,
                  onPageChanged: (int index) {
                    if (index == widget.listOnBoardingModel.length - 1) {
                      setState(() {
                        customOnBoardingData.isLast = true;
                      });
                    } else {
                      setState(() {
                        customOnBoardingData.isLast = false;
                      });
                    }
                  },
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                SmoothPageIndicator(
                    controller: customOnBoardingData.boardingController,
                    count: widget.listOnBoardingModel.length,
                    axisDirection: Axis.horizontal,
                    effect:  ExpandingDotsEffect(
                        activeDotColor: Theme.of(context).canvasColor)),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    customOnBoardingData.nextPage(context);
                  },
                  child: Icon(
                    customOnBoardingData.isLast
                        ? Icons.done
                        : Icons.arrow_forward_ios_outlined,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  backgroundColor: Theme.of(context).canvasColor,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
