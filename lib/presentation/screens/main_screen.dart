import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
          duration: const Duration(milliseconds: 1100),
          child: const Text('Animate_do'),
        ),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.twitter),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const TwitterScreen()));
            },
          ),
          SlideInLeft(
            from: 50,
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const MainScreen()));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          child: const FaIcon(FontAwesomeIcons.play),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const NavigationScreen()));
          },
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElasticIn(
            duration: const Duration(milliseconds: 1300),
            child: const Icon(Icons.new_releases, color: Colors.blue, size: 40),
          ),
          FadeInDown(
            delay: const Duration(milliseconds: 200),
            // duration: const Duration(milliseconds: 3000),
            child: const Text('Titulo', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200)),
          ),
          FadeInDown(
            delay: const Duration(milliseconds: 800),
            child: const Text('soy un texto pequeño', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
          ),
          FadeInLeft(
            delay: const Duration(milliseconds: 1100),
            child: Container(width: 220, height: 2, color: Colors.blue),
          ),
        ],
      )),
    );
  }
}
