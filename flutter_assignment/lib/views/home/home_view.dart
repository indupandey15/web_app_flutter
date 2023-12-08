import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// HomeView: Represents the home screen of the application
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

// _HomeViewState: State class for the HomeView widget
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    // Scaffold: Provides the basic structure of the visual interface
    return Scaffold(
      // AppBar: Displays the app bar with a title
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("Welcome"),
      ),
      // Body: Contains the main content of the screen
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon: Displays a home icon with specific styling
            const Icon(
              Icons.home,
              color: Colors.red,
              size: 100,
            ),
            const SizedBox(
              height: 8,
            ),
            // Text: Displays a greeting message with specific styling
            const Text(
              "Greetings!",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 12,
            ),
            // MaterialButton: Represents a button to navigate to the "subHome" route
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {
                // goNamed: Navigates to the "subHome" route
                context.goNamed("subHome");
              },
              child: const Text(
                "Calculator",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
