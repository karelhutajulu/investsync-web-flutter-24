import 'package:flutter/material.dart';
import 'package:investsyncwebsite/common/widgets/sidenav.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart'; // Import the CustomNavigationBar
import 'package:investsyncwebsite/common/widgets/botnav.dart'; // Import the BotNav
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import FontAwesome Icons
import 'package:investsyncwebsite/data/team_data.dart';
import 'package:url_launcher/url_launcher.dart'; // Import URL Launcher for opening links

// final Size defaultDeviceSize = Size(1536.0, 729.6); // Default size
// Size deviceSize = Size(0, 0);

// Helper functions to chunk list to separate lists with each list having k elements
List<List<TeamMember>> chunkList(List<TeamMember> list, int k) {
  List<List<TeamMember>> chunks = [];
  for (int i = 0; i < list.length; i += k) {
    chunks.add(list.sublist(i, i + k > list.length ? list.length : i + k));
  }
  return chunks;
}

double _scrollOffset = 0.0; // Store the current scroll offset

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _scrollOffset = 0.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1350) {
          return DesktopTeamPage(); // Pass the offset
        } else if (constraints.maxWidth > 900) {
          return TabletTeamPage(); // Pass the offset
        } else {
          return MobileTeamPage(); // Pass the offset
        }
      },
    );
  }
}

class DesktopTeamPage extends StatefulWidget {
  @override
  _DesktopTeamPageState createState() => _DesktopTeamPageState();
}

class _DesktopTeamPageState extends State<DesktopTeamPage> {
  bool _sideNavOpen = false;
  List<List<TeamMember>> rowsForBOD = chunkList(boardOfDirectors, 3); // split it into 3 elements per row
  List<List<TeamMember>> rowsForIT = chunkList(investmentTeam, 3); // split it into 3 elements per row

  ScrollController _scrollController = ScrollController(initialScrollOffset: _scrollOffset);

  // Toggle side navigation
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
              controller: _scrollController, // Use the passed ScrollController
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Header Section with Background Image
                  Stack(
                    children: [
                      // Background Image
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/photos/golden_bull.png"), // Path to your background image
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // "Meet the Team" Text Overlay
                      Positioned.fill(
                        child: Center(
                          child: Text(
                            "MEET THE TEAM",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 56,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cormorant',
                              shadows: [
                                Shadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Board of Directors Title
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 48.0),
                    child: Column(
                      children: [
                        Text(
                          "BOARD OF DIRECTORS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 49,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: 'Cormorant',
                          ),
                        ),
                        Container(
                          height: 2,
                          width: 30,
                          color: Colors.black87,
                          margin: EdgeInsets.only(top: 6),
                        ),
                      ],
                    ),
                  ),
                  // Team Members Grid for Board of Directors
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        ...rowsForBOD.map((row) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Spacer(flex: 1),
                                  ...row.map((member) {
                                    return [
                                      MemberCard(
                                        name: member.name,
                                        role: member.role,
                                        imagePath: member.imagePath,
                                        emailLink: member.emailLink,
                                        linkedinLink: member.linkedInLink,
                                      ),
                                      Spacer(flex: 1), // Spacer after each MemberCard
                                    ];
                                  }).expand((element) => element).toList(),
                                ],
                              ),
                              SizedBox(height: 60),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  // Investment Team Title
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 48.0),
                    child: Column(
                      children: [
                        Text(
                          "INVESTMENT TEAM",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 49,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: 'Cormorant',
                          ),
                        ),
                        Container(
                          height: 2,
                          width: 30,
                          color: Colors.black87,
                          margin: EdgeInsets.only(top: 6),
                        ),
                      ],
                    ),
                  ),
                  // Team Members Grid for Investment Team
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        ...rowsForIT.map((row) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Spacer(flex: 1),
                                  ...row.map((member) {
                                    return [
                                      MemberCard(
                                        name: member.name,
                                        role: member.role,
                                        imagePath: member.imagePath,
                                        emailLink: member.emailLink,
                                        linkedinLink: member.linkedInLink,
                                      ),
                                      Spacer(flex: 1), // Spacer after each MemberCard
                                    ];
                                  }).expand((element) => element).toList(),
                                ],
                              ),
                              SizedBox(height: 60),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  BottomNav(),
                ],
              ),
            ),
          ),
          Column(
            children: [
              TopNav(activePage: 'Team', onSideNavPressed: _toggleSideNav),
            ],
          ),
          if (_sideNavOpen) SideNav(toggleSideNav: _toggleSideNav, activePage: 'Team'),
        ],
      ),
    );
  }
}

