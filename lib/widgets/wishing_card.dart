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
    return Card(
      color: Colors.deepPurple[700],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            for (var person in people)
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(person['profilePic']),
                ),
                title: Text(
                  person['name'],
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  person['subtitle'] ?? '',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: onButtonPressed,
              child: Center(
                  child: Text(
                buttonText,
                style: TextStyle(color: Colors.white),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
