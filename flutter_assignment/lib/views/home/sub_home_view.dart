import 'package:flutter/material.dart';

class SubHomeView extends StatefulWidget {
  const SubHomeView({Key? key}) : super(key: key);

  @override
  State<SubHomeView> createState() => _SubHomeViewState();
}

class _SubHomeViewState extends State<SubHomeView> {
  // Controllers for handling input from the user
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String result = ''; // Variable to store the calculation result

  @override
  Widget build(BuildContext context) {
    // Scaffold: Provides the basic structure of the visual interface
    return Scaffold(
      // AppBar: Displays the app bar with the title "Calculator"
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      // Body: Contains the main content of the screen
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TextField: Input field for the first number
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter first number'),
            ),
            SizedBox(height: 16),
            // TextField: Input field for the second number
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter second number'),
            ),
            SizedBox(height: 16),
            // ElevatedButton: Button to perform addition operation
            ElevatedButton(
              onPressed: () {
                calculate('+');
              },
              child: Text('Addition'),
            ),
            // ElevatedButton: Button to perform subtraction operation
            ElevatedButton(
              onPressed: () {
                calculate('-');
              },
              child: Text('Subtraction'),
            ),
            // ElevatedButton: Button to perform multiplication operation
            ElevatedButton(
              onPressed: () {
                calculate('*');
              },
              child: Text('Multiplication'),
            ),
            // ElevatedButton: Button to perform division operation
            ElevatedButton(
              onPressed: () {
                calculate('/');
              },
              child: Text('Division'),
            ),
            SizedBox(height: 16),
            // Text: Displays the result of the calculation
            Text('Result: $result', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }

  // Function to perform the calculation based on the selected operation
  void calculate(String operation) {
    // Parse user input to double; null if not a valid number
    double? num1 = double.tryParse(num1Controller.text);
    double? num2 = double.tryParse(num2Controller.text);

    // Check if both numbers are valid
    if (num1 != null && num2 != null) {
      // Update the UI with the calculated result
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
      // Update the UI with an error message for invalid input
      setState(() {
        result = 'Invalid input';
      });
    }
  }
}