class TabletTeamPage extends StatefulWidget {
  @override
  _TabletTeamPageState createState() => _TabletTeamPageState();
}

class _TabletTeamPageState extends State<TabletTeamPage> {
    bool _sideNavOpen = false;
  List<List<TeamMember>> rowsForBOD = chunkList(boardOfDirectors, 2); // split it into 3 elements per row
  List<List<TeamMember>> rowsForIT = chunkList(investmentTeam, 2); // split it into 3 elements per row

  ScrollController _scrollController = ScrollController(initialScrollOffset: _scrollOffset);

  // Toggle side navigation
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
              controller: _scrollController, // Use the passed ScrollController
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Header Section with Background Image
                  Stack(
                    children: [
                      // Background Image
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/photos/golden_bull.png"), // Path to your background image
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // "Meet the Team" Text Overlay
                      Positioned.fill(
                        child: Center(
                          child: Text(
                            "MEET THE TEAM",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 56,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cormorant',
                              shadows: [
                                Shadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Board of Directors Title
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 48.0),
                    child: Column(
                      children: [
                        Text(
                          "BOARD OF DIRECTORS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 49,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: 'Cormorant',
                          ),
                        ),
                        Container(
                          height: 2,
                          width: 30,
                          color: Colors.black87,
                          margin: EdgeInsets.only(top: 6),
                        ),
                      ],
                    ),
                  ),
                  // Team Members Grid for Board of Directors
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        ...rowsForBOD.map((row) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Spacer(flex: 1),
                                  ...row.map((member) {
                                    return [
                                      MemberCard(
                                        name: member.name,
                                        role: member.role,
                                        imagePath: member.imagePath,
                                        emailLink: member.emailLink,
                                        linkedinLink: member.linkedInLink,
                                      ),
                                      Spacer(flex: 1), // Spacer after each MemberCard
                                    ];
                                  }).expand((element) => element).toList(),
                                ],
                              ),
                              SizedBox(height: 60),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  // Investment Team Title
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 48.0),
                    child: Column(
                      children: [
                        Text(
                          "INVESTMENT TEAM",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 49,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: 'Cormorant',
                          ),
                        ),
                        Container(
                          height: 2,
                          width: 30,
                          color: Colors.black87,
                          margin: EdgeInsets.only(top: 6),
                        ),
                      ],
                    ),
                  ),
                  // Team Members Grid for Investment Team
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        ...rowsForIT.map((row) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Spacer(flex: 1),
                                  ...row.map((member) {
                                    return [
                                      MemberCard(
                                        name: member.name,
                                        role: member.role,
                                        imagePath: member.imagePath,
                                        emailLink: member.emailLink,
                                        linkedinLink: member.linkedInLink,
                                      ),
                                      Spacer(flex: 1), // Spacer after each MemberCard
                                    ];
                                  }).expand((element) => element).toList(),
                                ],
                              ),
                              SizedBox(height: 60),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  BottomNav(),
                ],
              ),
            ),
          ),
          Column(
            children: [
              TopNav(activePage: 'Team', onSideNavPressed: _toggleSideNav),
            ],
          ),
          if (_sideNavOpen) SideNav(toggleSideNav: _toggleSideNav, activePage: 'Team'),
        ],
      ),
    );
  }
}

class MobileTeamPage extends StatefulWidget {
  @override
  _MobileTeamPageState createState() => _MobileTeamPageState();
}

class _MobileTeamPageState extends State<MobileTeamPage> {
  bool _sideNavOpen = false;
  List<List<TeamMember>> rowsForBOD = chunkList(boardOfDirectors, 1); // split it into 3 elements per row
  List<List<TeamMember>> rowsForIT = chunkList(investmentTeam, 1); // split it into 3 elements per row

  ScrollController _scrollController = ScrollController(initialScrollOffset: _scrollOffset);

