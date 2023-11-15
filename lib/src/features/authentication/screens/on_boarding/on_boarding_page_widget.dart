import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../models/on_boarding_model.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  // Instancia del modelo de OnBoarding
  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image(image: AssetImage(model.imagen), height: model.height * 0.5),
          Column(
            children: <Widget>[
              Text(model.title, style: Theme.of(context).textTheme.headlineSmall),
              Text(model.subtitle, textAlign: TextAlign.center),
            ],
          ),
          Text(model.counterText, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 80.0)
        ],
      ),
    );
  }
}
