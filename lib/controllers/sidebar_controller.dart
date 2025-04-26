import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SidebarController extends GetxController
    with GetTickerProviderStateMixin {
  var isOpen = false.obs;

  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  late Animation<double> fadeAnimation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
    );

    slideAnimation = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));
  }

  void toggle() {
    isOpen.value = !isOpen.value;
    isOpen.value
        ? animationController.forward()
        : animationController.reverse();
  }

  void open() {
    isOpen.value = true;
    animationController.forward();
  }

  void close() {
    isOpen.value = false;
    animationController.reverse();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
