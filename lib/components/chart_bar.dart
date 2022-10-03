import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;
  const ChartBar({
    required this.label,
    required this.value,
    required this.percentage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value.toString()),
        const SizedBox(height: 5),
        Container(
          color: Colors.amber,
          height: 60,
          width: 10,
          child: null,
        ),
        Text(label),
      ],
    );
  }
}
