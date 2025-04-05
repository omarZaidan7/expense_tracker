import 'package:expense_tracker/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/expense.dart';
import 'package:expense_tracker/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();

  }
}
    class _ExpensesState extends State<Expenses>{
    final List<Expense> _regiseredExpenses = [

      Expense(
        title: 'Course',
        amount: 9.99,
        date: DateTime.now(),
        category: ExpenseCategory.work,
      ),
      Expense(
        title: 'Course2',
        amount: 19.99,
        date: DateTime.now(),
        category: ExpenseCategory.entertainment,
      ),
    ];
    void _openAddExpense() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return  NewExpense(onAddExpense: _addExpense);
        },

      );
    }

    void _addExpense(Expense expense){
      setState(() {
        _regiseredExpenses.add(expense);
      });
    }
    void _removeExpense(Expense expense){
      final expenseIndex = _regiseredExpenses.indexOf(expense);
      setState(() {
        _regiseredExpenses.remove(expense);
      });


    }

    @override
    Widget build(BuildContext context) {
      final mediaQuery = MediaQuery.of(context);
      final isLandscape = mediaQuery.orientation == Orientation.landscape;

      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Expense Tracker',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              onPressed: _openAddExpense,
              icon: const Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mediaQuery.size.width * 0.05,
              ),
              child: const Text(
                'Swipe left or right to delete an expense',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _regiseredExpenses.isEmpty
                  ? const Center(
                child: Text(
                  'You can add expenses using the + button',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
                  : LayoutBuilder(
                builder: (ctx, constraints) {
                  return SizedBox(
                    height: constraints.maxHeight,
                    child: ExpenseList(
                      expenses: _regiseredExpenses,
                      onRemoveExpense: _removeExpense,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }



    }

