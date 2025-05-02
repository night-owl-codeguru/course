import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});

  final double fill;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth * 0.05,
          ),
          child: FractionallySizedBox(
            heightFactor: fill,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(constraints.maxWidth * 0.15),
                ),
                color:
                    isDarkMode
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(
                          context,
                        ).colorScheme.primary.withOpacity(0.65),
              ),
            ),
          ),
        );
      },
    );
  }
}
