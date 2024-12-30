import 'package:flutter/material.dart';

import '../Screen/feedback_screen.dart';
import '../Screen/setting.dart';
import '../Screen/chat_screen.dart';

class Bottonbar extends StatefulWidget {
  const Bottonbar(int i, {super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<Bottonbar> {
  int _selectedIndex = 0;

  // 每個頁面的 Widget 列表，這些頁面會有各自的 AppBar
  final List<Widget> _pages = [
    ChatScreen(),
    const Settingscreen(),
    FeedbackScreen(
      instruction: '',
      generatedText: '',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const LinearProgressIndicator();
    return Scaffold(
      /*appBar: AppBar(
        title: Text('BottomNavigationBar Example'),
      ),*/
      body: _pages[_selectedIndex], // 顯示對應頁面

      bottomNavigationBar: Transform.translate(
        offset: const Offset(0, -10),
        child: SafeArea(
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFF17203A).withOpacity(0.8),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF17203A).withOpacity(0.4),
                  offset: const Offset(0, 15),
                  blurRadius: 20,
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0xFF17203A).withOpacity(0),
              elevation: 0,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_applications),
                  label: 'Setting',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.import_contacts),
                  label: 'Feedback',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
