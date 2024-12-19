import 'package:flutter/material.dart';
import 'package:edlege/pages/help.dart';
import 'package:edlege/pages/home.dart';
import 'package:edlege/pages/requests.dart';
import 'package:edlege/pages/track.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int myCurrentIndex = 0;

  final List<Widget> pages = const [
    Home(),
    PendingRequests(),
    Track(),
    Help(),
  ];

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: myCurrentIndex,
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              myCurrentIndex = index;
              _navigatorKey.currentState!.pushReplacement(
                MaterialPageRoute(
                  builder: (context) => pages[myCurrentIndex],
                ),
              );
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/images/homeicn.png'),
                width: 30,
                height: 30,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/images/binincwhit2.png'),
                width: 20,
              ),
              label: "Pending Requests",
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/images/truckicn.png'),
                width: 30,
                height: 30,
              ),
              label: "Track",
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/images/helpicn.png'),
                width: 20,
              ),
              label: "Help",
            ),
          ],
        ),
        body: Navigator(
          key: _navigatorKey,
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              builder: (context) => pages[myCurrentIndex],
            );
          },
        ),
      ),
    );
  }
}
