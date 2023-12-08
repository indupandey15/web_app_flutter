import 'package:flutter/material.dart';
import 'package:flutter_assignment/navigation/app_navigation.dart';

void main() {
  // Run the app by calling the runApp function and passing an instance of MyApp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MaterialApp.router: Create a material app with a custom router
    return MaterialApp.router(
      // Title of the app, displayed in the app switcher
      title: 'Flutter Assignment',

      // Disable the debug banner in the top-right corner
      debugShowCheckedModeBanner: false,

      // routerConfig: Specify the router configuration from the AppNavigation class
      routerConfig: AppNavigation.router,
    );
  }
}
