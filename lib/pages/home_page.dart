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
                // First Parallax Hero Section
                ParallaxImage(
                  imagePath: 'assets/images/photos/golden_bull.png',
                  scrollController: ScrollController(),
                  parallaxFactor: parallaxFactor,
                  title: {
                    'INVESTSYNC': {
                      'Size': (screenSize.width > 800)
                          ? 68
                          : (screenSize.width > 500)
                              ? 42
                              : 26,
                      'HorizontalPos': 56,
                      'VerticalPos': 40,
                    },
                    'INVEST, INNOVATE, INSPIRE': {
                      'Size': (screenSize.width > 800)
                          ? 26
                          : (screenSize.width > 500)
                              ? 16
                              : 10,
                      'HorizontalPos': 60,
                      'VerticalPos': (screenSize.width > 800)
                          ? 180
                          : (screenSize.width > 500)
                              ? 130
                              : 100,
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
                    titleFontSize: (screenSize.width > 500) ? 56 : 34,
                    paragraphFontSize: (screenSize.width > 500) ? 26 : 20,
                  ),
                ),

                // Second Parallax Section - CUHKSZ Premiere International
                ParallaxImage(
                  imagePath: 'assets/images/photos/shenzhen_city.jpg',
                  scrollController: ScrollController(),
                  parallaxFactor: parallaxFactor,
                  anchor: 'right',
                  title: {
                    "CUHK(SZ)'s Premiere International": {
                      'Size': (screenSize.width > 900)
                          ? 36
                          : (screenSize.width > 650)
                              ? 24
                              : screenSize.width > 500 ? 18 : 13,
                      'HorizontalPos': 60,
                      'VerticalPos': 60,
                    },
                    'Investment & Networking': {
                      'Size': (screenSize.width > 900)
                          ? 36
                          : (screenSize.width > 650)
                              ? 24
                              : screenSize.width > 500 ? 18 : 13,
                      'HorizontalPos': 60,
                      'VerticalPos': (screenSize.width > 900)
                          ? 120
                          : (screenSize.width > 650)
                              ? 100
                              : screenSize.width > 500 ? 90 : 85,
                    },
                    'Organization': {
                      'Size': (screenSize.width > 900)
                          ? 36
                          : (screenSize.width > 650)
                              ? 24
                              : screenSize.width > 500 ? 18 : 13,
                      'HorizontalPos': 60,
                      'VerticalPos': (screenSize.width > 900)
                          ? 180
                          : (screenSize.width > 650)
                              ? 140
                              : screenSize.width > 500 ? 120 : 110,
                    },
                  },
                ),

                // // Sliding Gallery Section
                // SliverToBoxAdapter(
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 80),
                //     child: SlidingGallery(),
                //   ),
                // ),

                // OUR MISSION Section
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final isDesktop = constraints.maxWidth > 1150;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Title
                            Text(
                              'OUR MISSION',
                              style: TextStyle(
                                fontSize: (screenSize.width > 500) ? 56 : 34,
                                fontFamily: 'Cormorant',
                                fontWeight: FontWeight.w800,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(
                                height:
                                    60), // Bigger gap between title and icons

                            // Row or Column depending on screen size
                            isDesktop
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start, // Important
                                    children: [
                                      _MissionItem(
                                        icon: Icons.book,
                                        title: 'Education',
                                        description:
                                            'Deepen members’ understanding of investment strategies and market dynamics.',
                                        titleFontSize: 43,
                                        paragraphFontSize: 26,
                                      ),
                                      SizedBox(width: 48),
                                      _MissionItem(
                                        icon: Icons.lightbulb,
                                        title: 'Experience',
                                        description:
                                            'Provide hands-on learning through real-world investment experience.',
                                        titleFontSize: 43,
                                        paragraphFontSize: 26,
                                      ),
                                      SizedBox(width: 48),
                                      _MissionItem(
                                        icon: Icons.people,
                                        title: 'Empowerment',
                                        description:
                                            'Empower the future finance leaders with leadership and career development opportunities.',
                                        titleFontSize: 43,
                                        paragraphFontSize: 26,
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      _MissionItem(
                                        icon: Icons.book,
                                        title: 'Education',
                                        description:
                                            'Deepen members’ understanding of investment strategies and market dynamics.',
                                        titleFontSize: (screenSize.width > 500) ? 44 : 26,
                                        paragraphFontSize: (screenSize.width > 500) ? 26 : 20,
                                      ),
                                      const SizedBox(height: 48),
                                      _MissionItem(
                                        icon: Icons.lightbulb,
                                        title: 'Experience',
                                        description:
                                            'Provide hands-on learning through real-world investment experience.',
                                        titleFontSize: (screenSize.width > 500) ? 44 : 26,
                                        paragraphFontSize: (screenSize.width > 500) ? 26 : 20,
                                      ),
                                      const SizedBox(height: 48),
                                      _MissionItem(
                                        icon: Icons.people,
                                        title: 'Empowerment',
                                        description:
                                            'Empower the future finance leaders with leadership and career development opportunities.',
                                        titleFontSize: (screenSize.width > 500) ? 44 : 26,
                                        paragraphFontSize: (screenSize.width > 500) ? 26 : 20,
                                      ),
                                    ],
                                  ),

                            const SizedBox(height: 100), // Space to Footer
                          ],
                        );
                      },
                    ),
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

// SlidingGallery widget remains unchanged (your latest working version)

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
      height: 525,
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

class _MissionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final double titleFontSize;
  final double paragraphFontSize;

  const _MissionItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.titleFontSize,
    required this.paragraphFontSize
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Important: fix width
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 28,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: titleFontSize,
              fontFamily: 'Cormorant',
              fontWeight: FontWeight.w800,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            constraints: BoxConstraints(maxWidth: 250),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: paragraphFontSize,
                fontFamily: 'Kepler',
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
