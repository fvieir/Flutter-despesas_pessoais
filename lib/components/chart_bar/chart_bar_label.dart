import 'package:flutter/material.dart';

class ChartBarLabel extends StatelessWidget {
  final String? label;
  final BoxConstraints? constraints;
  const ChartBarLabel({this.label, this.constraints, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints!.maxHeight * 0.15,
      child: FittedBox(
        child: Text(label!),
      ),
    );
  }
}
