import 'package:flutter/material.dart';
import 'package:timer/ui/screens/shop_screen.dart';
import 'package:timer/ui/screens/timer_screen.dart';

/// 커스텀 드로어
class CustomDrawer extends StatelessWidget {
  /// 생성자
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('타이머'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TimerScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.store),
            title: const Text('상점'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ShopScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
