import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investsyncwebsite/utilities/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberCard extends StatefulWidget {
  final String name;
  final String role;
  final String imagePath;    // can be asset: or file:
  final String emailLink;
  final String linkedinLink;

  const MemberCard({
    Key? key,
    required this.name,
    required this.role,
    required this.imagePath,
    required this.emailLink,
    required this.linkedinLink,
  }) : super(key: key);

  @override
  _MemberCardState createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  Uint8List? _compressed; // holds compressed bytes
  bool isHoveredEmail = false;
  bool isHoveredLinkedIn = false;

  @override
  void initState() {
    super.initState();
    _compressImage();
  }

  Future<void> _compressImage() async {
    final result = await Utils.compressImage(widget.imagePath, quality: 45);
    if (result != null) {
      setState(() {
        _compressed = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = _compressed != null
        ? MemoryImage(_compressed!)
        : AssetImage(
            widget.imagePath.isEmpty
                ? 'assets/images/photos/placeholder.png'
                : widget.imagePath,
          ) as ImageProvider;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile image
        Container(
          width: 375,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
            color: Colors.grey[200],
          ),
        ),
        const SizedBox(height: 12),

        // Name
        Text(
          widget.name.toUpperCase(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.black87,
            fontFamily: 'Cormorant',
          ),
        ),

        // Role
        Text(
          widget.role,
          style: const TextStyle(
            fontSize: 22,
            color: Color.fromRGBO(11, 71, 222, 1),
            fontWeight: FontWeight.w900,
            fontFamily: 'Cormorant',
          ),
        ),

        const SizedBox(height: 8),

        // Contact icons
        Row(
          children: [
            MouseRegion(
              onEnter: (_) => setState(() => isHoveredEmail = true),
              onExit: (_) => setState(() => isHoveredEmail = false),
              child: GestureDetector(
                onTap: () => launchUrl(Uri.parse('mailto:${widget.emailLink}')),
                child: Icon(
                  Icons.email,
                  size: 30,
                  color: isHoveredEmail
                      ? const Color.fromARGB(255, 11, 53, 221)
                      : Colors.black87,
                ),
              ),
            ),
            const SizedBox(width: 8),
            MouseRegion(
              onEnter: (_) => setState(() => isHoveredLinkedIn = true),
              onExit: (_) => setState(() => isHoveredLinkedIn = false),
              child: GestureDetector(
                onTap: () => launchUrl(Uri.parse(widget.linkedinLink)),
                child: FaIcon(
                  FontAwesomeIcons.linkedin,
                  size: 30,
                  color: isHoveredLinkedIn
                      ? const Color.fromARGB(255, 11, 53, 221)
                      : Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
