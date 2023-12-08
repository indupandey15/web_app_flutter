import 'package:flutter/material.dart';

class SubHomeView extends StatefulWidget {
  const SubHomeView({super.key});

  @override
  State<SubHomeView> createState() => _SubHomeViewState();
}

class _SubHomeViewState extends State<SubHomeView> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter first number'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter second number'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                calculate('+');
              },
              child: Text('Addition'),
            ),
            ElevatedButton(
              onPressed: () {
                calculate('-');
              },
              child: Text('Subtraction'),
            ),
            ElevatedButton(
              onPressed: () {
                calculate('*');
              },
              child: Text('Multiplication'),
            ),
            ElevatedButton(
              onPressed: () {
                calculate('/');
              },
              child: Text('Division'),
            ),
            SizedBox(height: 16),
            Text('Result: $result', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }

  void calculate(String operation) {
    double? num1 = double.tryParse(num1Controller.text);
    double? num2 = double.tryParse(num2Controller.text);

    if (num1 != null && num2 != null) {
      setState(() {
        switch (operation) {
          case '+':
            result = (num1 + num2).toString();
            break;
          case '-':
            result = (num1 - num2).toString();
            break;
          case '*':
            result = (num1 * num2).toString();
            break;
          case '/':
            result = (num2 != 0) ? (num1 / num2).toString() : 'Error: Division by zero';
            break;
        }
      });
    } else {
      setState(() {
        result = 'Invalid input';
      });
    }
  }
}
