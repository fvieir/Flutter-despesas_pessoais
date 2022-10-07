import 'package:expenses/components/chart_bar/chart_bar_label.dart';
import 'package:expenses/components/chart_bar/chart_bar_progress.dart';
import 'package:expenses/components/chart_bar/chart_bar_value.dart';
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
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          ChartBarValue(
            constraints: constraints,
            percentageDisplay: 0.15,
            value: value.toString(),
          ),
          SizedBox(height: constraints.maxHeight * 0.05),
          ChartBarProgress(
            percentageDisplay: 0.6,
            constraints: constraints,
            percentage: percentage,
          ),
          SizedBox(height: constraints.maxHeight * 0.05),
          ChartBarLabel(
            constraints: constraints,
            label: label,
          )
        ],
      );
    });
  }
}
