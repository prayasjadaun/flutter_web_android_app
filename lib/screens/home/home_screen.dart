import 'package:flutter/material.dart';
import 'package:web_android_flutter_app/screens/home/main_screen.dart';
import 'package:web_android_flutter_app/screens/home/widgets/rightside_bar.dart';
import 'package:web_android_flutter_app/screens/home/widgets/sidebar.dart';
import 'package:web_android_flutter_app/screens/home/widgets/topbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: isMobile ? Sidebar() : null, // Drawer for mobile view
      appBar: TopBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            // Desktop/tablet view: Show Sidebar, MainContent, and RightSidebar in a row
            return Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Sidebar(),
                ),
                const Expanded(
                  flex: 8,
                  child: MainContent(),
                ),
                Expanded(
                  flex: 2,
                  child: RightSidebar(),
                ),
              ],
            );
          } else {
            // Mobile view: Only show MainContent, with a button to open RightSidebar as bottom sheet
            return const MainContent();
          }
        },
      ),
      floatingActionButton: isMobile
          ? FloatingActionButton(
              onPressed: () {
                // Show RightSidebar content as a bottom sheet in mobile view
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) => _BottomSheetContent(),
                );
              },
              backgroundColor: Colors.deepPurple,
              child: const Icon(Icons.calendar_today, color: Colors.white),
            )
          : null,
    );
  }
}

class _BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the bottom sheet
                },
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: RightSidebar(),
            ),
          ),
        ],
      ),
    );
  }
}
