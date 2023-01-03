import 'package:flutter/material.dart';

class OuntlinedButtonIcon extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final Color? textColor;
  final bool isFilled;
  final double padingHorizontal;
  final double padingvertical;

  const OuntlinedButtonIcon(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.color = Colors.blue,
      this.isFilled = false,
      this.textColor,
      this.padingHorizontal = 20,
      this.padingvertical = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: padingHorizontal),
      child: OutlinedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
            side: MaterialStateProperty.all(BorderSide(color: color)),
            backgroundColor: MaterialStateProperty.all(
                isFilled ? color.withOpacity(0.5) : Colors.transparent),
          ),
          onPressed: () => onPressed(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Icon(
                  Icons.upload_file,
                  color: color,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 15, color: textColor),
                ),
              ],
            ),
          )),
    );
  }
}
