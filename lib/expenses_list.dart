import 'package:expense_tracker/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/expense.dart';

class ExpenseList extends StatelessWidget{
  const ExpenseList({super.key,required this.expenses,required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx,index)=> Dismissible(
        key: ValueKey(expenses[index].id),
        onDismissed: (direction){
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expense: expenses[index],),
      ),
      itemCount: expenses.length,



    );

  }


}