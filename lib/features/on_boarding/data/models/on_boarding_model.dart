import 'package:dalel/core/utils/app_assets.dart';

class OnBoardingModel {
  final String imagePath;
  final String title;
  final String subtitle;

  OnBoardingModel(
      {required this.imagePath, required this.title, required this.subtitle});
}

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
      imagePath: Assets.imagesOnBoarding1,
      title: 'Explore The history withDalel in a smart way',
      subtitle:
          'Using our app’s history libraries you can find many historical periods '),
  OnBoardingModel(
      imagePath: Assets.imagesOnBoarding2,
      title: 'From every placeon earth',
      subtitle: 'A big variety of ancient placesfrom all over the world'),
  OnBoardingModel(
      imagePath: Assets.imagesOnBoarding3,
      title: 'Using modern AI technology for better user experience',
      subtitle:
          'AI provide recommendations and helps you to continue the search journey'),
];
