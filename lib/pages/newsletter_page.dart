import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investsyncwebsite/common/widgets/sidenav.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart'; // Import the navigation bar
import 'package:investsyncwebsite/common/widgets/article_card.dart'; // Import the ArticleCard widget
import 'package:investsyncwebsite/common/widgets/botnav.dart'; // Import the BotNav widget
import 'package:investsyncwebsite/data/newsletter_data.dart'; // Import the articles data
import 'package:investsyncwebsite/pages/newsletter_detail_page.dart'; // Import the ArticleDetailPage

double _scrollOffset = 0.0; // Store the current scroll offset

class NewsletterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _scrollOffset = 0.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 950) {
          return DesktopNewsletterPage(); // Pass the offset
        } else if (constraints.maxWidth > 725) {
          return TabletNewsletterPage(); // Pass the offset
        } else {
          return MobileNewsletterPage(); // Pass the offset
        }
      },
    );
  }
}

class DesktopNewsletterPage extends StatefulWidget {
  @override
  createState() => _DesktopNewsletterPageState();
}

class _DesktopNewsletterPageState extends State<DesktopNewsletterPage> {
  bool _sideNavOpen = false;
  double containerWidth = 875;
  double containerHeight = 350;

  ScrollController _scrollController = ScrollController(initialScrollOffset: _scrollOffset);

  void _toggleSideNav() {
    setState(() {
      _sideNavOpen = !_sideNavOpen;
    });
  }

    @override
  void initState() {
    super.initState();
    
    // Adding listener to listen for scroll offset changes
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    // Always dispose of the controller when it's no longer needed
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    _scrollOffset = _scrollController.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 110),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(children: [
                ...articles.map((article) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Spacer(flex: 1),
                          ArticleCard(
                            article: article,
                            onTap: () {
                              Get.toNamed(
                                  "/newsletter/${article.id}"); // Correct navigation
                            },
                            destinationLink:
                                "${Uri.base.origin}/newsletter/${article.id}", // Shareable link
                            containerWidth: containerWidth,
                            containerHeight: containerHeight,
                          ),
                          Spacer(flex: 1)
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  );
                }).toList(),
                BottomNav()
              ]),
            ),
          ),
        ),
        Column(children: [
          TopNav(activePage: 'Newsletter', onSideNavPressed: _toggleSideNav)
        ]),
        if (_sideNavOpen) SideNav(toggleSideNav: _toggleSideNav, activePage: 'Newsletter')
      ],
    ));
  }
}

class TabletNewsletterPage extends StatefulWidget {
  @override
  createState() => _TabletNewsLetterPageState();
}

class _TabletNewsLetterPageState extends State<TabletNewsletterPage> {
  bool _sideNavOpen = false;
  double containerWidth = 675;
  double containerHeight = 400;

  ScrollController _scrollController = ScrollController(initialScrollOffset: _scrollOffset);

  void _toggleSideNav() {
    setState(() {
      _sideNavOpen = !_sideNavOpen;
    });
  }

    @override
  void initState() {
    super.initState();
    
    // Adding listener to listen for scroll offset changes
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    // Always dispose of the controller when it's no longer needed
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    _scrollOffset = _scrollController.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 110),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(children: [
                ...articles.map((article) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Spacer(flex: 1),
                          ArticleCard(
                            article: article,
                            onTap: () {
                              Get.toNamed(
                                  "/newsletter/${article.id}"); // Correct navigation
                            },
                            destinationLink:
                                "${Uri.base.origin}/newsletter/${article.id}", // Shareable link
                            containerWidth: containerWidth,
                            containerHeight: containerHeight,
                          ),
                          Spacer(flex: 1)
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  );
                }).toList(),
                BottomNav()
              ]),
            ),
          ),
        ),
        Column(children: [
          TopNav(activePage: 'Newsletter', onSideNavPressed: _toggleSideNav)
        ]),
        if (_sideNavOpen) SideNav(toggleSideNav: _toggleSideNav, activePage: 'Newsletter')
      ],
    ));
  }
}

class MobileNewsletterPage extends StatefulWidget {
  @override
  createState() => _MobileNewsletterPageState();
}

class _MobileNewsletterPageState extends State<MobileNewsletterPage> {
  bool _sideNavOpen = false;
  double containerWidth = 475;
  double containerHeight = 500;

  ScrollController _scrollController = ScrollController(initialScrollOffset: _scrollOffset);

  void _toggleSideNav() {
    setState(() {
      _sideNavOpen = !_sideNavOpen;
    });
  }

    @override
  void initState() {
    super.initState();
    
    // Adding listener to listen for scroll offset changes
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    // Always dispose of the controller when it's no longer needed
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    _scrollOffset = _scrollController.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 110),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(children: [
                ...articles.map((article) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Spacer(flex: 1),
                          ArticleCard(
                            article: article,
                            onTap: () {
                              Get.toNamed(
                                  "/newsletter/${article.id}"); // Correct navigation
                            },
                            destinationLink:
                                "${Uri.base.origin}/newsletter/${article.id}", // Shareable link
                            containerWidth: containerWidth,
                            containerHeight: containerHeight,
                            showImageOnTop: true
                          ),
                          Spacer(flex: 1)
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  );
                }).toList(),
                BottomNav()
              ]),
            ),
          ),
        ),
        Column(children: [
          TopNav(activePage: 'Newsletter', onSideNavPressed: _toggleSideNav)
        ]),
        if (_sideNavOpen) SideNav(toggleSideNav: _toggleSideNav, activePage: 'Newsletter')
      ],
    ));
  }
}
