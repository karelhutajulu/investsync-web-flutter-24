import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investsyncwebsite/common/widgets/description_card.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart';
import 'package:investsyncwebsite/common/widgets/botnav.dart'
    as custom_botnav; // ✅ 'as' keyword here
import 'package:investsyncwebsite/common/widgets/parallax_image.dart';
import 'package:investsyncwebsite/common/widgets/sidenav.dart';
import 'package:investsyncwebsite/controllers/sidebar_controller.dart';
import 'dart:async';

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
                // Top Parallax Hero Section
                ParallaxImage(
                  imageUrl: 'assets/images/photos/golden_bull.png',
                  scrollController: ScrollController(),
                  parallaxFactor: parallaxFactor,
                  title: {
                    'INVESTSYNC': {
                      'Size': (screenSize.width > 800) ? 68 : 42,
                      'HorizontalPos': 60,
                      'VerticalPos': 40,
                    },
                    'INVEST, INNOVATE, INSPIRE': {
                      'Size': (screenSize.width > 800) ? 26 : 16,
                      'HorizontalPos': 64,
                      'VerticalPos': (screenSize.width > 800) ? 180 : 130,
                    },
                  },
                ),

                // Who We Are Section
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

                // Sliding Gallery Section
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: SlidingGallery(),
                  ),
                ),

                // Our Mission Section
                SliverToBoxAdapter(
                  child: DescriptionCard(
                    title: 'OUR MISSION',
                    description: [
                      'At the heart of InvestSync lies a commitment to deepening our members’ understanding of investment strategies and market dynamics.',
                      'Our philosophy centers around three pillars: Education, Experience, and Empowerment.',
                      'Join us in shaping your future in finance and investment with InvestSync at CUHKSZ.',
                    ],
                  ),
                ),

                // Footer
                SliverToBoxAdapter(
                  child: custom_botnav.BottomNav(),
                ),
              ],
            ),
          ),

          // Top Navigation Bar
          const TopNav(activePage: 'Home'),

          // Side Navigation
          Obx(() => sidebarController.isOpen.value
              ? SideNav(activePage: 'Home')
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
}

class SlidingGallery extends StatefulWidget {
  const SlidingGallery({super.key});

  @override
  State<SlidingGallery> createState() => _SlidingGalleryState();
}

class _SlidingGalleryState extends State<SlidingGallery> {
  late final PageController _pageController;
  final List<String> imagePaths = [
    'assets/images/content/IMG_9191.JPG',
    'assets/images/content/IMG_9188.JPG',
    'assets/images/content/IMG_0611.JPG',
    'assets/images/content/IMG_0608.JPG',
  ];
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.7,
      initialPage: _currentPage,
    );
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!mounted) return;
      _pageController.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  void _scrollLeft() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index % imagePaths.length;
              });
            },
            itemBuilder: (context, index) {
              final realIndex = index % imagePaths.length;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    imagePaths[realIndex],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),

          // Left Arrow Button
          Positioned(
            left: 20,
            child: _buildArrowButton(Icons.arrow_back_ios_new, _scrollLeft),
          ),

          // Right Arrow Button
          Positioned(
            right: 20,
            child: _buildArrowButton(Icons.arrow_forward_ios, _scrollRight),
          ),
        ],
      ),
    );
  }

  Widget _buildArrowButton(IconData icon, VoidCallback onTap) {
    return Material(
      color: Colors.white.withOpacity(0.75),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          child: Icon(icon, color: Colors.black, size: 24),
        ),
      ),
    );
  }
}
