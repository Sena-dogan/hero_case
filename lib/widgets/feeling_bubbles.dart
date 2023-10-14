import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FeelingBubble extends StatelessWidget {
  const FeelingBubble({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFE3E6EB),
            ),
          ),
          const Gap(6),
          SizedBox(
            child: Text(
              text,
              style: GoogleFonts.roboto(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
