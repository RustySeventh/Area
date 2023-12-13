import 'package:flutter/material.dart';

class CustomDrawerPage extends StatelessWidget {
  const CustomDrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Rend la page principale transparente
      appBar: AppBar(
        title: Text('Drawer Page'),
      ),
      body: CustomDrawer(),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        children: const [
          DrawerHeader(
            child: Icon(
              Icons.favorite,
              size: 100,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 40),
          ListTile(
            leading: Icon(Icons.home, size: 30),
            title: Text(
              'R E T U R N',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.settings, size: 30),
            title: Text(
              'S E T T I N G S',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.account_circle_outlined, size: 30),
            title: Text(
              'P R O F I L E',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.logout, size: 30),
            title: Text(
              'L O G O U T',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
