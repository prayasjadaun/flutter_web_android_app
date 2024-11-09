import 'package:flutter/material.dart';
import 'package:web_android_flutter_app/widgets/custom_calendar.dart';
import 'package:web_android_flutter_app/widgets/wishing_card.dart';

class RightSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;

        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A3B),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            // Wrap Column in SingleChildScrollView
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCalendar(),
                const SizedBox(height: 20),
                WishingCard(
                  title: "Today's Birthdays 🎉",
                  icon: Icons.cake,
                  buttonText: "Birthday Wishing",
                  people: const [
                    {
                      'name': 'John Doe',
                      'profilePic': 'assets/images/profile.png',
                      'subtitle': '🎂 Birthday'
                    },
                    {
                      'name': 'Jane Smith',
                      'profilePic': 'assets/images/girlprofile.jpg',
                      'subtitle': '🎂 Birthday'
                    },
                  ],
                  onButtonPressed: () {
                    // Action for birthday wishing
                  },
                ),
                const SizedBox(height: 20),
                WishingCard(
                  title: "Anniversaries 🎊",
                  icon: Icons.favorite,
                  buttonText: "Anniversary Wishing",
                  people: const [
                    {
                      'name': 'Alice Johnson',
                      'profilePic': 'assets/images/profile.png',
                      'subtitle': '💍 Anniversary'
                    },
                    {
                      'name': 'Bob Williams',
                      'profilePic': 'assets/images/girlprofile.jpg',
                      'subtitle': '💍 Anniversary'
                    },
                  ],
                  onButtonPressed: () {
                    // Action for anniversary wishing
                  },
                ),
                const SizedBox(height: 20),
                WishingCard(
                  title: "Upcoming Events 📅",
                  icon: Icons.event,
                  buttonText: "View Events",
                  people: const [
                    {
                      'name': 'Meeting with HR',
                      'profilePic': 'assets/images/girlprofile.jpg',
                      'subtitle': '10:00 AM - 11:00 AM'
                    },
                    {
                      'name': 'Project Deadline',
                      'profilePic': 'assets/images/event.jpg',
                      'subtitle': '5:00 PM'
                    },
                  ],
                  onButtonPressed: () {
                    // Action for viewing calendar events
                  },
                ),
                if (isMobile) const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
