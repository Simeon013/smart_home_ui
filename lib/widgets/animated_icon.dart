import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedLottieIcon extends StatelessWidget {
  final String assetPath;
  final double size;
  final AnimationController? controller;
  final Duration? duration;
  final bool? repeat;
  final bool? reverse;

  const AnimatedLottieIcon({super.key, 
    required this.assetPath,
    this.size = 45.0,
    this.controller, 
    this.duration, 
    this.repeat, 
    this.reverse,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      assetPath,
      height: size,
      width: size,
      controller: controller, // Utilisation du même AnimationController
      repeat: false,
    );
  }
}
