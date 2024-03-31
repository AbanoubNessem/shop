import 'package:flutter/material.dart';
import 'package:shop/models/onBoarding_model/onBoarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel boardingModel;

  const OnBoardingItem({super.key, required this.boardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Image.asset(
          boardingModel.image,
          width: MediaQuery.of(context).size.height * 0.45,
          height: MediaQuery.of(context).size.height * 0.45,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  boardingModel.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  boardingModel.body,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
