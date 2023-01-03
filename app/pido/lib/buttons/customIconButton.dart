import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPressd;
  final String text;
  final Color color;
  final Color iconColor;
  final bool isFilled;
  final IconData icon;
  final double sizeIcon;
  final double space;

  const CustomIconButton({
    Key key,
     this.onPressd,
     this.text,
    this.icon,
    this.color = Colors.indigo,
    this.isFilled = false,
    this.iconColor = Colors.white,
    this.sizeIcon = 20,
    this.space = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(10),
      child: OutlinedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            backgroundColor: MaterialStateProperty.all(color.withOpacity(0.8)),
            overlayColor: MaterialStateProperty.all(color.withOpacity(0.5))),
        onPressed: () => onPressd(),
        child: Row(
          children: [
            if (icon != null)
              Icon(
                icon,
                color: iconColor,
                size: sizeIcon,
              ),
            SizedBox(
              width: space,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
