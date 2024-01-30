import 'package:bntu_schedule/features/schedules/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SelectGroupBody extends StatelessWidget {
  const SelectGroupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        top: 16,
        right: 16,
        bottom: 35,
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SelectGroupForm(),
          SelectGroupFooter(),
        ],
      ),
    );
  }
}
