import 'package:flutter/material.dart';

class NotificationsIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Icon(
            Icons.notifications_none_outlined,
            color: Colors.grey,
          ),
          Positioned(
            left: 2,
            child: Container(
              width: 6,
              height: 6,
              decoration: buildDecoration(),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildDecoration() => BoxDecoration(
      color: Colors.red, borderRadius: BorderRadius.circular(100));
}
