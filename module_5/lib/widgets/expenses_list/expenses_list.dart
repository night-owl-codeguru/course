import 'package:flutter/material.dart';
import 'package:module_5/models/expense.dart';
import 'package:module_5/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final width = constraints.maxWidth;

        if (width >= 600) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: expenses.length,
            itemBuilder:
                (ctx, index) => Dismissible(
                  key: ValueKey(expenses[index]),
                  background: Container(
                    color: Theme.of(
                      context,
                    ).colorScheme.error.withOpacity(0.75),
                    margin: EdgeInsets.symmetric(
                      horizontal:
                          Theme.of(context).cardTheme.margin?.horizontal ?? 16,
                    ),
                  ),
                  onDismissed: (direction) {
                    onRemoveExpense(expenses[index]);
                  },
                  child: ExpenseItem(expenses[index]),
                ),
          );
        }

        return ListView.builder(
          itemCount: expenses.length,
          itemBuilder:
              (ctx, index) => Dismissible(
                key: ValueKey(expenses[index]),
                background: Container(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.75),
                  margin: EdgeInsets.symmetric(
                    horizontal:
                        Theme.of(context).cardTheme.margin?.horizontal ?? 16,
                  ),
                ),
                onDismissed: (direction) {
                  onRemoveExpense(expenses[index]);
                },
                child: ExpenseItem(expenses[index]),
              ),
        );
      },
    );
  }
}
