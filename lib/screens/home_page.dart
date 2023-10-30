import 'package:flutter/material.dart';
import 'package:smart_garden_app/screens/tab_bar_widgets/home_tab_bar.dart';
import 'package:smart_garden_app/screens/tab_bar_widgets/profile_tab_bar.dart';
import 'package:smart_garden_app/widgets/settings_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> widgetOptions = <Widget>[
    const HomeTabBar(),
    const Text('Shop List Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    const ProfilePage(),
  ];

  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: selectedIndex == 2 ? null : getAppBar(),
      backgroundColor: const Color.fromARGB(255, 225, 255, 242),
      bottomNavigationBar: getBottomNavigationBar(),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
    );
  }

  BottomNavigationBar getBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: SizedBox(
              width: 112,
              height: 48,
              child: ImageIcon(
                AssetImage('lib/assets/aepod_home.png'),
                color: Color.fromRGBO(12, 147, 89, 1),
              ),
            ),
            label: ''),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list,
            color: Color.fromRGBO(17, 17, 17, .35),
            size: 32,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Color.fromRGBO(17, 17, 17, .35),
            size: 32,
          ),
          label: '',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      elevation: 5,
    );
  }

  AppBar getAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: const Text(
        'Hello, Isaac 🌿',
        style: TextStyle(
            color: Color.fromRGBO(17, 17, 17, 1),
            fontSize: 32,
            fontFamily: 'Trajan Pro',
            fontStyle: FontStyle.italic),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: const Color.fromRGBO(12, 147, 89, 0.05),
            ),
            child: IconButton(
              icon: const Icon(Icons.settings),
              color: const Color.fromRGBO(12, 147, 89, 1),
              iconSize: 24,
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => const FractionallySizedBox(
                    heightFactor: 0.46,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      child: SettingsBottomSheet(),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
