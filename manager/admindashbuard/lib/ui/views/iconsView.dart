import 'package:admin_dashbuard/ui/cards/whiteCard.dart';
import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Icons',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                  width: size.width * 0.2,
                  title: 'ac_unit_outlined',
                  child: Center(
                    child: Icon(Icons.ac_unit_outlined),
                  )),
              WhiteCard(
                  width: size.width * 0.2,
                  title: 'access_alarm_outlined',
                  child: Center(
                    child: Icon(Icons.access_alarm_outlined),
                  )),
              WhiteCard(
                  width: size.width * 0.2,
                  title: 'access_time_outlined',
                  child: Center(
                    child: Icon(Icons.access_time_outlined),
                  )),
              WhiteCard(
                  width: size.width * 0.2,
                  title: 'all_inbox_outlined',
                  child: Center(
                    child: Icon(Icons.all_inbox_outlined),
                  )),
              WhiteCard(
                  width: size.width * 0.2,
                  title: 'all_inbox_outlined',
                  child: Center(
                    child: Icon(Icons.access_time_outlined),
                  )),
              WhiteCard(
                  width: size.width * 0.2,
                  title: 'all_inbox_outlined',
                  child: Center(
                    child: Icon(Icons.account_tree_outlined),
                  )),
              WhiteCard(
                  width: size.width * 0.2,
                  title: 'all_inbox_outlined',
                  child: Center(
                    child: Icon(Icons.add_alert_outlined),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
