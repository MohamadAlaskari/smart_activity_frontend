// lib/features/weather/presentation/widgets/clothing_advice.dart
import 'package:flutter/material.dart';

class ClothingAdvice extends StatelessWidget {
  final String condition;
  const ClothingAdvice({super.key, required this.condition});

  @override
  Widget build(BuildContext context) {
    String advice = "";
    if (condition.toLowerCase().contains("regen")) {
      advice = "Nimm einen Regenschirm mit ☂️";
    } else if (condition.toLowerCase().contains("sonne")) {
      advice = "Sonnencreme nicht vergessen ☀️";
    } else {
      advice = "Zieh dich dem Wetter entsprechend an.";
    }

    return Padding(padding: const EdgeInsets.all(8.0), child: Text(advice));
  }
}
