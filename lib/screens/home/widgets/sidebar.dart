import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Determine screen width for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;

    final avatarRadius = screenWidth < 600 ? 30.0 : 40.0;
    final nameFontSize = screenWidth < 600 ? 16.0 : 18.0;

    return Container(
      padding: EdgeInsets.all(screenWidth < 600 ? 12 : 16),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundImage: const AssetImage(
                'assets/images/as.png',
              ),
            ),
          ),
          const Divider(),
          CircleAvatar(
            radius: avatarRadius,
            backgroundImage: const AssetImage('assets/images/girlprofile.jpg'),
          ),
          const SizedBox(height: 10),
          Text(
            "Pooja Mishra",
            style:
                TextStyle(fontSize: nameFontSize, fontWeight: FontWeight.bold),
          ),
          Text(
            "Admin",
            style: TextStyle(color: Colors.grey[600]),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class NavigationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Determine screen width for responsive adjustments
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth < 600 ? 20.0 : 24.0;
    final fontSize = screenWidth < 600 ? 14.0 : 16.0;

    return Expanded(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.home, size: iconSize),
            title: Text('Home', style: TextStyle(fontSize: fontSize)),
          ),
          ListTile(
            leading: Icon(Icons.person, size: iconSize),
            title: Text('Employees', style: TextStyle(fontSize: fontSize)),
          ),
          ListTile(
            leading: Icon(Icons.access_time, size: iconSize),
            title: Text('Attendance', style: TextStyle(fontSize: fontSize)),
          ),
          ListTile(
            leading: Icon(Icons.summarize, size: iconSize),
            title: Text('Summary', style: TextStyle(fontSize: fontSize)),
          ),
          ListTile(
            leading: Icon(Icons.info, size: iconSize),
            title: Text('Information', style: TextStyle(fontSize: fontSize)),
          ),
          ListTile(
            leading: Icon(Icons.workspace_premium, size: iconSize),
            title: Text('Workspaces', style: TextStyle(fontSize: fontSize)),
          ),
          // SizedBox(
          //   height: 50,
          // ),
          ListTile(
            leading: Icon(Icons.settings, size: iconSize),
            title: Text('Settings', style: TextStyle(fontSize: fontSize)),
          ),
          ListTile(
            leading: Icon(Icons.logout, size: iconSize),
            title: Text('Logout', style: TextStyle(fontSize: fontSize)),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Determine screen width for container width adjustment
    final screenWidth = MediaQuery.of(context).size.width;
    final sidebarWidth = screenWidth < 600 ? 200 : 250;

    return Container(
      width: sidebarWidth.toDouble(),
      color: Colors.grey[200],
      child: Column(
        children: [
          UserProfile(),
          NavigationMenu(),
        ],
      ),
    );
  }
}

class WebLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Web layout with a permanent sidebar
      body: Row(
        children: [
          Sidebar(), // The sidebar will always be visible on the web
          const Expanded(
            child: Center(
              child: Text('Main Content Area', style: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      ),
    );
  }
}
