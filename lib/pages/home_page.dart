import 'package:flutter/material.dart';
import 'package:investsyncwebsite/common/widgets/description_card.dart';
import 'package:investsyncwebsite/common/widgets/sidenav.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart';
import 'package:investsyncwebsite/common/widgets/botnav.dart';
import 'package:investsyncwebsite/common/widgets/parallax_image.dart';

// final Size defaultDeviceSize = Size(1536.0, 729.6);
// Size deviceSize = Size(0, 0); // Default size

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _sideNavOpen = false;

  void _toggleSideNav() {
    setState(() {
      _sideNavOpen = (_sideNavOpen == false) ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Parallax factor to adjust speed
    const double parallaxFactor = 0.5;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 110),
                child: CustomScrollView(
                  controller: ScrollController(),
                  slivers: [
                    // First SliverAppBar with Parallax effect
                    ParallaxImage(
                      imageUrl: 'assets/images/photos/golden_bull.png',
                      scrollController: ScrollController(),
                      parallaxFactor: parallaxFactor,
                      title: {
                        'INVESTSYNC': {
                          'Size': (constraints.maxWidth > 800) ? 68 : 42,
                          'HorizontalPos': 60,
                          'VerticalPos': 40
                        },
                        'INVEST, INNOVATE, INSPIRE': {
                          'Size': (constraints.maxWidth > 800) ? 26 : 16,
                          'HorizontalPos': 64,
                          'VerticalPos': (constraints.maxWidth > 800) ? 180 : 130
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
                      scrollController: ScrollController(),
                      parallaxFactor: parallaxFactor,
                      title: {
                        "CUHK(SZ)'s Premiere International": {
                          'Size': (constraints.maxWidth > 900) ? 36 : (constraints.maxWidth) > 650 ? 24 : 18,
                          'HorizontalPos': 60,
                          'VerticalPos': 60
                        },
                        'Investment & Networking': {
                          'Size': (constraints.maxWidth > 900) ? 36 : (constraints.maxWidth) > 650 ? 24 : 18,
                          'HorizontalPos': 60,
                          'VerticalPos': (constraints.maxWidth > 900) ? 120 : (constraints.maxWidth) > 650 ? 100 : 90
                        },
                        'Organization': {
                          'Size': (constraints.maxWidth > 900) ? 36 : (constraints.maxWidth) > 650 ? 24 : 18,
                          'HorizontalPos': 60,
                          'VerticalPos': (constraints.maxWidth > 900) ? 180 : (constraints.maxWidth) > 650 ? 140 : 120
                        },
                      },
                      anchor: 'right',
                    ),

                    // Description Card - Our Mission with grey background
                    SliverToBoxAdapter(
                      child: DescriptionCard(
                        title: 'OUR MISSION',
                        description: [
                          'At the heart of InvestSync lies a commitment to deepening our members’ understanding of investment strategies and market dynamics. We strive to blend academic theories with practical application.',
                          'Our philosophy centers around three pillars: Education, Experience, and Empowerment. We believe that by providing an environment where students can gain real-life trading experience and leadership opportunities, we can shape the future leaders of the finance industry.',
                          'Join us in shaping your future in finance and investment with InvestSync at CUHKSZ.'
                        ],
                      ),
                    ),

                    // Bottom Navigation Bar
                    SliverToBoxAdapter(child: BottomNav()),
                  ],
                ),
              ),
              Column(
                children: [
                  TopNav(activePage: 'Home', onSideNavPressed: _toggleSideNav),
                ],
              ),
              if (_sideNavOpen) SideNav(toggleSideNav: _toggleSideNav, activePage: 'Home')
            ],
          ));
    });
  }
}

// // UNUSED FOR THIS VERSION
// class Something extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final ScrollController scrollController = ScrollController();
//     deviceSize = MediaQuery.of(context).size;

//     // Parallax factor to adjust speed
//     const double parallaxFactor = 0.5;

//     return Scaffold(
//       backgroundColor:
//           Colors.grey[200], // Set Scaffold background color to grey
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(110.0 /
//             defaultDeviceSize.height *
//             deviceSize.height), // Custom navigation bar height
//         child: DesktopTopNav(activePage: "Home"),
//       ),
//       body: CustomScrollView(
//         controller: scrollController,
//         slivers: [
//           // First SliverAppBar with Parallax effect
//           ParallaxImage(
//             imageUrl: 'assets/images/photos/golden_bull.png',
//             scrollController: scrollController,
//             parallaxFactor: parallaxFactor,
//             title: {
//               'INVESTSYNC': {
//                 'Size': 68,
//                 'HorizontalPos': 94,
//                 'VerticalPos': 20
//               },
//               'INVEST, INNOVATE, INSPIRE': {
//                 'Size': 26,
//                 'HorizontalPos': 100,
//                 'VerticalPos': 150
//               },
//             },
//           ),

//           // Description Card - Who We Are
//           SliverToBoxAdapter(
//             child: DescriptionCard(
//               title: 'WHO WE ARE',
//               description: [
//                 'InvestSync is the premier investment & networking organization for students of The Chinese University of Hong Kong, Shenzhen.',
//                 'InvestSync broadens students’ investment experience, extends career opportunities, and encourages social networking among members. In the Spring of 2024, we launched an investment portfolio with the Student Analyst Team.',
//                 'InvestSync equips top students with valuable real-life investment experiences as well as leadership and portfolio management opportunities, alumni connections, internships, and career development.'
//               ],
//             ),
//           ),

//           // Second SliverAppBar with Parallax effect
//           ParallaxImage(
//             imageUrl: 'assets/images/photos/shenzhen_city.jpg',
//             scrollController: scrollController,
//             parallaxFactor: parallaxFactor,
//             title: {
//               "CUHK(SZ)'s Premiere International": {
//                 'Size': 36,
//                 'HorizontalPos': 100,
//                 'VerticalPos': 100
//               },
//               'Investment & Networking': {
//                 'Size': 36,
//                 'HorizontalPos': 100,
//                 'VerticalPos': 150
//               },
//               'Organization': {
//                 'Size': 36,
//                 'HorizontalPos': 100,
//                 'VerticalPos': 200
//               },
//             },
//             anchor: 'right',
//           ),

//           // Description Card - Our Mission with grey background
//           SliverToBoxAdapter(
//             child: Container(
//               color: Colors.grey[200], // Set background color to light grey
//               padding: EdgeInsets.symmetric(
//                   vertical: 20.0 /
//                       defaultDeviceSize.height *
//                       deviceSize.height), // Add padding
//               child: DescriptionCard(
//                 title: 'OUR MISSION',
//                 description: [
//                   'At the heart of InvestSync lies a commitment to deepening our members’ understanding of investment strategies and market dynamics. We strive to blend academic theories with practical application.',
//                   'Our philosophy centers around three pillars: Education, Experience, and Empowerment. We believe that by providing an environment where students can gain real-life trading experience and leadership opportunities, we can shape the future leaders of the finance industry.',
//                   'Join us in shaping your future in finance and investment with InvestSync at CUHKSZ.'
//                 ],
//               ),
//             ),
//           ),

//           // Bottom Navigation Bar
//           SliverToBoxAdapter(child: BottomNav()),
//         ],
//       ),
//     );
//   }
// }
