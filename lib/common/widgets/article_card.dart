import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:investsyncwebsite/data/newsletter_data.dart';

class ArticleCard extends StatefulWidget {
  final Article article;
  final VoidCallback onTap;
  final String destinationLink;
  final double containerWidth;
  final double containerHeight;
  final bool showImageOnTop;

  const ArticleCard(
      {super.key,
      required this.article,
      required this.onTap,
      required this.destinationLink,
      required this.containerWidth,
      required this.containerHeight,
      this.showImageOnTop = false});

  @override
  createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  bool isHovered = false;
  final GlobalKey shareButtonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: widget.containerHeight,
          width: widget.containerWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 1.5,
            ),
          ),
          child: widget.showImageOnTop
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      widget.article.imagePath,
                      width: widget.containerWidth,
                      height: widget.containerHeight / 2.5,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 25,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/logos/logo-icon.png',
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.article.teamName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '${widget.article.date} • ${widget.article.readTime}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                IconButton(
                                  key: shareButtonKey,
                                  icon: Icon(
                                    Icons.more_vert,
                                    size: 16,
                                  ),
                                  onPressed: () {
                                    showShareButton(context);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 13),
                            AnimatedDefaultTextStyle(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.easeInOut,
                              style: TextStyle(
                                color: isHovered
                                    ? Color.fromARGB(255, 11, 53, 221)
                                    : Colors.black,
                                fontSize: 25,
                                fontFamily: 'Cormorant',
                                fontWeight: FontWeight.w800,
                                height: 1.4,
                              ),
                              child: Text(widget.article.title.toUpperCase()),
                            ),
                            SizedBox(height: 13),
                            AnimatedDefaultTextStyle(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.easeInOut,
                              style: TextStyle(
                                  color: isHovered
                                      ? Color.fromARGB(255, 11, 53, 221)
                                      : Colors.black,
                                  fontFamily: 'Typold',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  height: 1.5),
                              child: Text(widget.article.description),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      widget.article.imagePath,
                      width: widget.containerWidth / 2,
                      height: widget.containerHeight,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 25,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/logos/logo-icon.png',
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.article.teamName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '${widget.article.date} • ${widget.article.readTime}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                IconButton(
                                  key: shareButtonKey,
                                  icon: Icon(
                                    Icons.more_vert,
                                    size: 16,
                                  ),
                                  onPressed: () {
                                    showShareButton(context);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 13),
                            AnimatedDefaultTextStyle(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.easeInOut,
                              style: TextStyle(
                                color: isHovered
                                    ? Color.fromARGB(255, 11, 53, 221)
                                    : Colors.black,
                                fontSize: 25,
                                fontFamily: 'Cormorant',
                                fontWeight: FontWeight.w800,
                                height: 1.4,
                              ),
                              child: Text(widget.article.title.toUpperCase()),
                            ),
                            SizedBox(height: 13),
                            AnimatedDefaultTextStyle(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.easeInOut,
                              style: TextStyle(
                                  color: isHovered
                                      ? Color.fromARGB(255, 11, 53, 221)
                                      : Colors.black,
                                  fontFamily: 'Typold',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  height: 1.5),
                              child: Text(widget.article.description),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  void showShareButton(BuildContext context) {
    final RenderBox renderBox =
        shareButtonKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx, // X Position
        offset.dy + renderBox.size.height, // Y Position below the button
        offset.dx + renderBox.size.width, // Right bound
        offset.dy + renderBox.size.height + 50, // Bottom bound
      ),
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9)), // Rounded corners
      items: [
        PopupMenuItem(
          height: 50, // Custom height
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.share, size: 20), // Forward Icon
              SizedBox(width: 10), // Space between icon and text
              Text(
                'Share',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          onTap: () {
            Clipboard.setData(ClipboardData(text: widget.destinationLink))
                .then((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Link copied to clipboard!')),
              );
            });
          },
        ),
      ],
    );
  }
}

// // UNUUSED FOR THIS VERSION!!!! IGNORE
// final Size defaultDeviceSize = Size(1536.0, 729.6);  // Default size
// Size deviceSize = Size(0, 0);

// class ArticleCard extends StatefulWidget {
//   final Article article;
//   final VoidCallback onTap;
//   final String destinationLink; // TODO: I DONT KNOW HOW TO GET THE LINK PATH

//   const ArticleCard({
//     Key? key,
//     required this.article,
//     required this.onTap,
//     required this.destinationLink,
//   }) : super(key: key);
//   @override
//   _ArticleCardState createState() => _ArticleCardState();
// }

// class _ArticleCardState extends State<ArticleCard> {
//   bool isHovered = false;
//   final GlobalKey shareButtonKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     deviceSize = MediaQuery.of(context).size;

//     return LayoutBuilder(
//       builder: (context, constraints) {
//         double parentWidth = constraints.maxWidth;
//         double parentHeight = constraints.maxHeight;

