import 'package:flutter/material.dart';

class ChartBarValue extends StatelessWidget {
  final String? value;
  final BoxConstraints? constraints;
  final double percentageDisplay;

  const ChartBarValue({
    this.value,
    this.constraints,
    required this.percentageDisplay,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints!.maxHeight * percentageDisplay,
      child: FittedBox(
        child: Text(value!),
      ),
    );
  }
}
