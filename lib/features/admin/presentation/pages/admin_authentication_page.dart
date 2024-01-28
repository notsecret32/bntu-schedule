import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/core/constants/routes.dart';
import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:bntu_schedule/features/admin/presentation/cubit/admin_authentication_cubit.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class AdminAuthenticationPage extends StatefulWidget {
  const AdminAuthenticationPage({super.key});

  @override
  State<AdminAuthenticationPage> createState() =>
      _AdminAuthenticationPageState();
}

class _AdminAuthenticationPageState extends State<AdminAuthenticationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final StackRouter router = AutoRouter.of(context);
    return BlocProvider<AdminAuthenticationCubit>(
      create: (BuildContext context) => sl<AdminAuthenticationCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Вход',
          icon: Icons.arrow_back,
          onPress: () async => await router.navigateNamed(
            selectGroupPageRouteKey,
          ),
        ),
        body: BlocBuilder<AdminAuthenticationCubit, AdminAuthenticationState>(
          builder: (BuildContext context, AdminAuthenticationState state) {
            if (state is AdminAuthenticationFailureState) {
              return Center(
                child: Text(state.error),
              );
            }

            return Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    CustomTextField(
                      hintText: 'Логин',
                      controller: _emailTextController,
                      validator: (String? value) =>
                          EmailValidator.validate(value!)
                              ? null
                              : 'Введен неверный email',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      hintText: 'Пароль',
                      controller: _passwordTextController,
                      validator: (String? value) => value!.length > 4
                          ? null
                          : 'Пароль должен состоять из 4 и более символов',
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                      text: 'Войти',
                      onPress: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            await context
                                .read<AdminAuthenticationCubit>()
                                .login(
                                  _emailTextController.text,
                                  _passwordTextController.text,
                                );

                            await router.pushNamed(adminPanelPageRouteKey);
                          } catch (error) {
                            sl<Talker>().error(error);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
