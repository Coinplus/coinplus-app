import 'package:flutter/material.dart';

class PageControllerManager {
  static final PageControllerManager _instance =
      PageControllerManager._internal();

  factory PageControllerManager() {
    return _instance;
  }

  PageControllerManager._internal();

  late PageController pageController = PageController();
  late void Function(int, {bool animate}) navigateToPage;

  void setControllers(PageController controller) {
    pageController = controller;
    navigateToPage = (index, {animate = true}) {
      if (animate) {
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        pageController.jumpToPage(index);
      }
    };
  }
}
