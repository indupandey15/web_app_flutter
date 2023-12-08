import 'package:flutter/material.dart';

class SubSettingsView extends StatefulWidget {
  const SubSettingsView({Key? key}) : super(key: key);

  @override
  State<SubSettingsView> createState() => _SubSettingsViewState();
}

class _SubSettingsViewState extends State<SubSettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar: Displays the app bar with a title and custom background color
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Sub Settings View"),
      ),
      // Body: Contains the main content of the screen
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          // ListView.builder: Creates a scrollable list of widgets lazily
          itemBuilder: (context, index) {
            return Card(
              // Card: Represents a material design card.
              child: ListTile(
                // ListTile: Represents a single fixed-height row.
                leading: Text(
                  index.toString(),
                ),
                // Display the index on the left side of the ListTile
                title: Text("Settings no. $index"),
                // Display a text with the index value
              ),
            );
          },
        ),
      ),
    );
  }
}
