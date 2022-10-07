import 'package:flutter/material.dart';

class ChartBarProgress extends StatelessWidget {
  final double? percentage;
  final double percentageDisplay;
  final BoxConstraints? constraints;

  const ChartBarProgress({
    this.percentage,
    required this.percentageDisplay,
    this.constraints,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints!.maxHeight * percentageDisplay,
      width: 10,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              color: const Color.fromRGBO(200, 200, 200, 1),
            ),
          ),
          FractionallySizedBox(
            heightFactor: percentage,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
