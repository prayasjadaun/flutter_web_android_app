import 'package:flutter/material.dart';

class WishingCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String buttonText;
  final List<Map<String, dynamic>> people;
  final VoidCallback onButtonPressed;

  const WishingCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.buttonText,
    required this.people,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Card(
      color: Colors.deepPurple[700],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white, size: isSmallScreen ? 20 : 24),
                SizedBox(width: isSmallScreen ? 6 : 8),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isSmallScreen ? 16 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: isSmallScreen ? 8 : 10),
            for (var person in people)
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(person['profilePic']),
                  radius: isSmallScreen ? 18 : 24,
                ),
                title: Text(
                  person['name'],
                  style: TextStyle(
                      color: Colors.white, fontSize: isSmallScreen ? 14 : 16),
                ),
                subtitle: Text(
                  person['subtitle'] ?? '',
                  style: TextStyle(
                      color: Colors.white70, fontSize: isSmallScreen ? 12 : 14),
                ),
              ),
            SizedBox(height: isSmallScreen ? 8 : 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(
                  vertical: isSmallScreen ? 10 : 12,
                  horizontal: isSmallScreen ? 16 : 24,
                ),
              ),
              onPressed: onButtonPressed,
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                      color: Colors.white, fontSize: isSmallScreen ? 14 : 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
