import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/theme/colors/graphic_colors.dart';
import '../../../core/theme/colors/light_colors.dart';
import '../../../core/theme/text_theme.dart';
import '../widgets/board.dart';
import '../widgets/select_group_modal.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return PlatformScaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            controller: controller,
            children: <Widget>[
              _createBoard(
                pathToImage: 'assets/images/onboarding-1.png',
                title: 'Привет! Это приложение БНТУ Расписание',
                description:
                    'Просматривай актуальное расписание быстро и удобно',
                textTheme: textTheme,
              ),
              _createBoard(
                pathToImage: 'assets/images/onboarding-2.png',
                title: 'Быстрый поиск по университету',
                description:
                    'Узнавай информацию о группах, преподавателях и свободных аудиториях',
                textTheme: textTheme,
              ),
              _createBoard(
                pathToImage: 'assets/images/onboarding-3.png',
                title: 'Уведомления о начале занятий',
                description: 'Получай уведомления о начале занятий',
                textTheme: textTheme,
              ),
              _createBoard(
                pathToImage: 'assets/images/onboarding-4.png',
                title: 'Групповые чаты для общения',
                description:
                    'Создавайте группы с одногруппниками для обсуждения совместных проектов',
                textTheme: textTheme,
              ),
            ],
          ),
          Positioned(
            bottom: 162,
            child: SmoothPageIndicator(
              controller: controller,
              count: 4,
              effect: const SlideEffect(
                dotColor: graphicsGray,
                activeDotColor: graphicsBlue,
                dotWidth: 7,
                dotHeight: 7,
                spacing: 7,
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 54,
            child: PlatformElevatedButton(
              onPressed: () async => showPlatformModalSheet(
                material: MaterialModalSheetData(isScrollControlled: true),
                context: context,
                builder: (_) => const SelectGroupModal(),
              ),
              child: const Text(
                'Войти',
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _createBoard({
    required String pathToImage,
    required String title,
    required String description,
    required TextTheme textTheme,
  }) {
    return Board(
      image: Image.asset(
        pathToImage,
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: textTheme.title1,
      ),
      description: Text(
        description,
        textAlign: TextAlign.center,
        style: textTheme.body.copyWith(
          color: lightLabelSecondary,
        ),
      ),
    );
  }
}
