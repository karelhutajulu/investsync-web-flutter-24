import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investsyncwebsite/common/widgets/sidenav.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart';
import 'package:investsyncwebsite/common/widgets/botnav.dart';
import 'package:investsyncwebsite/controllers/sidebar_controller.dart';

final Size defaultDeviceSize = Size(1536.0, 729.6);
Size deviceSize = Size(0, 0);

class PortfolioPage extends StatelessWidget {
  PortfolioPage({super.key});

  final SidebarController sidebarController = Get.put(SidebarController());

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              const TopNav(activePage: 'Portfolio'),
              const Spacer(flex: 1),
              Center(
                child: Image.asset(
                  // Change to asset because it's local
                  'assets/images/whatthehell.png',
                  width: 300 *
                      (16 / 25 * (deviceSize.width / defaultDeviceSize.width) +
                          9 /
                              25 *
                              (deviceSize.height / defaultDeviceSize.height)),
                  height: 300 *
                      (16 / 25 * (deviceSize.width / defaultDeviceSize.width) +
                          9 /
                              25 *
                              (deviceSize.height / defaultDeviceSize.height)),
                  fit: BoxFit.contain,
                ),
              ),
              const Spacer(flex: 1),
              BottomNav(),
            ],
          ),

          // 🔁 Sidebar controlled by GetX
          Obx(() => sidebarController.isOpen.value
              ? const SideNav(activePage: 'Portfolio')
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
