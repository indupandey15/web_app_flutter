import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    required this.navigationShell,
    Key? key,
  }) : super(key: key);

  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  // Variable to track the selected index in the bottom navigation bar
  int selectedIndex = 0;

  // Function to navigate to a specific branch based on the selected index
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body: Contains the main content of the screen
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.navigationShell,
      ),
      // FloatingActionButton: Button for navigating to the 'Player' location
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Push to the 'Player' location when the button is pressed
          context.push(context.namedLocation('Player'));
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.map),
      ),
      // BottomNavigationBar: SlidingClippedNavBar for navigation between home and notes
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.white,
        onButtonPressed: (index) {
          // Update the selected index and navigate to the corresponding branch
          setState(() {
            selectedIndex = index;
          });
          _goBranch(selectedIndex);
        },
        iconSize: 30,
        activeColor: Colors.black,
        selectedIndex: selectedIndex,
        // Define the items in the bottom navigation bar
        barItems: [
          BarItem(
            icon: Icons.home,
            title: 'Home',
          ),
          BarItem(
            icon: Icons.notes,
            title: 'Notes',
          ),
        ],
      ),
    );
  }
}
