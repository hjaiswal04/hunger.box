import 'package:flutter/material.dart';
import 'package:food_app/components/my_drawer_tile.dart';
import 'package:food_app/pages/login_page.dart';
import 'package:food_app/pages/settings_page.dart';
import 'package:food_app/services/auth/auth_service.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // App logo
          const Padding(
            padding: EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(25),
            child: Divider(),
          ),

          // Home list item
          MyDrawerTile(
            text: "HOME",
            icon: Icons.home,
            onTap: () {
              Navigator.pop(context);
            },
          ),

          // Settings list tile
          MyDrawerTile(
            text: "SETTINGS",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),

          const Spacer(),

          // Logout list tile
          MyDrawerTile(
            text: "LOGOUT",
            icon: Icons.logout,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage(
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
