import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPressd;
  final String text;
  final Color color;
  final Color iconColor;
  final bool isFilled;
  final IconData? icon;

  const CustomIconButton({
    Key? key,
    required this.onPressd,
    required this.text,
    this.icon,
    this.color = Colors.indigo,
    this.isFilled = false,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: OutlinedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            backgroundColor: MaterialStateProperty.all(color.withOpacity(0.8)),
            overlayColor: MaterialStateProperty.all(color.withOpacity(0.0))),
        onPressed: () => onPressd(),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
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
