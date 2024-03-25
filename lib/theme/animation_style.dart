import 'package:flutter/animation.dart';

AnimationStyle buildAnimationStyle() {
  return AnimationStyle(
    curve: Curves.bounceIn,
    duration: const Duration(milliseconds: 500),
    reverseDuration: const Duration(milliseconds: 300),
  );
}
