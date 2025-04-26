import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investsyncwebsite/common/widgets/botnav.dart';
import 'package:investsyncwebsite/common/widgets/sidenav.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart';
import 'package:investsyncwebsite/data/newsletter_data.dart';
import 'package:investsyncwebsite/controllers/sidebar_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;
  final SidebarController sidebarController = Get.put(SidebarController());

  ArticleDetailPage({super.key, required this.article});

  List<Widget> parseContent(String content) {
    final List<Widget> contentWidgets = [];
    final RegExp tagRegExp =
        RegExp(r'<(hd|bd|img|imgsrc)>([\s\S]*?)<\/\1>', dotAll: true);
    final matches = tagRegExp.allMatches(content);

    if (matches.isEmpty) {
      contentWidgets.add(
          Text('No content parsed. Please check your content formatting.'));
    } else {
      for (final match in matches) {
        final tag = match.group(1);
        final text = match.group(2)?.trim();

        switch (tag) {
          case 'hd':
            contentWidgets.add(
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: Text(
                  text ?? '',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            );
            break;
          case 'bd':
            contentWidgets.add(
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  text ?? '',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            );
            break;
          case 'img':
            contentWidgets.add(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Image.asset(
                  text ?? '',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
            break;
          case 'imgsrc':
            contentWidgets.add(
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    text ?? '',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ),
            );
            break;
          default:
            contentWidgets.add(Text('Unknown tag found: <$tag>'));
        }
      }
    }

    return contentWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 110.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Container(
                        padding: const EdgeInsets.all(80.0),
                        width: 1000,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/logos/logo-icon.png',
                                  width: 32,
                                  height: 32,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  article.teamName,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '• ${article.date} • ${article.readTime}',
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            Text(
                              article.title.toUpperCase(),
                              style: TextStyle(
                                fontSize: 36,
                                fontFamily: 'Cormorant',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 34),
                            Image.asset(
                              article.imagePath,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Key Takeaways',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: article.keyTakeaways.map((takeaway) {
                                int colonIndex = takeaway.indexOf(':');
                                String boldPart =
                                    takeaway.substring(0, colonIndex + 1);
                                String normalPart =
                                    takeaway.substring(colonIndex + 1);
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("•  "),
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black),
                                            children: [
                                              TextSpan(
                                                text: boldPart,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              TextSpan(text: normalPart),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                            SizedBox(height: 24),
                            ...parseContent(article.content),
                            SizedBox(height: 40),
                            Text(
                              'References',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: article.references
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                int index = entry.key + 1;
                                String reference = entry.value;
                                final urlStartIndex =
                                    reference.indexOf("https://");
                                final beforeUrl = urlStartIndex != -1
                                    ? reference.substring(0, urlStartIndex)
                                    : reference;
                                final url = urlStartIndex != -1
                                    ? reference.substring(urlStartIndex)
                                    : '';

                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("$index. "),
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                            children: [
                                              TextSpan(text: beforeUrl),
                                              if (url.isNotEmpty)
                                                TextSpan(
                                                  text: url,
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () async {
                                                          if (await canLaunchUrl(
                                                              Uri.parse(url))) {
                                                            await launchUrl(
                                                                Uri.parse(url));
                                                          } else {
                                                            throw 'Could not launch $url';
                                                          }
                                                        },
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                            SizedBox(height: 24),
                            Text('Author',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: 'By ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: article.author),
                                ],
                              ),
                            ),
                            SizedBox(height: 4),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: 'Reviewed By ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: article.reviewedBy),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    BottomNav(),
                  ],
                ),
              ),
            ),
          ),

          // Top Navigation
          const TopNav(activePage: 'Newsletter'),

          // Sidebar
          Obx(() => sidebarController.isOpen.value
              ? SideNav(activePage: 'Newsletter')
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
