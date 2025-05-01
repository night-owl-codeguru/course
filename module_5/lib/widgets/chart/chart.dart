import 'package:flutter/material.dart';
import 'package:module_5/models/expense.dart';
import 'package:module_5/widgets/chart/chart_bar.dart';

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return LayoutBuilder(
      builder: (ctx, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return Container(
          margin: EdgeInsets.all(width < 400 ? 8 : 16),
          padding: EdgeInsets.symmetric(
            vertical: height * 0.1,
            horizontal: width * 0.05,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.3),
                Theme.of(context).colorScheme.primary.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (final bucket in buckets)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01,
                          ),
                          child: ChartBar(
                            fill:
                                bucket.totalExpenses == 0
                                    ? 0
                                    : bucket.totalExpenses / maxTotalExpense,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.05),
              Row(
                children:
                    buckets
                        .map(
                          (bucket) => Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.01,
                              ),
                              child: Icon(
                                categoryIcons[bucket.category],
                                size: width < 400 ? 16 : 24,
                                color:
                                    isDarkMode
                                        ? Theme.of(
                                          context,
                                        ).colorScheme.secondary
                                        : Theme.of(
                                          context,
                                        ).colorScheme.primary.withOpacity(0.7),
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
    : expenses =
          allExpenses.where((expense) => expense.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
