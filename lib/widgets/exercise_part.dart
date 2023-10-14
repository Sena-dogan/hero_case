import 'package:flutter/material.dart';
import 'package:hero_case/widgets/exercise_category.dart';

class ExercisePart extends StatelessWidget {
  const ExercisePart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const color = Color.fromARGB(255, 220, 205, 245);
    const color2 = Color.fromARGB(255, 255, 215, 242);
    const color3 = Color.fromARGB(255, 255, 218, 188);
    const color4 = Color.fromARGB(255, 188, 234, 255);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.4,
      width: size.width * 0.9,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 3,
        ),
        children: const [
          ExerciseCategory(color: color, title: "Relaxation"),
          ExerciseCategory(color: color2, title: "Meditation"),
          ExerciseCategory(color: color3, title: "Breathing"),
          ExerciseCategory(color: color4, title: "Yoga"),
        ],
      ),
    );
  }
}
