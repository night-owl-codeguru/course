import 'package:flutter/material.dart';
import 'package:module_5/models/expense.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            final maxWidth = constraints.maxWidth;

            return maxWidth > 300
                ? Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            expense.title,
                            style: Theme.of(context).textTheme.titleLarge,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text('\$${expense.amount.toStringAsFixed(2)}'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Row(
                      children: [
                        Icon(categoryIcons[expense.category]),
                        const SizedBox(width: 8),
                        Text(formatter.format(expense.date)),
                      ],
                    ),
                  ],
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      expense.title,
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text('\$${expense.amount.toStringAsFixed(2)}'),
                        const Spacer(),
                        Row(
                          children: [
                            Icon(categoryIcons[expense.category]),
                            const SizedBox(width: 8),
                            Text(formatter.format(expense.date)),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
          },
        ),
      ),
    );
  }
}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};
