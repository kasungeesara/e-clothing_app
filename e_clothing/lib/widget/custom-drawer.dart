// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';

import '../screens/user_panel/allcategory.dart';
import '../screens/user_panel/mainscreen.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 250, 251, 249),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 56, 55, 55),
            ),
            child: Text(
              'KGK STORE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            selected: _selectedIndex == 0,
            title: const Text('HOME'),
            leading: const Icon(Icons.home),
            onTap: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const mainscreen())
                    );
            }
          ),
          ListTile(
            selected: _selectedIndex == 1,
            title: const Text('PRODUCTS'),
            leading: const Icon(Icons.production_quantity_limits),
            onTap: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const allcategoryscreen())
                    );
            }
          ),
          ListTile(
            selected: _selectedIndex == 2,
            title: const Text('ORDERS'),
            leading: const Icon(Icons.shopping_bag),
            onTap: () => _onItemTapped(2),
          ),
          ListTile(
            selected: _selectedIndex == 3,
            title: const Text('CONTACTS'),
            leading: const Icon(Icons.help),
            onTap: () => _onItemTapped(3),
          ),
          ListTile(
            selected: _selectedIndex == 4,
            title: const Text('LOGOUT'),
            leading: const Icon(Icons.logout),
            onTap: () => _onItemTapped(4),
          ),
        ],
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color:Colors.white),
//         title: Text('Home Page'),
//       ),
//       drawer: Sidebar(),
//       body: Center(
//         child: Text('Home Page Content'),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: HomePage(),
//   ));
// }
