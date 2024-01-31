import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:bntu_schedule/features/admin/presentation/cubit/admin_authentication_cubit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdminAuthenticationForm extends StatefulWidget {
  const AdminAuthenticationForm({super.key});

  @override
  State<AdminAuthenticationForm> createState() =>
      _AdminAuthenticationFormState();
}

class _AdminAuthenticationFormState extends State<AdminAuthenticationForm> {
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
              validator: _loginValidator,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              hintText: 'Пароль',
              controller: _passwordTextController,
              validator: _passwordValidator,
              isPassword: true,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              text: 'Войти',
              onPress: _onLoginButtonPressed,
            ),
          ],
        ),
      ),
    );
  }

  String? _loginValidator(String? value) {
    return EmailValidator.validate(value!) ? null : 'Введен неверный email';
  }

  String? _passwordValidator(String? value) {
    return value!.length > 4
        ? null
        : 'Пароль должен состоять из 4 и более символов';
  }

  Future<void> _onLoginButtonPressed() async {
    if (_formKey.currentState!.validate()) {
      await context.read<AdminAuthenticationCubit>().login(
            email: _emailTextController.text,
            password: _passwordTextController.text,
          );

      context.goNamed(RoutesList.adminPanelPage.name);
    }
  }
}
