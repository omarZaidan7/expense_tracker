import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
final uuid = const Uuid();


enum ExpenseCategory { food, travel, entertainment, work }
const categoryIcons = {
  ExpenseCategory.food: Icons.lunch_dining,
  ExpenseCategory.travel: Icons.flight_takeoff,
  ExpenseCategory.entertainment: Icons.movie,
  ExpenseCategory.work: Icons.work,
};

class Expense {
  Expense({required this.title,
    required this.amount,
    required this.date,
    required this.category}
      ):id=uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  get formattedDate{
    return formatter.format(date);
  }

}