  // Toggle side navigation
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
              controller: _scrollController, // Use the passed ScrollController
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Header Section with Background Image
                  Stack(
                    children: [
                      // Background Image
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/photos/golden_bull.png"), // Path to your background image
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // "Meet the Team" Text Overlay
                      Positioned.fill(
                        child: Center(
                          child: Text(
                            "MEET THE TEAM",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 56,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cormorant',
                              shadows: [
                                Shadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Board of Directors Title
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 48.0),
                    child: Column(
                      children: [
                        Text(
                          "BOARD OF DIRECTORS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 49,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: 'Cormorant',
                          ),
                        ),
                        Container(
                          height: 2,
                          width: 30,
                          color: Colors.black87,
                          margin: EdgeInsets.only(top: 6),
                        ),
                      ],
                    ),
                  ),
                  // Team Members Grid for Board of Directors
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        ...rowsForBOD.map((row) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Spacer(flex: 1),
                                  ...row.map((member) {
                                    return [
                                      MemberCard(
                                        name: member.name,
                                        role: member.role,
                                        imagePath: member.imagePath,
                                        emailLink: member.emailLink,
                                        linkedinLink: member.linkedInLink,
                                      ),
                                      Spacer(flex: 1), // Spacer after each MemberCard
                                    ];
                                  }).expand((element) => element).toList(),
                                ],
                              ),
                              SizedBox(height: 60),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  // Investment Team Title
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 48.0),
                    child: Column(
                      children: [
                        Text(
                          "INVESTMENT TEAM",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 49,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: 'Cormorant',
                          ),
                        ),
                        Container(
                          height: 2,
                          width: 30,
                          color: Colors.black87,
                          margin: EdgeInsets.only(top: 6),
                        ),
                      ],
                    ),
                  ),
                  // Team Members Grid for Investment Team
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        ...rowsForIT.map((row) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Spacer(flex: 1),
                                  ...row.map((member) {
                                    return [
                                      MemberCard(
                                        name: member.name,
                                        role: member.role,
                                        imagePath: member.imagePath,
                                        emailLink: member.emailLink,
                                        linkedinLink: member.linkedInLink,
                                      ),
                                      Spacer(flex: 1), // Spacer after each MemberCard
                                    ];
                                  }).expand((element) => element).toList(),
                                ],
                              ),
                              SizedBox(height: 60),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  BottomNav(),
                ],
              ),
            ),
          ),
          Column(
            children: [
              TopNav(activePage: 'Team', onSideNavPressed: _toggleSideNav),
            ],
          ),
          if (_sideNavOpen) SideNav(toggleSideNav: _toggleSideNav, activePage: 'Team'),
        ],
      ),
    );
  }
}

class MemberCard extends StatefulWidget {
  final String name;
  final String role;
  final String imagePath;
  final String emailLink; // Add an email link parameter
  final String linkedinLink; // Add a LinkedIn link parameter

  const MemberCard({
    required this.name,
    required this.role,
    required this.imagePath, // Default placeholder image if no imagePath is specified in the widget call
    required this.emailLink,
    required this.linkedinLink,
  });

  @override
  createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  bool isHoveredEmail = false;
  bool isHoveredLinkedIn = false;

