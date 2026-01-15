import 'package:flutter/material.dart';

class JijiHeader extends StatelessWidget {
  const JijiHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Jiji",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Text(
          "Your AI Friend",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        const SizedBox(height: 8),
        // This Stack allows the image to overlap and use custom shapes
        Stack(
          alignment: Alignment.center,
          children: [
            // 1. The subtle glow effect behind the head
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.05),
                    blurRadius: 40,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),

            // 2. The Avatar Image (Using Image instead of CircleAvatar)
            // This ensures the hair/shoulders aren't cut off by a circle.
            SizedBox(
              height: 180, // Height adjusted to let shoulders sit naturally
              child: Image.asset(
                'assets/images/jiji_avatar.png',
                fit: BoxFit.contain,
              ),
            ),

            // 3. The Cyan Glow Accent positioned on the character's neck/suit
            Positioned(
              bottom: 45, // Adjusted to match the glowing light on her collar
              child: Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyanAccent.withOpacity(0.6),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
