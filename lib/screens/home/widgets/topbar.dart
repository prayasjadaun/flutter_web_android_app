import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // For larger screens, show the app name or logo without menu icon
          if (screenWidth >= 600) const Text('Dashboard'),

          // Flexible container for the search field to prevent overflow
          Flexible(
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 1, 37, 72),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  suffixIconColor: Colors.white,
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Colors.white),
                  suffixIcon: const Icon(Icons.search, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 1, 37, 72),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.note_alt_outlined),
          color: const Color(0xFF2B1E4F),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none_outlined),
          color: const Color(0xFF2B1E4F),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.power_settings_new),
          color: const Color(0xFF2B1E4F),
          onPressed: () {},
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.png'),
            radius: 18,
          ),
        ),
      ],
    );
  }
}
