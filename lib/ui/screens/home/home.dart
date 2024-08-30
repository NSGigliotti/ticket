import 'package:flutter/material.dart';
import 'package:ticket/core/theme/theme.dart';
import 'package:ticket/ui/screens/films/films_screen.dart';
import 'package:ticket/ui/screens/location/location_screen.dart';
import 'package:ticket/ui/screens/profile/profile_screen.dart';
import 'package:ticket/ui/screens/ticket/ticket_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List viewr =  [
    const FilmsScreen(),
    LocationScreen(),
    const TicketScreen(),
    const ProfileScreen(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void onItemTapped(index) {
      setState(() {
        selectedIndex = index;
      });
    }

    

    return Container(
      decoration: AppTheme.backgoundDecoration,
      child: Scaffold(
        body: viewr.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onItemTapped,
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_activity),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            )
          ],
        ),
      ),
    );
  }
}
