import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investsyncwebsite/common/widgets/sidenav.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart';
import 'package:investsyncwebsite/common/widgets/article_card.dart';
import 'package:investsyncwebsite/common/widgets/botnav.dart';
import 'package:investsyncwebsite/data/newsletter_data.dart';
import 'package:investsyncwebsite/controllers/sidebar_controller.dart';

double _scrollOffset = 0.0;

class NewsletterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _scrollOffset = 0.0;
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 950) return DesktopNewsletterPage();
    if (screenWidth > 725) return TabletNewsletterPage();
    return MobileNewsletterPage();
  }
}

// 🔹 Shared newsletter page logic for all 3 screen types
class _BaseNewsletterPage extends StatefulWidget {
  final double containerWidth;
  final double containerHeight;
  final bool showImageOnTop;

  const _BaseNewsletterPage({
    required this.containerWidth,
    required this.containerHeight,
    this.showImageOnTop = false,
  });

  @override
  State<_BaseNewsletterPage> createState() => _BaseNewsletterPageState();
}

class _BaseNewsletterPageState extends State<_BaseNewsletterPage> {
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: _scrollOffset);
  final SidebarController sidebarController = Get.put(SidebarController());

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _scrollOffset = _scrollController.offset;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
                child: Column(
                  children: [
                    ...articles.map((article) => Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ArticleCard(
                                article: article,
                                onTap: () =>
                                    Get.toNamed("/newsletter/${article.id}"),
                                destinationLink:
                                    "${Uri.base.origin}/newsletter/${article.id}",
                                containerWidth: widget.containerWidth,
                                containerHeight: widget.containerHeight,
                                showImageOnTop: widget.showImageOnTop,
                              ),
                            ],
                          ),
                        )),
                    BottomNav(),
                  ],
                ),
              ),
            ),
          ),

          const TopNav(activePage: 'Newsletter'),

          // 🔁 Reactive sidebar
          Obx(() => sidebarController.isOpen.value
              ? const SideNav(activePage: 'Newsletter')
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
}

// 🔹 Concrete screen-specific widgets
class DesktopNewsletterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const _BaseNewsletterPage(
      containerWidth: 875,
      containerHeight: 350,
    );
  }
}

class TabletNewsletterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const _BaseNewsletterPage(
      containerWidth: 675,
      containerHeight: 400,
    );
  }
}

class MobileNewsletterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const _BaseNewsletterPage(
      containerWidth: 475,
      containerHeight: 500,
      showImageOnTop: true,
    );
  }
}
