import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/provider/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class NavbarAvatar extends StatelessWidget {
  final base = AllApi.url;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).usuarios;
    return GestureDetector(
      onTap: () {
        Provider.of<AuthProvider>(context, listen: false).logout();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: ClipOval(
          child: Container(
            width: 30,
            height: 30,
            child: Image.network(
                'https://accurservices.com/wp-content/uploads/2019/12/placeholder-profile.jpg'),
          ),
        ),
      ),
    );
  }
}
