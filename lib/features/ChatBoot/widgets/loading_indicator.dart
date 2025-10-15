
import 'package:flutter/material.dart';

class LodingIndicator extends StatelessWidget {
  const LodingIndicator({
    super.key,
    required AnimationController dotsController,
  }) : _dotsController = dotsController;

  final AnimationController _dotsController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 14,
            child: Text("IA", style: TextStyle(fontSize: 10)),
          ),
          const SizedBox(width: 8),
          AnimatedBuilder(
            animation: _dotsController,
            builder: (context, child) {
              int dot = (_dotsController.value * 3).floor() % 3;
              return Row(
                children: List.generate(3, (index) {
                  return Opacity(
                    opacity: index == dot ? 1 : 0.3,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.0),
                      child: Text(
                        ".",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
