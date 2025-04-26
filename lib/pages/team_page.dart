import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investsyncwebsite/common/widgets/sidenav.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart';
import 'package:investsyncwebsite/common/widgets/botnav.dart';
import 'package:investsyncwebsite/common/widgets/member_card.dart';
import 'package:investsyncwebsite/data/team_data.dart';
import 'package:investsyncwebsite/controllers/sidebar_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

double _scrollOffset = 0.0;

List<List<TeamMember>> chunkList(List<TeamMember> list, int k) {
  List<List<TeamMember>> chunks = [];
  for (int i = 0; i < list.length; i += k) {
    chunks.add(list.sublist(i, i + k > list.length ? list.length : i + k));
  }
  return chunks;
}

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _scrollOffset = 0.0;
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 1350) return DesktopTeamPage();
    if (screenWidth > 900) return TabletTeamPage();
    return MobileTeamPage();
  }
}

class DesktopTeamPage extends StatefulWidget {
  @override
  _DesktopTeamPageState createState() => _DesktopTeamPageState();
}

class _DesktopTeamPageState extends State<DesktopTeamPage> {
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: _scrollOffset);
  final SidebarController sidebarController = Get.put(SidebarController());

  List<List<TeamMember>> rowsForBOD = chunkList(boardOfDirectors, 3);
  List<List<TeamMember>> rowsForIT = chunkList(investmentTeam, 3);

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
              child: Column(
                children: [
                  TeamHeader(),
                  TeamSection(title: "BOARD OF DIRECTORS", rows: rowsForBOD),
                  TeamSection(title: "INVESTMENT TEAM", rows: rowsForIT),
                  BottomNav(),
                ],
              ),
            ),
          ),
          const TopNav(activePage: 'Team'),
          Obx(() => sidebarController.isOpen.value
              ? const SideNav(activePage: 'Team')
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
}

class TabletTeamPage extends StatelessWidget {
  final SidebarController sidebarController = Get.put(SidebarController());

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController =
        ScrollController(initialScrollOffset: _scrollOffset);

    List<List<TeamMember>> rowsForBOD = chunkList(boardOfDirectors, 2);
    List<List<TeamMember>> rowsForIT = chunkList(investmentTeam, 2);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 110),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  TeamHeader(),
                  TeamSection(title: "BOARD OF DIRECTORS", rows: rowsForBOD),
                  TeamSection(title: "INVESTMENT TEAM", rows: rowsForIT),
                  BottomNav(),
                ],
              ),
            ),
          ),
          const TopNav(activePage: 'Team'),
          Obx(() => sidebarController.isOpen.value
              ? const SideNav(activePage: 'Team')
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
}

class MobileTeamPage extends StatelessWidget {
  final SidebarController sidebarController = Get.put(SidebarController());

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController =
        ScrollController(initialScrollOffset: _scrollOffset);

    List<List<TeamMember>> rowsForBOD = chunkList(boardOfDirectors, 1);
    List<List<TeamMember>> rowsForIT = chunkList(investmentTeam, 1);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 110),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  TeamHeader(),
                  TeamSection(title: "BOARD OF DIRECTORS", rows: rowsForBOD),
                  TeamSection(title: "INVESTMENT TEAM", rows: rowsForIT),
                  BottomNav(),
                ],
              ),
            ),
          ),
          const TopNav(activePage: 'Team'),
          Obx(() => sidebarController.isOpen.value
              ? const SideNav(activePage: 'Team')
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
}

// 🔹 Small reusable pieces

class TeamHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/photos/golden_bull.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
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
    );
  }
}

class TeamSection extends StatelessWidget {
  final String title;
  final List<List<TeamMember>> rows;

  const TeamSection({
    required this.title,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 48.0),
          child: Column(
            children: [
              Text(
                title,
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: rows.map((row) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(flex: 1),
                      ...row
                          .map((member) => [
                                MemberCard(
                                  name: member.name,
                                  role: member.role,
                                  imagePath: member.imagePath,
                                  emailLink: member.emailLink,
                                  linkedinLink: member.linkedInLink,
                                ),
                                Spacer(flex: 1),
                              ])
                          .expand((e) => e)
                          .toList(),
                    ],
                  ),
                  SizedBox(height: 60),
                ],
              );
            }).toList(),
          ),
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
