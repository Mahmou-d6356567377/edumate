import 'package:flutter/material.dart';


class NavMainScreen extends StatefulWidget {
  const NavMainScreen({super.key});

  @override
  _NavMainScreenState createState() => _NavMainScreenState();
}

class _NavMainScreenState extends State<NavMainScreen> {
  int _selectedIndex = 0;

  // List of widgets for each screen (AppBar + Body combined)
  final List<Widget> _screens = [

  ];

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Display the selected screen
          _screens[_selectedIndex],

          // Custom Bottom Navigation Bar
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: deviceWidth * 0.9,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8), // Fixed method
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                        size: _selectedIndex == 0 ? 35 : 25,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                        size: _selectedIndex == 1 ? 35 : 25,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: _selectedIndex == 2 ? Colors.white : Colors.grey,
                        size: _selectedIndex == 2 ? 35 : 25,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.account_circle,
                        color: _selectedIndex == 3 ? Colors.white : Colors.grey,
                        size: _selectedIndex == 3 ? 35 : 25,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 3;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
