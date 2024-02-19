import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectGroupFooter extends StatelessWidget {
  const SelectGroupFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return RichText(
      text: TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: 'Вы администратор?',
            style: theme.textTheme.bodyMedium,
          ),
          const WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: SizedBox(width: 2),
          ),
          TextSpan(
            text: 'Войти',
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.goNamed(
                    RoutesList.adminAuthenticationPage.name,
                  ),
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
