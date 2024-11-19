import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FadeInAnimationWidget extends StatefulWidget {
  final Widget content; // Accept any widget as input
  final Offset offset;
  final Duration duration;
  final double visibleFrac;

  const FadeInAnimationWidget({
    Key? key,
    required this.content, // Any child widget
    this.offset = const Offset(0, 1), // Start slightly below
    this.duration = const Duration(milliseconds: 500), // Animation duration
    this.visibleFrac = 0,
  }) : super(key: key);

  @override
  _FadeInAnimationWidget createState() => _FadeInAnimationWidget();
}

class _FadeInAnimationWidget extends State<FadeInAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _positionAnimation;

  bool _isVisible = false; // Track visibility state

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    // Define opacity animation
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Define position animation
    _positionAnimation = Tween<Offset>(
      begin: widget.offset,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to free resources
    super.dispose();
  }

  void _startAnimation() {
    if (!_isVisible) {
      _controller.forward();
      _isVisible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.content.hashCode.toString()),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > widget.visibleFrac) {
          _startAnimation(); // Start the animation when visible
        }
      },
      child: FadeTransition(
        opacity: _opacityAnimation, // Fade in
        child: SlideTransition(
          position: _positionAnimation, // Move up
          child: widget.content, // Use the child widget directly
        ),
      ),
    );
  }
}