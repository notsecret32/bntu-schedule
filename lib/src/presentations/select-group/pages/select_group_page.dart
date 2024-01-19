import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/src/core/widgets/widgets.dart';
import 'package:bntu_schedule/src/injection.dart';
import 'package:bntu_schedule/src/presentations/select-group/bloc/select_group_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SelectGroupPage extends StatefulWidget {
  @override
  State<SelectGroupPage> createState() => _SelectGroupPageState();
}

class _SelectGroupPageState extends State<SelectGroupPage> {
  /// Selected group from [CustomDropdownSearch].
  ///
  /// Strictly cannot be null or empty.
  late String _selectedGroup;

  /// Navigation controller.
  late final StackRouter _router;

  /// The global key for form validation.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _router = AutoRouter.of(context);
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectGroupBloc>(
      create: (BuildContext context) => sl<SelectGroupBloc>(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Выбор группы',
        ),
        body: BlocConsumer<SelectGroupBloc, SelectGroupState>(
          listener: (BuildContext context, SelectGroupState state) {
            if (state is SelectGroupNumberSelected) {
              context.read<SelectGroupBloc>().add(
                    SelectGroupNavigateToEvent(
                      router: _router,
                      path: '/schedule',
                    ),
                  );
            }

            if (state is SelectGroupNumberRemoved) {
              context.read<SelectGroupBloc>().add(
                    SelectGroupNavigateToEvent(
                      router: _router,
                      path: '/select-group',
                    ),
                  );
            }
          },
          builder: (BuildContext context, SelectGroupState state) {
            if (state is SelectGroupInitialState) {
              context.read<SelectGroupBloc>().add(SelectGroupLoadEvent());
            }

            if (state is SelectGroupFailureState) {
              return Center(
                child: Text(
                  state.error,
                ),
              );
            }

            if (state is SelectGroupNumberRemoved) {
              context.read<SelectGroupBloc>().add(
                    SelectGroupNavigateToEvent(
                      router: _router,
                      path: '/select-group',
                    ),
                  );
            }

            if (state is SelectGroupLoadedState) {
              final SelectGroupBloc bloc = context.read<SelectGroupBloc>();
              return _buildLoadedBody(state, bloc);
            }

            // If nothing has passed, then this is SelectGroupLoadingState
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  /// A method for building the UI when the data is loaded.
  Widget _buildLoadedBody(
    SelectGroupLoadedState state,
    SelectGroupBloc bloc,
  ) {
    final ThemeData theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              /// ========== [Select Group & Confirm] ==========
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                  ),
                  CustomDropdownSearch(
                    items: state.groups,
                    onChange: (String? selectedGroup) {
                      setState(() {
                        _selectedGroup = selectedGroup!;
                      });
                    },
                    validator: (String? selectedGroup) =>
                        selectedGroup == null ? 'Группа не выбрана' : null,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomButton(
                    text: 'Выбрать',
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        bloc.add(
                          SelectGroupNumberEvent(
                            number: _selectedGroup,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),

              /// ========== [Admin Login Text] ==========
              Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: RichText(
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
                          ..onTap = () async =>
                              await _router.navigateNamed('/admin-login'),
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
