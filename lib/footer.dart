// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'dashboard_screen.dart';
// import 'studentdetails_page.dart';

// class Navigation extends StatefulWidget {
//   const Navigation({super.key});

//   @override
//   NavigationState createState() => NavigationState();
// }

// class NavigationState extends State<Navigation> {
//   int _selectedIndex = 2; // Default selected index (center/home icon)

//   final List<Widget> _screens = [
//     const PlaceholderScreen(title: 'Assignments'), // Assignment screen
//     const PlaceholderScreen(title: 'Notifications'), // Notifications screen
//     const DashboardScreen(), // Home screen (Dashboard)
//     const PlaceholderScreen(title: 'Directions'), // Directions screen
//     const StudentProfilePage(), // Profile screen
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_selectedIndex], // Display the currently selected screen
//       bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: Colors.transparent, // Background behind the navigation bar
//         color: Colors.blueGrey, // Color of the navigation bar
//         items: const [
//           Icon(Icons.assignment, size: 30, color: Colors.white), // Assignment icon
//           Icon(Icons.notifications, size: 30, color: Colors.white), // Notifications icon
//           Icon(Icons.home, size: 30, color: Colors.white), // Home icon
//           Icon(Icons.directions_bus, size: 30, color: Colors.white), // Directions icon
//           Icon(Icons.person, size: 30, color: Colors.white), // Profile icon
//         ],
//         index: _selectedIndex, // Set the initial active index
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index; // Update the selected index when an icon is tapped
//           });
//         },
//       ),
//     );
//   }
// }

// // Define the PlaceholderScreen class
// class PlaceholderScreen extends StatelessWidget {
//   final String title;

//   const PlaceholderScreen({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title)),
//       body: Center(child: Text('$title Screen')),
//     );
//   }
// }
