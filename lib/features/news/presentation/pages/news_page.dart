import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/generated/l10n.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(S.of(context).news),
      ),
    );
  }
}
