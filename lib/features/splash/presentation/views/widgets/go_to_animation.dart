import 'package:flutter/material.dart';
class GoToAnimation extends StatelessWidget {
  const GoToAnimation({
    super.key,
    required this.animation,
  });

  final Animation<Offset> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder:(context,_)=> SlideTransition(
        position: animation,
        child: Text('read free books', textAlign: TextAlign.center),
      ),
    );
  }
}
