import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/src/core/constants/routes.dart';
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

  /// The global key for form validation.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final StackRouter router = AutoRouter.of(context);
    return BlocProvider<SelectGroupBloc>(
      create: (BuildContext context) => sl<SelectGroupBloc>(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Выбор группы',
        ),
        body: BlocConsumer<SelectGroupBloc, SelectGroupState>(
          listener: (BuildContext context, SelectGroupState state) {
            if (state is SelectGroupNumberSelected) {
              router.navigateNamed(homeSchedulesPageRouteKey);
            }

            if (state is SelectGroupNumberRemoved) {
              router.navigateNamed(selectGroupPageRouteKey);
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
              router.navigateNamed(selectGroupPageRouteKey);
            }

            if (state is SelectGroupLoadedState) {
              final SelectGroupBloc bloc = context.read<SelectGroupBloc>();
              return _buildLoadedBody(state, bloc, router);
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
    StackRouter router,
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
                          ..onTap = () async => await router.navigateNamed(
                                adminLoginPageRouteKey,
                              ),
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
