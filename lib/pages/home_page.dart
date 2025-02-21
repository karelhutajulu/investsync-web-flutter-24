import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investsyncwebsite/common/widgets/description_card.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart';
import 'package:investsyncwebsite/common/widgets/botnav.dart';
import 'package:investsyncwebsite/common/widgets/parallax_image.dart';

final Size defaultDeviceSize = Size(1536.0, 729.6);
Size deviceSize = Size(0, 0); // Default size

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 775) {
          return DesktopHomePage();
        }
        else {
          return DesktopHomePage();
        }
      }
    );
  }
}

class DesktopHomePage extends StatefulWidget {
  @override
  _DesktopHomePageState createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  bool _sideNavOpen = false;

  void _toggleSideNav() {
    setState(() {
      _sideNavOpen = (_sideNavOpen == false) ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    // Parallax factor to adjust speed
    const double parallaxFactor = 0.5;
    return Scaffold(
      body: 
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 110),
            child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
            // First SliverAppBar with Parallax effect
            ParallaxImage(
              imageUrl: 'assets/images/photos/golden_bull.png',
              scrollController: scrollController,
              parallaxFactor: parallaxFactor,
              title: {
                'INVESTSYNC': {
                  'Size': 68,
                  'HorizontalPos': 94,
                  'VerticalPos': 20
                },
                'INVEST, INNOVATE, INSPIRE': {
                  'Size': 26,
                  'HorizontalPos': 100,
                  'VerticalPos': 150
                },
              },
            ),
            
            // Description Card - Who We Are
            SliverToBoxAdapter(
              child: DescriptionCard(
                title: 'WHO WE ARE',
                description: [
                  'InvestSync is the premier investment & networking organization for students of The Chinese University of Hong Kong, Shenzhen.',
                  'InvestSync broadens students’ investment experience, extends career opportunities, and encourages social networking among members. In the Spring of 2024, we launched an investment portfolio with the Student Analyst Team.',
                  'InvestSync equips top students with valuable real-life investment experiences as well as leadership and portfolio management opportunities, alumni connections, internships, and career development.'
                ],
              ),
            ),
            
            // Second SliverAppBar with Parallax effect
            ParallaxImage(
              imageUrl: 'assets/images/photos/shenzhen_city.jpg',
              scrollController: scrollController,
              parallaxFactor: parallaxFactor,
              title: {
                "CUHK(SZ)'s Premiere International": {
                  'Size': 36,
                  'HorizontalPos': 100,
                  'VerticalPos': 100
                },
                'Investment & Networking': {
                  'Size': 36,
                  'HorizontalPos': 100,
                  'VerticalPos': 150
                },
                'Organization': {
                  'Size': 36,
                  'HorizontalPos': 100,
                  'VerticalPos': 200
                },
              },
              anchor: 'right',
            ),
            
            // Description Card - Our Mission with grey background
            SliverToBoxAdapter(
              child: Container(
                color: Colors.grey[200], // Set background color to light grey
                padding:
                    EdgeInsets.symmetric(vertical: 20.0/defaultDeviceSize.height * deviceSize.height), // Add padding
                child: DescriptionCard(
                  title: 'OUR MISSION',
                  description: [
                    'At the heart of InvestSync lies a commitment to deepening our members’ understanding of investment strategies and market dynamics. We strive to blend academic theories with practical application.',
                    'Our philosophy centers around three pillars: Education, Experience, and Empowerment. We believe that by providing an environment where students can gain real-life trading experience and leadership opportunities, we can shape the future leaders of the finance industry.',
                    'Join us in shaping your future in finance and investment with InvestSync at CUHKSZ.'
                  ],
                ),
              ),
            ),
            
            // Bottom Navigation Bar
            SliverToBoxAdapter(child: BotNav()),
                    ],
                  ),
          ),
          Column(
            children: [
              NavBar(activePage: 'Home', onSideNavPressed: _toggleSideNav),
            ],
          ),

