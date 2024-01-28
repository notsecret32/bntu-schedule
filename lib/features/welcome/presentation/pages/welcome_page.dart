import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/features/welcome/presentation/cubit/welcome_actions_cubit.dart';
import 'package:bntu_schedule/features/welcome/presentation/widgets/widget.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

const List<StatelessWidget> defaultWelcomePages = <StatelessWidget>[
  WelcomeAbout(),
  WelcomeActions(),
];

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BlocProvider<WelcomeActionsCubit>(
      create: (BuildContext context) => sl<WelcomeActionsCubit>(),
      child: Scaffold(
        backgroundColor: theme.primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height - 72,
                  child: PageView(
                    controller: _pageController,
                    children: defaultWelcomePages,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: defaultWelcomePages.length,
                    effect: WormEffect(
                      dotColor: theme.colorScheme.onSecondary,
                      activeDotColor: theme.colorScheme.primaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
