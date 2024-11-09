import 'package:flutter/material.dart';
import 'package:web_android_flutter_app/screens/home/main_screen.dart';
import 'package:web_android_flutter_app/screens/home/widgets/rightside_bar.dart';
import 'package:web_android_flutter_app/screens/home/widgets/sidebar.dart';
import 'package:web_android_flutter_app/screens/home/widgets/topbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: screenWidth < 600
          ? Sidebar() // Only show Sidebar as the drawer for mobile view
          : null, // For larger screens, don't show drawer
      appBar: TopBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Adjust layout based on screen width
          if (constraints.maxWidth > 800) {
            // Web view with sidebars
            return Row(
              children: [
                // Sidebar on the left for web view
                Expanded(
                  flex: 2,
                  child: Sidebar(),
                ),
                // Main Content Area
                const Expanded(
                  flex: 8,
                  child: MainContent(),
                ),
                // Right Sidebar for additional content or features
                Expanded(
                  flex: 2,
                  child: RightSidebar(),
                ),
              ],
            );
          } else {
            // Mobile view with a single column layout, without the sidebar on the body
            return const Column(
              children: [
                // Main Content Area without TopBar as it's already set in appBar
                Expanded(
                  child: MainContent(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
