import 'package:flutter/material.dart';

class FlipCardAnimation extends StatefulWidget {
  final Widget front;
  final Widget back;

  const FlipCardAnimation({Key? key, required this.front, required this.back})
      : super(key: key);

  @override
  State<FlipCardAnimation> createState() => _FlipCardAnimationState();
}

class _FlipCardAnimationState extends State<FlipCardAnimation> {
  late bool _displayFront;

  @override
  void initState() {
    super.initState();
    _displayFront = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tight(Size.square(200.0)),
      child: _buildFlipAnimation(),
    );
  }

  Widget _buildFlipAnimation() {
    return GestureDetector(
      onTap: () => setState(() => _displayFront = !_displayFront),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 600),
        child: _displayFront ? widget.front : widget.back,
      ),
    );
  }
}
