// lib/data/article_data.dart
class Article {
  final String imagePath;
  final String teamName;
  final String date;
  final String readTime;
  final String title;
  final String description;
  final String content; // Detailed content for each article

  Article({
    required this.imagePath,
    required this.teamName,
    required this.date,
    required this.readTime,
    required this.title,
    required this.description,
    required this.content,
  });
}

// Sample list of articles
final List<Article> articles = [
  Article(
    imagePath: 'assets/images/photos/south_korea_flag.jpg',
    teamName: 'Market Research Team',
    date: 'May 16',
    readTime: '3 min read',
    title: 'Inflation and Interest Rate Challenges in South Korea',
    description:
        'Key Takeaways: Interest Rate Increases: South Korea\'s interest rate is at 3.5% in response to U.S. Federal Reserve hikes. Adjustments aim...',
    content: 'Full detailed content goes here for the first article...',
  ),
  Article(
    imagePath: 'assets/images/photos/tech_innovation.jpg',
    teamName: 'Market Research Team',
    date: 'June 5',
    readTime: '5 min read',
    title: 'The Future of AI and Automation in Tech',
    description:
        'Key Takeaways: The rapid development of AI is reshaping industries across the globe, from healthcare to finance...',
    content: 'Full detailed content goes here for the second article...',
  ),
  Article(
    imagePath: 'assets/images/photos/tech_innovation.jpg',
    teamName: 'Sustainability Team',
    date: 'July 10',
    readTime: '4 min read',
    title: 'Energy Solutions for a Sustainable Future',
    description:
        'Key Takeaways: The transition to renewable energy sources is becoming more critical in reducing carbon emissions and ensuring energy security...',
    content: 'Full detailed content goes here for the third article...',
  ),
  Article(
    imagePath: 'assets/images/photos/tech_innovation.jpg',
    teamName: 'Global Trade Team',
    date: 'August 20',
    readTime: '6 min read',
    title: 'The Impact of Global Trade Tensions on Emerging Markets',
    description:
        'Key Takeaways: Trade conflicts between major economies are influencing the stability of emerging markets, with potential long-term consequences...',
    content: 'Full detailed content goes here for the fourth article...',
  ),
];
