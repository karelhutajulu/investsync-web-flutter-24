import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart';
import 'package:investsyncwebsite/data/newsletter_data.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  // Function to parse content with custom tags
  List<Widget> parseContent(String content) {
    final List<Widget> contentWidgets = [];

    // Updated regular expression for tags to handle multiline content
    final RegExp tagRegExp =
        RegExp(r'<(hd|bd|img|imgsrc)>([\s\S]*?)<\/\1>', dotAll: true);

    final matches = tagRegExp.allMatches(content);

    if (matches.isEmpty) {
      // Add a message if no tags are found for debugging
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.0),
        child: DesktopNavigationBar(activePage: 'Newsletter'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 270.0, vertical: 40.0),
          child: Container(
            padding: const EdgeInsets.all(80.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Metadata row with logo, team name, date, and read time
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '• ${article.date} • ${article.readTime}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 24),

                // Title
                Text(
                  article.title.toUpperCase(),
                  style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Cormorant',
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 34),

                // Main Image
                Image.asset(
                  article.imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 16),

                // Key Takeaways Heading
                Text(
                  'Key Takeaways',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),

                // Key Takeaways List
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: article.keyTakeaways.map((takeaway) {
                    int colonIndex = takeaway.indexOf(':');
                    String boldPart = takeaway.substring(0, colonIndex + 1);
                    String normalPart = takeaway.substring(colonIndex + 1);

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("•  "),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: boldPart,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
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

                // Article Content parsed with custom tags
                ...parseContent(article.content),

                SizedBox(height: 40),

                // References Section
                Text(
                  'References',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: article.references.asMap().entries.map((entry) {
                    int index = entry.key + 1; // Start numbering from 1
                    String reference = entry.value;

                    // Find the starting index of the URL if it exists
                    final urlStartIndex = reference.indexOf("https://");

                    // Split the reference text into two parts: before and the URL itself
                    final beforeUrl = urlStartIndex != -1
                        ? reference.substring(0, urlStartIndex)
                        : reference;
                    final url = urlStartIndex != -1
                        ? reference.substring(urlStartIndex)
                        : '';

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("$index. "), // Display the reference number
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: beforeUrl,
                                    style: TextStyle(
                                        color:
                                            Colors.black), // Normal black text
                                  ),
                                  if (url.isNotEmpty)
                                    TextSpan(
                                      text: url,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          if (await canLaunchUrl(Uri.parse(url))) {
                                            await launchUrl(Uri.parse(url));
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

                // Author Section
                Text(
                  'Author',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'By ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: article.author,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Reviewed By ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: article.reviewedBy,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
