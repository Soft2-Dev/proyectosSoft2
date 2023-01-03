import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItems extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isActive;
  final Function onPressd;

  const MenuItems({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressd,
    this.isActive = false,
  }) : super(key: key);

  @override
  _MenuItemsState createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  bool isHoverd = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      color: isHoverd
          ? Colors.white.withOpacity(0.2)
          : widget.isActive
              ? Colors.white.withOpacity(0.2)
              : Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.isActive ? null : () => widget.onPressd(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: MouseRegion(
              onEnter: (_) => setState(() => isHoverd = true),
              onExit: (_) => setState(() => isHoverd = false),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(widget.icon, color: Colors.white.withOpacity(0.3)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.text,
                    style: GoogleFonts.roboto(
                        fontSize: 16, color: Colors.white.withOpacity(0.8)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
