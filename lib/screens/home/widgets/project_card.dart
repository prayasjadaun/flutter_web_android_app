import 'package:flutter/material.dart';

class AllProjectsCard extends StatelessWidget {
  final List<ProjectItemData> projects;

  const AllProjectsCard({
    super.key,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;

        return MouseRegion(
          onEnter: (_) {},
          onExit: (_) {},
          child: Container(
            padding: EdgeInsets.all(isMobile ? 10.0 : 16.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'All Projects',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 18 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ...projects.map((project) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: isMobile ? 8 : 10),
                    child: MouseRegion(
                      onEnter: (_) {},
                      onExit: (_) {},
                      child: ProjectItem(
                        title: project.title,
                        subtitle: project.subtitle,
                        icon: project.icon,
                        iconColor: project.iconColor,
                        iconSize: isMobile ? 20 : 24,
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProjectItemData {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;

  ProjectItemData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
  });
}

class ProjectItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final double iconSize;

  const ProjectItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.iconSize,
  });

  @override
  _ProjectItemState createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true; // Trigger hover effect
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false; // Reset hover effect
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _isHovered
              ? Colors.red[900]
              : Colors.transparent, // Change background color on hover
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: _isHovered
              ? [
                  const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ]
              : [], // Add shadow effect on hover
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: widget.iconColor,
              size: widget.iconSize,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.subtitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