          if (_sideNavOpen)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: _toggleSideNav, // Close the drawer if tapped outside
                child: Container(
                  color: Colors.black.withOpacity(0.35), // Grey opacity box
                ),
              ),
            ),
          if (_sideNavOpen)
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              width: 300, // Width of the drawer
              child: GestureDetector(
                onTap: _toggleSideNav, // Close the drawer if tapped outside
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 2.5,
                        blurRadius: 2.5,
                        offset: Offset(0, 2.5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Image.asset('assets/logos/investsync-logo.jpg'),
                      ),
                      NavBarItem(
                        title: 'Home', 
                        onTap: () {
                          _toggleSideNav(); // Close drawer after selection
                          Get.toNamed('/');
                        },
                      ),
                      NavBarItem(
                        title: 'Team', 
                        onTap: () {
                          _toggleSideNav(); // Close drawer after selection
                          Get.toNamed('/team');
                        },
                      ),
                      NavBarItem(
                        title: 'Newsletter', 
                        onTap: () {
                          _toggleSideNav(); // Close drawer after selection
                          Get.toNamed('/newsletter');
                        },
                      ),
                      NavBarItem(
                        title: 'Portfolio', 
                        onTap: () {
                          _toggleSideNav(); // Close drawer after selection
                          Get.toNamed('/portfolio');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),


            
        ],
      )
    );
  }
}

class Something extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    deviceSize = MediaQuery.of(context).size;

    // Parallax factor to adjust speed
    const double parallaxFactor = 0.5;

    return Scaffold(
      backgroundColor:
          Colors.grey[200], // Set Scaffold background color to grey
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.0/defaultDeviceSize.height * deviceSize.height), // Custom navigation bar height
        child: DesktopNavigationBar(activePage: "Home"),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          // First SliverAppBar with Parallax effect
          ParallaxImage(
            imageUrl: 'assets/images/photos/golden_bull.png',
            scrollController: scrollController,
            parallaxFactor: parallaxFactor,
            title: {
              'INVESTSYNC': {
                'Size': 68,
                'HorizontalPos': 94,
                'VerticalPos': 20
              },
              'INVEST, INNOVATE, INSPIRE': {
                'Size': 26,
                'HorizontalPos': 100,
                'VerticalPos': 150
              },
            },
          ),

          // Description Card - Who We Are
          SliverToBoxAdapter(
            child: DescriptionCard(
              title: 'WHO WE ARE',
              description: [
                'InvestSync is the premier investment & networking organization for students of The Chinese University of Hong Kong, Shenzhen.',
                'InvestSync broadens students’ investment experience, extends career opportunities, and encourages social networking among members. In the Spring of 2024, we launched an investment portfolio with the Student Analyst Team.',
                'InvestSync equips top students with valuable real-life investment experiences as well as leadership and portfolio management opportunities, alumni connections, internships, and career development.'
              ],
            ),
          ),

          // Second SliverAppBar with Parallax effect
          ParallaxImage(
            imageUrl: 'assets/images/photos/shenzhen_city.jpg',
            scrollController: scrollController,
            parallaxFactor: parallaxFactor,
            title: {
              "CUHK(SZ)'s Premiere International": {
                'Size': 36,
                'HorizontalPos': 100,
                'VerticalPos': 100
              },
              'Investment & Networking': {
                'Size': 36,
                'HorizontalPos': 100,
                'VerticalPos': 150
              },
              'Organization': {
                'Size': 36,
                'HorizontalPos': 100,
                'VerticalPos': 200
              },
            },
            anchor: 'right',
          ),

          // Description Card - Our Mission with grey background
          SliverToBoxAdapter(
            child: Container(
              color: Colors.grey[200], // Set background color to light grey
              padding:
                  EdgeInsets.symmetric(vertical: 20.0/defaultDeviceSize.height * deviceSize.height), // Add padding
              child: DescriptionCard(
                title: 'OUR MISSION',
                description: [
                  'At the heart of InvestSync lies a commitment to deepening our members’ understanding of investment strategies and market dynamics. We strive to blend academic theories with practical application.',
                  'Our philosophy centers around three pillars: Education, Experience, and Empowerment. We believe that by providing an environment where students can gain real-life trading experience and leadership opportunities, we can shape the future leaders of the finance industry.',
                  'Join us in shaping your future in finance and investment with InvestSync at CUHKSZ.'
                ],
              ),
            ),
          ),

          // Bottom Navigation Bar
          SliverToBoxAdapter(child: BotNav()),
        ],
      ),
    );
  }
}