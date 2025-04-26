import 'package:get/get.dart';

class SidebarController extends GetxController {
  var isOpen = false.obs;

  void toggle() => isOpen.value = !isOpen.value;

  void close() => isOpen.value = false;

  void open() => isOpen.value = true;
}
