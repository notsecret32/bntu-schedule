import 'package:bntu_schedule/core/widgets/custom_ad_banner.dart';
import 'package:flutter/material.dart';

import './select_group_footer.dart';
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
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SelectGroupFooter(),
              SizedBox(
                height: 16,
              ),
              CustomAdBanner(),
            ],
          ),
        ],
      ),
    );
  }
}
