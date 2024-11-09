import 'package:flutter/material.dart';
import 'package:web_android_flutter_app/utils/creator_items.dart';

class TopCreatorsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;

        return Container(
          padding: EdgeInsets.all(isMobile ? 10.0 : 16.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey[900],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top Creators',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 18 : 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              CreatorItemWithHover(
                name: '@maddison_c21',
                artworks: 9821,
                textStyle: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: isMobile ? 8 : 10),
              CreatorItemWithHover(
                name: '@karl.will02',
                artworks: 7032,
                textStyle: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: isMobile ? 8 : 10),
              CreatorItemWithHover(
                name: '@james.art99',
                artworks: 4821,
                textStyle: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: isMobile ? 8 : 10),
              CreatorItemWithHover(
                name: '@paggy.bond',
                artworks: 9999,
                textStyle: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: isMobile ? 8 : 10),
            ],
          ),
        );
      },
    );
  }
}

class CreatorItemWithHover extends StatefulWidget {
  final String name;
  final int artworks;
  final TextStyle textStyle;

  const CreatorItemWithHover({
    super.key,
    required this.name,
    required this.artworks,
    required this.textStyle,
  });

  @override
  _CreatorItemWithHoverState createState() => _CreatorItemWithHoverState();
}

class _CreatorItemWithHoverState extends State<CreatorItemWithHover> {
  bool _isHovered = false;

  void _onHoverEnter(PointerEvent details) {
    setState(() {
      _isHovered = true;
    });
  }

  void _onHoverExit(PointerEvent details) {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onHoverEnter,
      onExit: _onHoverExit,
      child: Container(
        decoration: BoxDecoration(
          color: _isHovered ? Colors.blueGrey[800] : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: widget.textStyle.copyWith(
                    fontWeight:
                        _isHovered ? FontWeight.bold : FontWeight.normal,
                    color: _isHovered ? Colors.yellow : Colors.white,
                  ),
                ),
                Text(
                  '${widget.artworks} Artworks',
                  style: widget.textStyle.copyWith(
                      color: _isHovered ? Colors.white70 : Colors.white54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
