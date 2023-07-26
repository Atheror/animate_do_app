import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Notifications Page'),
      ),
      floatingActionButton: const _CustomFAB(),
      bottomNavigationBar: const _BottomNavigationBar(),
    );
  }
}

class _CustomFAB extends StatelessWidget {
  const _CustomFAB();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      onPressed: () {},
      child: const FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bone),
          label: 'Bones',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              const FaIcon(FontAwesomeIcons.bell),
              Positioned(
                  top: 0.0,
                  right: 0.0,
                  // child: Icon(Icons.brightness_1, size: 8, color: Colors.pinkAccent),
                  child: Container(
                    alignment: Alignment.center,
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Colors.pinkAccent,
                      shape: BoxShape.circle,
                    ),
                    child: const Text('42', style: TextStyle(color: Colors.white, fontSize: 7)),
                  )),
            ],
          ),
          label: 'Notifications',
        ),
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.dog),
          label: 'My Dog',
        ),
      ],
    );
  }
}
