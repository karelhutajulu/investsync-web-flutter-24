import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investsyncwebsite/data/newsletter_data.dart';
import 'package:investsyncwebsite/pages/newsletter_detail_page.dart';
import 'package:investsyncwebsite/pages/portfolio_page.dart';
import 'pages/home_page.dart'; // Import the homepage or initial screen
import 'pages/team_page.dart'; // Import the Teams page
import 'pages/newsletter_page.dart'; // Import the Newsletter page
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  usePathUrlStrategy();
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
      debugShowCheckedModeBanner:
          false, // Set this to false to remove the debug banner
      home: HomePage(), // Set your homepage here
      getPages: [
        // Define routes here using GetPage with transition and duration
        GetPage(
          name: '/',
          page: () => HomePage(),
          transition: Transition.fade, // Set fade transition
          transitionDuration: Duration(milliseconds: 250), // Optional duration
        ),
        GetPage(
          name: '/team',
          page: () => TeamPage(),
          transition: Transition.fade, // Set fade transition
          transitionDuration: Duration(milliseconds: 250), // Optional duration
        ),
        GetPage(
          name: '/newsletter',
          page: () => NewsletterPage(),
          transition: Transition.fade, // Set fade transition
          transitionDuration: Duration(milliseconds: 250), // Optional duration
        ),
        GetPage(
          name: "/portfolio",
          page: () => PortfolioPage(),
          transition: Transition.fade,
          transitionDuration: Duration(microseconds: 250)
        ),
        ...generateArticleRoutes()
      ],
    );
  }
}