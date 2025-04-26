import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:investsyncwebsite/common/widgets/description_card.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart';
import 'package:investsyncwebsite/common/widgets/botnav.dart';
import 'package:investsyncwebsite/common/widgets/parallax_image.dart';
import 'package:investsyncwebsite/common/widgets/sidenav.dart';
import 'package:investsyncwebsite/controllers/sidebar_controller.dart'; // Add this

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final SidebarController sidebarController = Get.put(SidebarController());

  @override
  Widget build(BuildContext context) {
    const double parallaxFactor = 0.5;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 110),
            child: CustomScrollView(
              slivers: [
                ParallaxImage(
                  imageUrl: 'assets/images/photos/golden_bull.png',
                  scrollController: ScrollController(),
                  parallaxFactor: parallaxFactor,
                  title: {
                    'INVESTSYNC': {
                      'Size': (screenSize.width > 800) ? 68 : 42,
                      'HorizontalPos': 60,
                      'VerticalPos': 40
                    },
                    'INVEST, INNOVATE, INSPIRE': {
                      'Size': (screenSize.width > 800) ? 26 : 16,
                      'HorizontalPos': 64,
                      'VerticalPos': (screenSize.width > 800) ? 180 : 130
                    },
                  },
                ),
                SliverToBoxAdapter(
                  child: DescriptionCard(
                    title: 'WHO WE ARE',
                    description: [
                      'InvestSync is the premier investment & networking organization for students of The Chinese University of Hong Kong, Shenzhen.',
                      'InvestSync broadens students’ investment experience, extends career opportunities, and encourages social networking among members.',
                      'In the Spring of 2024, we launched an investment portfolio with the Student Analyst Team.',
                    ],
                  ),
                ),
                ParallaxImage(
                  imageUrl: 'assets/images/photos/shenzhen_city.jpg',
                  scrollController: ScrollController(),
                  parallaxFactor: parallaxFactor,
                  title: {
                    "CUHK(SZ)'s Premiere International": {
                      'Size': (screenSize.width > 900)
                          ? 36
                          : (screenSize.width > 650)
                              ? 24
                              : 18,
                      'HorizontalPos': 60,
                      'VerticalPos': 60
                    },
                    'Investment & Networking': {
                      'Size': (screenSize.width > 900)
                          ? 36
                          : (screenSize.width > 650)
                              ? 24
                              : 18,
                      'HorizontalPos': 60,
                      'VerticalPos': (screenSize.width > 900)
                          ? 120
                          : (screenSize.width > 650)
                              ? 100
                              : 90
                    },
                    'Organization': {
                      'Size': (screenSize.width > 900)
                          ? 36
                          : (screenSize.width > 650)
                              ? 24
                              : 18,
                      'HorizontalPos': 60,
                      'VerticalPos': (screenSize.width > 900)
                          ? 180
                          : (screenSize.width > 650)
                              ? 140
                              : 120
                    },
                  },
                  anchor: 'right',
                ),
                SliverToBoxAdapter(
                  child: DescriptionCard(
                    title: 'OUR MISSION',
                    description: [
                      'At the heart of InvestSync lies a commitment to deepening our members’ understanding of investment strategies and market dynamics.',
                      'Our philosophy centers around three pillars: Education, Experience, and Empowerment.',
                      'Join us in shaping your future in finance and investment with InvestSync at CUHKSZ.'
                    ],
                  ),
                ),
                SliverToBoxAdapter(child: BottomNav()),
              ],
            ),
          ),

          // Top Navigation Bar
          const TopNav(activePage: 'Home'),

          // Reactive SideNav
          Obx(() => sidebarController.isOpen.value
              ? SideNav(activePage: 'Home')
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