  // Function to launch URLs (either email or LinkedIn)
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Left-align content
      children: [
        // Square Image Container
        Container(
          width: 375,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), // Slightly rounded corners
            image: DecorationImage(
              image: AssetImage(widget.imagePath.isEmpty
                  ? 'assets/images/photos/placeholder.png'
                  : widget.imagePath),
              fit: BoxFit.cover,
            ),
            color: Colors.grey[200],
          ),
        ),
        SizedBox(height: 12),
        // Name Text (left-aligned)
        Text(
          widget.name.toUpperCase(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.black87,
            fontFamily: 'Cormorant', // Set the desired font
          ),
        ),
        // Role Text (left-aligned)
        Text(
          widget.role,
          style: TextStyle(
            fontSize: 22,
            color: Color.fromRGBO(11, 71, 222, 1),
            fontWeight: FontWeight.w900,
            fontFamily: 'Cormorant', // Set the desired font
          ),
        ),
        SizedBox(height: 8),
        // Icons Row (Email, LinkedIn) left-aligned
        Row(
          children: [
            MouseRegion(
              onEnter: (_) => setState(() => isHoveredEmail = true),
              onExit: (_) => setState(() => isHoveredEmail = false),
              child: GestureDetector(
                onTap: () => launch('mailto:${widget.emailLink}'),
                child: Icon(
                  Icons.email,
                  size: 30,
                  color: isHoveredEmail
                      ? Color.fromARGB(255, 11, 53, 221)
                      : Colors.black87,
                ),
              ),
            ),
            SizedBox(width: 8),
            MouseRegion(
              onEnter: (_) => setState(() => isHoveredLinkedIn = true),
              onExit: (_) => setState(() => isHoveredLinkedIn = false),
              child: GestureDetector(
                onTap: () => launch(widget.linkedinLink),
                child: FaIcon(
                  FontAwesomeIcons.linkedin,
                  size: 30,
                  color: isHoveredLinkedIn
                      ? Color.fromARGB(255, 11, 53, 221)
                      : Colors.black87,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

// // UNUSED FOR THIS VERSION JUST IGNORE!
// class Something extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     deviceSize = MediaQuery.of(context).size;

//     return Scaffold(
//         body: Stack(
//       children: [
//         DesktopTopNav(activePage: 'Team'),
//         SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Header Section with Background Image
//               Stack(
//                 children: [
//                   // Background Image
//                   Container(
//                     width: double.infinity,
//                     height: 250 / defaultDeviceSize.height * deviceSize.height,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage(
//                             "assets/images/photos/golden_bull.png"), // Path to your background image
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   // "Meet the Team" Text Overlay
//                   Positioned.fill(
//                     child: Center(
//                       child: Text(
//                         "MEET THE TEAM",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 64 *
//                               (16 /
//                                       25 *
//                                       (deviceSize.width /
//                                           defaultDeviceSize.width) +
//                                   9 /
//                                       25 *
//                                       (deviceSize.height /
//                                           defaultDeviceSize.height)),
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Cormorant',
//                           shadows: [
//                             Shadow(
//                               offset: Offset(
//                                   2 /
//                                       defaultDeviceSize.width *
//                                       deviceSize.width,
//                                   2 /
//                                       defaultDeviceSize.height *
//                                       deviceSize.height),
//                               blurRadius: 5.0,
//                               color: Colors.black.withOpacity(0.5),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               // Board of Directors Title
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     vertical:
//                         48.0 / defaultDeviceSize.height * deviceSize.height),
//                 child: Column(
//                   children: [
//                     Text(
//                       "BOARD OF DIRECTORS",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 49 *
//                             (16 /
//                                     25 *
//                                     (deviceSize.width /
//                                         defaultDeviceSize.width) +
//                                 9 /
//                                     25 *
//                                     (deviceSize.height /
//                                         defaultDeviceSize.height)),
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black87,
//                         fontFamily: 'Cormorant', // Specify font
//                       ),
//                     ),
//                     Container(
//                       height: 2 / defaultDeviceSize.height * deviceSize.height,
//                       width: 30 / defaultDeviceSize.width * deviceSize.width,
//                       color: Colors.black87,
//                       margin: EdgeInsets.only(
//                           top:
//                               6 / defaultDeviceSize.height * deviceSize.height),
//                     ),
//                   ],
//                 ),
//               ),
//               // Team Members Grid
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal:
//                         32 / defaultDeviceSize.width * deviceSize.width),
//                 child: Column(
//                   children: [
//                     // First Row of team members
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Hoyun Joseph Jung",
//                           role: "President",
//                           imagePath: "assets/images/photos/HJJ.png",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=hoyuny0426@gmail.com&tf=cm",
//                           linkedinLink:
//                               "http://www.linkedin.com/in/hoyunjosephjung",
//                         ),
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Caitlyn Kay",
//                           role: "Co-President",
//                           imagePath: "assets/images/photos/CK.png",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=caitlynkay07@gmail.com&tf=cm",
//                           linkedinLink: "http://linkedin.com/in/caitlynkay07",
//                         ),
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "William A. Tanex",
//                           role: "Vice President",
//                           imagePath: "assets/images/photos/WAT.png",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=alexandertanex@gmail.com&tf=cm",
//                           linkedinLink:
//                               "https://www.linkedin.com/in/william-alexander-tanex/",
//                         ),
//                         Spacer(flex: 1),
//                       ],
//                     ),
//                     SizedBox(
//                         height:
//                             60 / defaultDeviceSize.height * deviceSize.height),
//                     // Second Row of team members
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Bhurida Chatlekhaivanich",
//                           role: "Chief Finance Officer",
//                           imagePath: "assets/images/photos/BC.png",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=kaye.bhurida@gmail.com&tf=cm",
//                           linkedinLink:
//                               "https://www.linkedin.com/in/bhurida-chatlekhavanich-828792227?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
//                         ),
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Nikita Tanaya",
//                           role: "Chief Technology Officer",
//                           imagePath: "assets/images/photos/NT.png",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=tanjayanikita@gmail.com&tf=cm",
//                           linkedinLink:
//                               "https://www.linkedin.com/in/nikita-tanjaya?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
//                         ),
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "TBA",
//                           role: "CMO",
//                           emailLink: "",
//                           linkedinLink: "",
//                         ),
//                         Spacer(flex: 1),
//                       ],
//                     ),
//                     SizedBox(
//                         height:
//                             60 / defaultDeviceSize.height * deviceSize.height),
//                     // Third Row of team members
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Maire Baukop Hellem",
//                           role: "Chief HR Officer",
//                           imagePath: "assets/images/photos/MBH.png",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=mairebaukoph25@gmail.com&tf=cm",
//                           linkedinLink:
//                               "http://linkedin.com/in/maire-baukop-hellem-1161b8231",
//                         ),
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "TBA",
//                           role: "Chief Editor",
//                           emailLink: "",
//                           linkedinLink: "",
//                         ),
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Junjira Adisakdechakul",
//                           role: "External HR Manager",
//                           imagePath: "assets/images/photos/JA.png",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=baa04mm@gmail.com&tf=cm",
//                           linkedinLink:
//                               "https://www.linkedin.com/in/junjira-adisakdechakul-29451b2b3/",
//                         ),
//                         Spacer(flex: 1),
//                       ],
//                     ),
//                     SizedBox(
//                         height:
//                             60 / defaultDeviceSize.height * deviceSize.height),
//                     // Fourth Row of Team Members
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Chrisantha Ongko",
//                           role: "Internal HR Manager",
//                           imagePath: "assets/images/photos/CO.png",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=chrisanthaong@gmail.com&tf=cm",
//                           linkedinLink:
//                               "http://www.linkedin.com/in/chrisantha-ongko-3691a724a",
//                         ),
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Vincent Ang",
//                           role: "Secretary",
//                           imagePath: "assets/images/photos/VA.png",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=vincent.ang523@gmail.com&tf=cm",
//                           linkedinLink:
//                               "https://www.linkedin.com/in/vincent-ang-977865281/",
//                         ),
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Olivia D. Christanto",
//                           role: "Secretary",
//                           imagePath: "assets/images/photos/ODC.png",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=oliviadchrist@gmail.com&tf=cm",
//                           linkedinLink: "http://www.linkedin.com/in/oliviadewi",
//                         ),
//                         Spacer(flex: 1),
//                       ],
//                     ),
//                     SizedBox(
//                         height:
//                             60 / defaultDeviceSize.height * deviceSize.height),
//                     // Fifth Row of Team Members
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Cellinie",
//                           role: "Market Analyst",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=cellinietanaga2004@gmail.com&tf=cm",
//                           linkedinLink:
//                               "http://linkedin.com/in/cellinie-tanaga-50676724a",
//                         ),
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Annabel Leonardi",
//                           role: "Market Analyst",
//                           imagePath: "assets/images/photos/AL.png",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=annabel.leonardi@gmail.com&tf=cm",
//                           linkedinLink:
//                               "https://www.linkedin.com/in/annabel-leonardi-13754b231",
//                         ),
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Angelina C. Handonjo",
//                           role: "Market Analyst",
//                           imagePath: "assets/images/photos/ACH.png",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=celine.handojo@gmail.com&tf=cm",
//                           linkedinLink:
//                               "https://www.linkedin.com/in/angelina-celine-handojo-9a13251aa",
//                         ),
//                         Spacer(flex: 1),
//                       ],
//                     ),
//                     SizedBox(
//                         height:
//                             60 / defaultDeviceSize.height * deviceSize.height),
//                     // Sixth Row of Team Members
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Bryan Jonathan",
//                           role: "Web Developer",
//                           imagePath: "assets/images/photos/BJ.png",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=24bryan.jonathan@gmail.com&tf=cm",
//                           linkedinLink:
//                               "https://www.linkedin.com/in/bryan-jonathan-461b0724a/",
//                         ),
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Matthew Kwok",
//                           role: "Web Developer",
//                           imagePath: "assets/images/photos/MK.png",
//                           emailLink:
//                               "http://www.linkedin.com/in/matthew-kwok-4641b4293",
//                           linkedinLink:
//                               "http://www.linkedin.com/in/matthew-kwok-4641b4293",
//                         ),
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Chananan Watsooksunti",
//                           role: "Treasury",
//                           imagePath: "assets/images/photos/CW.png",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=chanananw@gmail.com&tf=cm",
//                           linkedinLink: "", //No LinkedIn Page Link Found
//                         ),
//                         Spacer(flex: 1),
//                       ],
//                     ),
//                     SizedBox(
//                         height:
//                             60 / defaultDeviceSize.height * deviceSize.height),
//                     // Seventh Row of Team Members
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Bryan Budiarto Sutanto",
//                           role: "Treasury",
//                           imagePath: "assets/images/photos/BBS.png",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=bryan.b.sutanto@gmail.com&tf=cm",
//                           linkedinLink:
//                               "https://www.linkedin.com/in/bryan-budiarta-sutanto-6031a41b0?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
//                         ),
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Eugenia J. Budiono",
//                           role: "Publicist",
//                           imagePath: "assets/images/photos/EJB.png",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=jocelynwu153@gmail.com&tf=cm",
//                           linkedinLink:
//                               "https://www.linkedin.com/in/eugenia-jocelyn-budiono-507b9a270?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app",
//                         ),
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Angelica P. T. Tuerah",
//                           role: "Publicist",
//                           imagePath: "assets/images/photos/APTT.png",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=angelica.tuerah2004@gmail.com&tf=cm",
//                           linkedinLink:
//                               "https://www.linkedin.com/in/angelica-tuerah-9ab0942a2?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app",
//                         ),
//                         Spacer(flex: 1),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               // Investment Team Title
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     vertical:
//                         48.0 / defaultDeviceSize.height * deviceSize.height),
//                 child: Column(
//                   children: [
//                     Text(
//                       "INVESTMENT TEAM",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 49 *
//                             (16 /
//                                     25 *
//                                     (deviceSize.width /
//                                         defaultDeviceSize.width) +
//                                 9 /
//                                     25 *
//                                     (deviceSize.height /
//                                         defaultDeviceSize.height)),
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black87,
//                         fontFamily: 'Cormorant', // Specify font
//                       ),
//                     ),
//                     Container(
//                       height: 2 / defaultDeviceSize.height * deviceSize.height,
//                       width: 30 / defaultDeviceSize.width * deviceSize.width,
//                       color: Colors.black87,
//                       margin: EdgeInsets.only(
//                           top:
//                               6 / defaultDeviceSize.height * deviceSize.height),
//                     ),
//                   ],
//                 ),
//               ),
//               // Team Members Grid
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal:
//                         32 / defaultDeviceSize.width * deviceSize.width),
//                 child: Column(
//                   children: [
//                     // First Row of team members
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "William H. Loe",
//                           role: "Senior Analyst",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=reinard.tristan@gmail.com&tf=cm",
//                           linkedinLink:
//                               "https://www.linkedin.com/in/reinard-tristan-jacques/",
//                         ),
//                         Spacer(flex: 1),
//                         TeamMemberCard(
//                           name: "Reinard T.J. Nathaniel",
//                           role: "Senior Analyst",
//                           emailLink:
//                               "https://mail.google.com/mail/u/0/?fs=1&to=tjandra.william31@gmail.com&tf=cm",
//                           linkedinLink:
//                               "https://www.linkedin.com/in/william-tjandra-3a45a4301?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
//                         ),
//                         Spacer(flex: 1),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               // Bottom Navigation Bar - appears only at the end
//               SizedBox(
//                   height: 60 / defaultDeviceSize.height * deviceSize.height),
//               BottomNav(), // This will be at the end of the page
//             ],
//           ),
//         ),
//       ],
//     ));
//   }
// }

// class TeamMemberCard extends StatefulWidget {
//   final String name;
//   final String role;
//   final String imagePath;
//   final String emailLink; // Add an email link parameter
//   final String linkedinLink; // Add a LinkedIn link parameter

//   const TeamMemberCard({
//     required this.name,
//     required this.role,
//     this.imagePath =
//         'assets/images/photos/placeholder.png', // Default placeholder image if no imagePath is specified in the widget call
//     required this.emailLink,
//     required this.linkedinLink,
//   });

//   @override
//   _TeamMemberCardState createState() => _TeamMemberCardState();
// }

// class HoverController extends GetxController {
//   // Store hover state for each icon (email and LinkedIn)
//   var isHoveredEmail = false.obs;
//   var isHoveredLinkedIn = false.obs;

//   // Toggle hover state for email icon
//   void toggleEmailHover(bool isHovered) {
//     isHoveredEmail.value = isHovered;
//   }

//   // Toggle hover state for LinkedIn icon
//   void toggleLinkedInHover(bool isHovered) {
//     isHoveredLinkedIn.value = isHovered;
//   }
// }

// class _TeamMemberCardState extends State<TeamMemberCard> {
//   bool isHovered1 = false;
//   bool isHovered2 = false;

//   // Function to launch URLs (either email or LinkedIn)
//   Future<void> _launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Instantiate HoverController using GetX
//     final HoverController hoverController = Get.put(HoverController());

//     return Container(
//       width: 375 /
//           defaultDeviceSize.width *
//           deviceSize.width, // Set fixed width for consistent sizing
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start, // Left-align content
//         children: [
//           // Square Image Container
//           Container(
//             width: 375 / defaultDeviceSize.width * deviceSize.width,
//             height: 400 / defaultDeviceSize.height * deviceSize.height,
//             decoration: BoxDecoration(
//               borderRadius:
//                   BorderRadius.circular(8), // Slightly rounded corners
//               image: DecorationImage(
//                 image: AssetImage(widget.imagePath),
//                 fit: BoxFit.cover,
//               ),
//               color: Colors.grey[200],
//             ),
//           ),
//           SizedBox(height: 12 / defaultDeviceSize.height * deviceSize.height),
//           // Name Text (left-aligned)
//           Text(
//             widget.name.toUpperCase(),
//             style: TextStyle(
//               fontSize: 24 *
//                   (16 / 25 * (deviceSize.width / defaultDeviceSize.width) +
//                       9 / 25 * (deviceSize.height / defaultDeviceSize.height)),
//               fontWeight: FontWeight.w800,
//               color: Colors.black87,
//               fontFamily: 'Cormorant', // Set the desired font
//             ),
//           ),
//           // Role Text (left-aligned)
//           Text(
//             widget.role,
//             style: TextStyle(
//               fontSize: 22 *
//                   (16 / 25 * (deviceSize.width / defaultDeviceSize.width) +
//                       9 / 25 * (deviceSize.height / defaultDeviceSize.height)),
//               color: Color.fromRGBO(11, 71, 222, 1),
//               fontWeight: FontWeight.w900,
//               fontFamily: 'Cormorant', // Set the desired font
//             ),
//           ),
//           SizedBox(height: 8 / defaultDeviceSize.height * deviceSize.height),
//           // Icons Row (Email, LinkedIn) left-aligned
//           Row(
//             children: [
//               Obx(() => MouseRegion(
//                     onEnter: (_) => hoverController.toggleEmailHover(true),
//                     onExit: (_) => hoverController.toggleEmailHover(false),
//                     child: GestureDetector(
//                       onTap: () => launch('mailto:${widget.emailLink}'),
//                       child: Icon(
//                         Icons.email,
//                         size: 30 *
//                             (16 /
//                                     25 *
//                                     (deviceSize.width /
//                                         defaultDeviceSize.width) +
//                                 9 /
//                                     25 *
//                                     (deviceSize.height /
//                                         defaultDeviceSize.height)),
//                         color: hoverController.isHoveredEmail.value
//                             ? Color.fromARGB(255, 11, 53, 221)
//                             : Colors.black87,
//                       ),
//                     ),
//                   )),
//               SizedBox(width: 8 / defaultDeviceSize.width * deviceSize.width),
//               Obx(() => MouseRegion(
//                     onEnter: (_) => hoverController.toggleLinkedInHover(true),
//                     onExit: (_) => hoverController.toggleLinkedInHover(false),
//                     child: GestureDetector(
//                       onTap: () => launch(widget.linkedinLink),
//                       child: FaIcon(
//                         FontAwesomeIcons.linkedin,
//                         size: 30 *
//                             (16 /
//                                     25 *
//                                     (deviceSize.width /
//                                         defaultDeviceSize.width) +
//                                 9 /
//                                     25 *
//                                     (deviceSize.height /
//                                         defaultDeviceSize.height)),
//                         color: hoverController.isHoveredLinkedIn.value
//                             ? Color.fromARGB(255, 11, 53, 221)
//                             : Colors.black87,
//                       ),
//                     ),
//                   )),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
