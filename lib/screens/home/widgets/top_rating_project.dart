import 'package:flutter/material.dart';

class TopRatingProject extends StatelessWidget {
  const TopRatingProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine if the screen is small or large for responsiveness
        bool isLargeScreen = constraints.maxWidth > 600;

        return Container(
          width: double.infinity,
          height: 400,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple.shade800, Colors.purple.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: AssetImage('assets/images/3dimage.png'),
              fit: BoxFit.cover,
              opacity: 0.3,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ETHEREUM 2.0",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: isLargeScreen ? 18 : 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Top Rating \n Project",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isLargeScreen ? 40 : 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Trending project and high rating\nProject Created by team.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: isLargeScreen ? 20 : 18,
                ),
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey.shade900,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Learn More.",
                  style: TextStyle(
                      color: Colors.white, fontSize: isLargeScreen ? 16 : 14),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
