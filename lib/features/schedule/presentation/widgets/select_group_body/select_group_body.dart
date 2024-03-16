import 'package:flutter/material.dart';

import './select_group_form.dart';

class SelectGroupBody extends StatelessWidget {
  const SelectGroupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SelectGroupForm(),
        ],
      ),
    );
  }
}
