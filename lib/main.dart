import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:investsyncwebsite/controllers/sidebar_controller.dart'; // ADD THIS
import 'package:investsyncwebsite/pages/home_page.dart';
import 'package:investsyncwebsite/pages/team_page.dart';
import 'package:investsyncwebsite/pages/newsletter_page.dart';
import 'package:investsyncwebsite/pages/portfolio_page.dart';
import 'package:investsyncwebsite/pages/newsletter_detail_page.dart';
import 'package:investsyncwebsite/data/newsletter_data.dart';

void main() {
  usePathUrlStrategy();
  Get.put(SidebarController()); // 🔥 ADD THIS to initialize SidebarController!
  runApp(MyApp());
}

List<GetPage> generateArticleRoutes() {
  return articles.map((article) {
    return GetPage(
      name: '/newsletter/${article.id}',
      page: () => ArticleDetailPage(article: article),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 250),
    );
  }).toList();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'InvestSync Website',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: '/team',
          page: () => TeamPage(),
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: '/newsletter',
          page: () => NewsletterPage(),
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: '/portfolio',
          page: () => PortfolioPage(),
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 250),
        ),
        ...generateArticleRoutes(),
      ],
    );
  }
}
