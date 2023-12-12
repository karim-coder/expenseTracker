import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense/new_expense.dart';
import 'package:flutter/material.dart';

// import 'package:expense_tracker/expenses.dart'
class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Flutter Course",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Cinema",
        amount: 15.69,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "Travel",
        amount: 15.69,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: "Food",
        amount: 15.69,
        date: DateTime.now(),
        category: Category.food)
  ];

  _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
              icon: const Icon(Icons.add), onPressed: _openAddExpenseOverlay)
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
        ],
      ),
    );
  }
}
