import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',tooltip: "HomeScreen",),
          BottomNavigationBarItem(icon: Icon(Icons.history_edu), label: 'Quotes',tooltip: "Quotes",),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting',tooltip: "Setting Screen"),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap:(int index) => _onTap(context, index),
      ),
    );
  }
  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}