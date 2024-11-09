import 'package:flutter/material.dart';

class CreatorItem extends StatelessWidget {
  final String name;
  final int artworks;

  const CreatorItem({
    Key? key,
    required this.name,
    required this.artworks,
    required TextStyle textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 8.0 : 16.0,
            vertical: isMobile ? 4.0 : 8.0,
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
              backgroundColor: Colors.white,
              radius: isMobile ? 20 : 25,
            ),
            title: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '$artworks artworks',
              style: TextStyle(
                color: Colors.white70,
                fontSize: isMobile ? 12 : 14,
              ),
            ),
            trailing: Icon(
              Icons.bar_chart,
              color: Colors.purple,
              size: isMobile ? 20 : 24,
            ),
          ),
        );
      },
    );
  }
}
