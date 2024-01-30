import 'package:bntu_schedule/features/welcome/presentation/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({
    super.key,
  });

  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  final PageController _controller = PageController();
  final List<Widget> _pages = const <Widget>[
    WelcomeAbout(),
    WelcomeActions(),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SafeArea(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height - 72,
            child: PageView(
              controller: _controller,
              children: _pages,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SmoothPageIndicator(
              controller: _controller,
              count: _pages.length,
              effect: WormEffect(
                dotColor: theme.colorScheme.onSecondary,
                activeDotColor: theme.colorScheme.primaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
