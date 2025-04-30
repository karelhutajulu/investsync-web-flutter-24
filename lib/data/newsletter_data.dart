class Article {
  final String imagePath;
  final String teamName;
  final String date;
  final String readTime;
  final String title;
  final int id;
  final String description;
  final String content;
  final String author;
  final String reviewedBy;
  final List<String> references;
  final List<String> keyTakeaways;

  Article({
    required this.imagePath,
    required this.teamName,
    required this.date,
    required this.readTime,
    required this.title,
    required this.id,
    required this.description,
    required this.content,
    required this.author,
    required this.reviewedBy,
    required this.references,
    required this.keyTakeaways,
  });
}

// Sample list of articles with key takeaways
final List<Article> articles = [
  Article(
    imagePath: 'assets/images/content/south_korea_flag.jpg',
    teamName: 'Market Research Team',
    date: 'May 16',
    readTime: '3 min read',
    title: 'Inflation and Interest Rate Challenges in South Korea',
    id: 0,
    description:
        'Key Takeaways: Interest Rate Increases: South Korea\'s interest rate is at 3.5% in response to U.S. Federal Reserve hikes. Adjustments aim...',
    content: '''
    <hd>Inflation in Korea – Will inflation destroy Korea</hd>
    <bd>South Korea suffers from three highs: high interest rates, high inflation, and high oil prices. As the United States sharply increased its federal fund rate, South Korea has also increased the interest rate to 3.5%, lower than the US’ interest rate. Due to the exchange rate differences, the US dollar appreciates against the Won, hitting 1,400 won per dollar.</bd>
    <img>assets/images/content/graph-korea.jpg</img>
    <imgsrc>Source: Xe.com</imgsrc>
    <bd>According to the graph, the exchange rate hit above 1,400 Won per dollar during the pandemic, but it is also increasing sharply.</bd>
    <bd>South Korea also suffers from high inflation, which is led by increased exchange rates and oil prices. According to Nomura Securities, the price level of fruits and vegetables increased by 36.9% from January to March 2024. This increase is ranked as the first among all OECD countries. In March, monthly inflation hit 2.9%, the highest among the countries. The market views this price increase as primarily affected by the rise in oil prices initiated by the Middle East crisis.</bd>
    <bd>The tension between Iran and Israel is increasing, and this crisis has lingering effects on oil prices. As the tension rises, there is a rising concern about the oil price level. The price of Brent oil has already increased to almost 90 dollars per barrel, and the global energy industry expects it to increase to 120-130 dollars per barrel. This price increase would burden various aspects of South Korea along with the rise in exchange rate. South Korea might need to increase the interest rate to catch up with the federal fund rate and stabilize the exchange rate. There is a need for a systematic approach to improve the situation in Korea.</bd>
    <hd>Will the Bank of Korea increase interest rates?</hd>
    <img>assets/images/content/bank-korea-graph.jpg</img>
    <imgsrc>Source: International Monetary Fund</imgsrc>
    <bd>Looking at household debt as a percentage of GDP, it can be seen that South Korea has the highest among the selected countries. What is worse is the trend is steadily increasing. Moreover, the following chart describes the delinquency rate of household debt (yellow) and corporate debt (blue). The delinquency rate of household debt is also increasing fast as more people cannot afford to pay their debt interest as the interest rate in South Korea increased significantly following the US. If the Korea Bank increases the interest rate to stabilize inflation and the exchange rate, it will put more burden on households. It is currently experiencing a dilemma as either action would entail a sacrifice of the other. If it decides to increase the interest rates, households will suffer. On the other hand, if it decides to remain or lower the interest rate, the inflation would not stabilize. It is up to the Korea Bank to bear the cost of either decision.</bd>
    <img>assets/images/content/statistics-korea.jpg</img>
    <imgsrc>Source: Statistics Korea</imgsrc>
  ''',
    author: 'Kim Kyungrok',
    reviewedBy: 'Hoyun Joseph Jung and William Alexander Tanex',
    keyTakeaways: [
      'AI and Automation Advancements: New innovations in AI are streamlining processes across various sectors, particularly in healthcare and finance.',
      'Job Market Impact: Automation is expected to alter job roles, with a focus shifting towards AI management and technical oversight.',
      'Ethical Challenges: The rise of AI brings ethical considerations, such as privacy, bias, and accountability in decision-making.',
    ],
    references: [
      'International Monetary Fund. (n.d.). Household final consumption expenditure per capita [Data set]. Retrieved from https://www.imf.org/external/datamapper/HH_LS@GDD/KOR/CHN/JPN/USA',
      'Statistics Korea. (n.d.). GDP ratio of household debt [Data set]. Retrieved from https://www.index.go.kr/unity/potal/indicator/IndexInfo.do?idxCd=F0140',
      'Xe.com. (n.d.). US Dollar to South Korean Won exchange rate chart [Chart]. Retrieved from https://www.xe.com/currencycharts/?from=USD&to=KRW&view=5Y',
    ],
  ),
  Article(
    imagePath: 'assets/images/content/tech_innovation.jpg',
    teamName: 'Market Research Team',
    date: 'June 5',
    readTime: '5 min read',
    title: 'The Future of AI and Automation in Tech',
    id: 1,
    description:
        'Key Takeaways: The rapid development of AI is reshaping industries across the globe, from healthcare to finance...',
    content: '''
    <hd>Inflation in Korea – Will inflation destroy Korea</hd>
    <bd>South Korea suffers from three highs: high interest rates, high inflation, and high oil prices. As the United States sharply increased its federal fund rate, South Korea has also increased the interest rate to 3.5%, lower than the US’ interest rate. Due to the exchange rate differences, the US dollar appreciates against the Won, hitting 1,400 won per dollar.</bd>
    <img>assets/images/content/graph-korea.jpg</img>
    <imgsrc>Source: Xe.com</imgsrc>
    <bd>According to the graph, the exchange rate hit above 1,400 Won per dollar during the pandemic, but it is also increasing sharply.</bd>
    <bd>South Korea also suffers from high inflation, which is led by increased exchange rates and oil prices. According to Nomura Securities, the price level of fruits and vegetables increased by 36.9% from January to March 2024. This increase is ranked as the first among all OECD countries. In March, monthly inflation hit 2.9%, the highest among the countries. The market views this price increase as primarily affected by the rise in oil prices initiated by the Middle East crisis.</bd>
    <bd>The tension between Iran and Israel is increasing, and this crisis has lingering effects on oil prices. As the tension rises, there is a rising concern about the oil price level. The price of Brent oil has already increased to almost 90 dollars per barrel, and the global energy industry expects it to increase to 120-130 dollars per barrel. This price increase would burden various aspects of South Korea along with the rise in exchange rate. South Korea might need to increase the interest rate to catch up with the federal fund rate and stabilize the exchange rate. There is a need for a systematic approach to improve the situation in Korea.</bd>
    <hd>Will the Bank of Korea increase interest rates?</hd>
    <img>assets/images/content/bank-korea-graph.jpg</img>
    <imgsrc>Source: International Monetary Fund</imgsrc>
    <bd>Looking at household debt as a percentage of GDP, it can be seen that South Korea has the highest among the selected countries. What is worse is the trend is steadily increasing. Moreover, the following chart describes the delinquency rate of household debt (yellow) and corporate debt (blue). The delinquency rate of household debt is also increasing fast as more people cannot afford to pay their debt interest as the interest rate in South Korea increased significantly following the US. If the Korea Bank increases the interest rate to stabilize inflation and the exchange rate, it will put more burden on households. It is currently experiencing a dilemma as either action would entail a sacrifice of the other. If it decides to increase the interest rates, households will suffer. On the other hand, if it decides to remain or lower the interest rate, the inflation would not stabilize. It is up to the Korea Bank to bear the cost of either decision.</bd>
    <img>assets/images/content/statistics-korea.jpg</img>
    <imgsrc>Source: Statistics Korea</imgsrc>
  ''',
    author: 'Kim Kyungrok',
    reviewedBy: 'Hoyun Joseph Jung and William Alexander Tanex',
    keyTakeaways: [
      'AI and Automation Advancements: New innovations in AI are streamlining processes across various sectors, particularly in healthcare and finance.',
      'Job Market Impact: Automation is expected to alter job roles, with a focus shifting towards AI management and technical oversight.',
      'Ethical Challenges: The rise of AI brings ethical considerations, such as privacy, bias, and accountability in decision-making.',
    ],
    references: [
      'International Monetary Fund. (n.d.). Household final consumption expenditure per capita [Data set]. Retrieved from https://www.imf.org/external/datamapper/HH_LS@GDD/KOR/CHN/JPN/USA',
      'Statistics Korea. (n.d.). GDP ratio of household debt [Data set]. Retrieved from https://www.index.go.kr/unity/potal/indicator/IndexInfo.do?idxCd=F0140',
      'Xe.com. (n.d.). US Dollar to South Korean Won exchange rate chart [Chart]. Retrieved from https://www.xe.com/currencycharts/?from=USD&to=KRW&view=5Y',
    ],
  ),
  Article(
    imagePath: 'assets/images/content/tech_innovation.jpg',
    teamName: 'Sustainability Team',
    date: 'July 10',
    readTime: '4 min read',
    title: 'Energy Solutions for a Sustainable Future',
    id: 2,
    description:
        'Key Takeaways: The transition to renewable energy sources is becoming more critical in reducing carbon emissions and ensuring energy security...',
    content: '''
    <hd>Inflation in Korea – Will inflation destroy Korea</hd>
    <bd>South Korea suffers from three highs: high interest rates, high inflation, and high oil prices. As the United States sharply increased its federal fund rate, South Korea has also increased the interest rate to 3.5%, lower than the US’ interest rate. Due to the exchange rate differences, the US dollar appreciates against the Won, hitting 1,400 won per dollar.</bd>
    <img>assets/images/content/graph-korea.jpg</img>
    <imgsrc>Source: Xe.com</imgsrc>
    <bd>According to the graph, the exchange rate hit above 1,400 Won per dollar during the pandemic, but it is also increasing sharply.</bd>
    <bd>South Korea also suffers from high inflation, which is led by increased exchange rates and oil prices. According to Nomura Securities, the price level of fruits and vegetables increased by 36.9% from January to March 2024. This increase is ranked as the first among all OECD countries. In March, monthly inflation hit 2.9%, the highest among the countries. The market views this price increase as primarily affected by the rise in oil prices initiated by the Middle East crisis.</bd>
    <bd>The tension between Iran and Israel is increasing, and this crisis has lingering effects on oil prices. As the tension rises, there is a rising concern about the oil price level. The price of Brent oil has already increased to almost 90 dollars per barrel, and the global energy industry expects it to increase to 120-130 dollars per barrel. This price increase would burden various aspects of South Korea along with the rise in exchange rate. South Korea might need to increase the interest rate to catch up with the federal fund rate and stabilize the exchange rate. There is a need for a systematic approach to improve the situation in Korea.</bd>
    <hd>Will the Bank of Korea increase interest rates?</hd>
    <img>assets/images/content/bank-korea-graph.jpg</img>
    <imgsrc>Source: International Monetary Fund</imgsrc>
    <bd>Looking at household debt as a percentage of GDP, it can be seen that South Korea has the highest among the selected countries. What is worse is the trend is steadily increasing. Moreover, the following chart describes the delinquency rate of household debt (yellow) and corporate debt (blue). The delinquency rate of household debt is also increasing fast as more people cannot afford to pay their debt interest as the interest rate in South Korea increased significantly following the US. If the Korea Bank increases the interest rate to stabilize inflation and the exchange rate, it will put more burden on households. It is currently experiencing a dilemma as either action would entail a sacrifice of the other. If it decides to increase the interest rates, households will suffer. On the other hand, if it decides to remain or lower the interest rate, the inflation would not stabilize. It is up to the Korea Bank to bear the cost of either decision.</bd>
    <img>assets/images/content/statistics-korea.jpg</img>
    <imgsrc>Source: Statistics Korea</imgsrc>
  ''',
    author: 'Kim Kyungrok',
    reviewedBy: 'Hoyun Joseph Jung and William Alexander Tanex',
    keyTakeaways: [
      'AI and Automation Advancements: New innovations in AI are streamlining processes across various sectors, particularly in healthcare and finance.',
      'Job Market Impact: Automation is expected to alter job roles, with a focus shifting towards AI management and technical oversight.',
      'Ethical Challenges: The rise of AI brings ethical considerations, such as privacy, bias, and accountability in decision-making.',
    ],
    references: [
      'International Monetary Fund. (n.d.). Household final consumption expenditure per capita [Data set]. Retrieved from https://www.imf.org/external/datamapper/HH_LS@GDD/KOR/CHN/JPN/USA',
      'Statistics Korea. (n.d.). GDP ratio of household debt [Data set]. Retrieved from https://www.index.go.kr/unity/potal/indicator/IndexInfo.do?idxCd=F0140',
      'Xe.com. (n.d.). US Dollar to South Korean Won exchange rate chart [Chart]. Retrieved from https://www.xe.com/currencycharts/?from=USD&to=KRW&view=5Y',
    ],
  ),
  Article(
    imagePath: 'assets/images/content/tech_innovation.jpg',
    teamName: 'Global Trade Team',
    date: 'August 20',
    readTime: '6 min read',
    title: 'The Impact of Global Trade Tensions on Emerging Markets',
    id: 3,
    description:
        'Key Takeaways: Trade conflicts between major economies are influencing the stability of emerging markets, with potential long-term consequences...',
    content: '''
    <hd>Inflation in Korea – Will inflation destroy Korea</hd>
    <bd>South Korea suffers from three highs: high interest rates, high inflation, and high oil prices. As the United States sharply increased its federal fund rate, South Korea has also increased the interest rate to 3.5%, lower than the US’ interest rate. Due to the exchange rate differences, the US dollar appreciates against the Won, hitting 1,400 won per dollar.</bd>
    <img>assets/images/content/graph-korea.jpg</img>
    <imgsrc>Source: Xe.com</imgsrc>
    <bd>According to the graph, the exchange rate hit above 1,400 Won per dollar during the pandemic, but it is also increasing sharply.</bd>
    <bd>South Korea also suffers from high inflation, which is led by increased exchange rates and oil prices. According to Nomura Securities, the price level of fruits and vegetables increased by 36.9% from January to March 2024. This increase is ranked as the first among all OECD countries. In March, monthly inflation hit 2.9%, the highest among the countries. The market views this price increase as primarily affected by the rise in oil prices initiated by the Middle East crisis.</bd>
    <bd>The tension between Iran and Israel is increasing, and this crisis has lingering effects on oil prices. As the tension rises, there is a rising concern about the oil price level. The price of Brent oil has already increased to almost 90 dollars per barrel, and the global energy industry expects it to increase to 120-130 dollars per barrel. This price increase would burden various aspects of South Korea along with the rise in exchange rate. South Korea might need to increase the interest rate to catch up with the federal fund rate and stabilize the exchange rate. There is a need for a systematic approach to improve the situation in Korea.</bd>
    <hd>Will the Bank of Korea increase interest rates?</hd>
    <img>assets/images/content/bank-korea-graph.jpg</img>
    <imgsrc>Source: International Monetary Fund</imgsrc>
    <bd>Looking at household debt as a percentage of GDP, it can be seen that South Korea has the highest among the selected countries. What is worse is the trend is steadily increasing. Moreover, the following chart describes the delinquency rate of household debt (yellow) and corporate debt (blue). The delinquency rate of household debt is also increasing fast as more people cannot afford to pay their debt interest as the interest rate in South Korea increased significantly following the US. If the Korea Bank increases the interest rate to stabilize inflation and the exchange rate, it will put more burden on households. It is currently experiencing a dilemma as either action would entail a sacrifice of the other. If it decides to increase the interest rates, households will suffer. On the other hand, if it decides to remain or lower the interest rate, the inflation would not stabilize. It is up to the Korea Bank to bear the cost of either decision.</bd>
    <img>assets/images/content/statistics-korea.jpg</img>
    <imgsrc>Source: Statistics Korea</imgsrc>
  ''',
    author: 'Kim Kyungrok',
    reviewedBy: 'Hoyun Joseph Jung and William Alexander Tanex',
    keyTakeaways: [
      'AI and Automation Advancements: New innovations in AI are streamlining processes across various sectors, particularly in healthcare and finance.',
      'Job Market Impact: Automation is expected to alter job roles, with a focus shifting towards AI management and technical oversight.',
      'Ethical Challenges: The rise of AI brings ethical considerations, such as privacy, bias, and accountability in decision-making.',
    ],
    references: [
      'International Monetary Fund. (n.d.). Household final consumption expenditure per capita [Data set]. Retrieved from https://www.imf.org/external/datamapper/HH_LS@GDD/KOR/CHN/JPN/USA',
      'Statistics Korea. (n.d.). GDP ratio of household debt [Data set]. Retrieved from https://www.index.go.kr/unity/potal/indicator/IndexInfo.do?idxCd=F0140',
      'Xe.com. (n.d.). US Dollar to South Korean Won exchange rate chart [Chart]. Retrieved from https://www.xe.com/currencycharts/?from=USD&to=KRW&view=5Y',
    ],
  ),
];