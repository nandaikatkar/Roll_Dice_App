import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

//initializing it upside and then using it downside
const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

//here instead of using var variable we can use const coz,var can be reinitialized

// ignore: must_be_immutable
class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;
  //initizalization work

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        child: DiceRoller(),
      ),
    );
  }
}

//This is about creating own class file and caaling it in main.dart
// class GradientContainer extends StatelessWidget {
//   const GradientContainer({super.key, required this.colors});

//   final List<Color> colors;
//   //initizalization work

//   @override
//   Widget build(context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: colors,
//           begin: startAlignment,
//           end: endAlignment,
//         ),
//       ),
//       child: const Center(
//         child: StyledText('Hello Nandai Katkar'),
//       ),
//     );
//   }
// }