//         return MouseRegion(
//           onEnter: (_) => setState(() => isHovered = true),
//           onExit: (_) => setState(() => isHovered = false),
//           child: GestureDetector(
//             onTap: widget.onTap,
//             child: Container(
//               height: 340.0 / defaultDeviceSize.height * deviceSize.height,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(
//                   color: Colors.grey.withOpacity(0.5),
//                   width: 1.5,
//                 ),
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Image.asset(
//                     widget.article.imagePath,
//                     width: parentWidth * 0.475,
//                     height: parentHeight,
//                     fit: BoxFit.cover,
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 25 / defaultDeviceSize.width * deviceSize.width,
//                         vertical: 25 / defaultDeviceSize.height * deviceSize.height,
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               ClipOval(
//                                 child: Image.asset(
//                                   'assets/logos/logo-icon.png',
//                                   width: 35 / defaultDeviceSize.width * deviceSize.width,
//                                   height: 35 / defaultDeviceSize.height * deviceSize.height,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               SizedBox(width: 10 / defaultDeviceSize.width * deviceSize.width),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     widget.article.teamName,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15 *
//                                           (16 / 25 * (deviceSize.width / defaultDeviceSize.width) +
//                                               9 / 25 * (deviceSize.height / defaultDeviceSize.height)),
//                                     ),
//                                   ),
//                                   SizedBox(height: 4 / defaultDeviceSize.height * deviceSize.height),
//                                   Text(
//                                     '${widget.article.date} • ${widget.article.readTime}',
//                                     style: TextStyle(
//                                       fontSize: 14 *
//                                           (16 / 25 * (deviceSize.width / defaultDeviceSize.width) +
//                                               9 / 25 * (deviceSize.height / defaultDeviceSize.height)),
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Spacer(),
//                               IconButton(
//                                 key: shareButtonKey,
//                                 icon: Icon(
//                                   Icons.more_vert,
//                                   size: 16 *
//                                       (16 / 25 * (deviceSize.width / defaultDeviceSize.width) +
//                                           9 / 25 * (deviceSize.height / defaultDeviceSize.height)),
//                                 ),
//                                 onPressed: () {
//                                   showShareButton(context);
//                                 },
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 13 / defaultDeviceSize.height * deviceSize.height),
//                           AnimatedDefaultTextStyle(
//                             duration: Duration(milliseconds: 100),
//                             curve: Curves.easeInOut,
//                             style: TextStyle(
//                               color: isHovered ? Color.fromARGB(255, 11, 53, 221) : Colors.black,
//                               fontSize: 25 *
//                                   (16 / 25 * (deviceSize.width / defaultDeviceSize.width) +
//                                       9 / 25 * (deviceSize.height / defaultDeviceSize.height)),
//                               fontFamily: 'Cormorant',
//                               fontWeight: FontWeight.w800,
//                               height: 1.4 / defaultDeviceSize.height * deviceSize.height,
//                             ),
//                             child: Text(widget.article.title.toUpperCase()),
//                           ),
//                           SizedBox(height: 13 / defaultDeviceSize.height * deviceSize.height),
//                           AnimatedDefaultTextStyle(
//                             duration: Duration(milliseconds: 100),
//                             curve: Curves.easeInOut,
//                             style: TextStyle(
//                               color: isHovered ? Color.fromARGB(255, 11, 53, 221) : Colors.black,
//                               fontFamily: 'Typold',
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16 *
//                                   (16 / 25 * (deviceSize.width / defaultDeviceSize.width) +
//                                       9 / 25 * (deviceSize.height / defaultDeviceSize.height)),
//                               height: 1.5 / defaultDeviceSize.height * deviceSize.height,
//                             ),
//                             child: Text(widget.article.description),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void showShareButton(BuildContext context) {
//     final RenderBox renderBox = shareButtonKey.currentContext!.findRenderObject() as RenderBox;
//     final Offset offset = renderBox.localToGlobal(Offset.zero);

//     showMenu(
//       context: context,
//       position: RelativeRect.fromLTRB(
//         offset.dx, // X Position
//         offset.dy + renderBox.size.height, // Y Position below the button
//         offset.dx + renderBox.size.width, // Right bound
//         offset.dy + renderBox.size.height + 50, // Bottom bound
//       ),
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)), // Rounded corners
//       items: [
//         PopupMenuItem(
//           height: 50/defaultDeviceSize.height * deviceSize.height, // Custom height
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(Icons.share, size: 20 * (16 / 25 * (deviceSize.width / defaultDeviceSize.width) + 9 / 25 * (deviceSize.height / defaultDeviceSize.height))), // Forward Icon
//               SizedBox(width: 10/defaultDeviceSize.width * deviceSize.width), // Space between icon and text
//               Text(
//                 'Share',
//                 style: TextStyle(
//                   fontSize: 16 * (16 / 25 * (deviceSize.width / defaultDeviceSize.width) + 9 / 25 * (deviceSize.height / defaultDeviceSize.height)), 
//                   fontWeight: FontWeight.w400),
//               ),
//             ],
//           ),
//           onTap: () {
//             Clipboard.setData(ClipboardData(text: widget.destinationLink)).then((_) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Link copied to clipboard!')),
//               );
//             });
//           },
//         ),
//       ],
//     );
//   }
// }