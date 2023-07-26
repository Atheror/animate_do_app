import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text('Notifications Page'),
        ),
        floatingActionButton: const _CustomFAB(),
        bottomNavigationBar: const _BottomNavigationBar(),
      ),
    );
  }
}

class _CustomFAB extends StatelessWidget {
  const _CustomFAB();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      onPressed: () {
        final notiModel = Provider.of<_NotificationModel>(context, listen: false);
        notiModel.increment();
        if (notiModel.numero >= 1) {
          notiModel.bounceController?.forward(from: 0.0);
        }
      },
      child: const FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    final notiModel = Provider.of<_NotificationModel>(context);
    final numero = notiModel.numero;

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
              if (numero > 0) ...[
                Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: BounceInDown(
                      from: 10,
                      child: Bounce(
                        from: 10,
                        controller: (controller) => notiModel.bounceController = controller,
                        child: Container(
                          alignment: Alignment.center,
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Colors.pinkAccent,
                            shape: BoxShape.circle,
                          ),
                          child: Text('$numero', style: const TextStyle(color: Colors.white, fontSize: 7)),
                        ),
                      ),
                    )),
              ],
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

class _NotificationModel extends ChangeNotifier {
  AnimationController? bounceController;

  int _numero = 0;
  int get numero => _numero;
  set numero(int valor) {
    _numero = valor;
    notifyListeners();
  }

  void increment() {
    numero++;
  }

}
