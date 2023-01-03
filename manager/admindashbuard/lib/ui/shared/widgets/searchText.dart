import 'package:admin_dashbuard/ui/inputs/customInpunt.dart';
import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: buildDecoration(),
      child: TextField(
        decoration: CustomInputs.searchInputDecoration(
            hint: 'Buscar', icon: Icons.search_outlined),
      ),
    );
  }

  BoxDecoration buildDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.1),
      );
}
