import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'attendence_page.dart';
import 'digitalclasses.dart';
import 'studentdetails_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}
class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title, style: TextStyle(fontSize: 24))),
    );
  }
}


class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 2;

  final List<Widget> screens = [
    const PlaceholderScreen(title: 'Assignments'),
    const PlaceholderScreen(title: 'Notifications'),
    const DashboardScreen(),
    const PlaceholderScreen(title: 'Directions'),
    const StudentProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    const String schoolImage = 'assets/images/school.png';
    const String school1Image = 'assets/images/school1.png';
    const String sportsImage = 'assets/images/sports.png';

    final List<String> carouselImages = [schoolImage, school1Image, sportsImage];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'School See!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Where the students store their data',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/school_see_logo.png'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                  height: 150.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                ),
                items: carouselImages.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                  children: [
                    _DashboardCard(title: 'Student Attendance', icon: Icons.person_rounded, onTap: () => _navigateTo(context, const AttendanceDashboard())),
                    _DashboardCard(title: 'Digital Classes', icon: Icons.cast_for_education, onTap: () => _navigateTo(context, const EducationPage())),
                    _DashboardCard(title: 'Fee Status', icon: Icons.payment, onTap: () => _navigateTo(context, const PlaceholderScreen(title: 'Fee Status'))),
                    _DashboardCard(title: 'Bus Tracking', icon: Icons.directions_bus, onTap: () => _navigateTo(context, const PlaceholderScreen(title: 'Bus Tracking'))),
                    _DashboardCard(title: 'School Calendar', icon: Icons.calendar_month, onTap: () => _navigateTo(context, const PlaceholderScreen(title: 'School Calendar'))),
                    _DashboardCard(title: 'Assignments', icon: Icons.assignment, onTap: () => _navigateTo(context, const PlaceholderScreen(title: 'Assignments'))),
                    _DashboardCard(title: 'Results', icon: Icons.bar_chart, onTap: () => _navigateTo(context, const PlaceholderScreen(title: 'Results'))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.blueGrey,
        items: const [
          Icon(Icons.assignment, size: 30, color: Colors.white),
          Icon(Icons.notifications, size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.directions_bus, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        index: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

void _navigateTo(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

class _DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _DashboardCard({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFD1D9E6).withOpacity(1.0),
              blurRadius: 30,
              offset: const Offset(18, 18),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blueGrey),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
