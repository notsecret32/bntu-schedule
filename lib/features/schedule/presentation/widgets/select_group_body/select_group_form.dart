import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/features/schedule/presentation/bloc/group_bloc.dart';
import 'package:custom_widgets/widgets.dart'
    show CustomButton, CustomSnackBarViewer, CustomTextField;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectGroupForm extends StatefulWidget {
  const SelectGroupForm({super.key});

  @override
  State<SelectGroupForm> createState() => _SelectGroupFormState();
}

class _SelectGroupFormState extends State<SelectGroupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: BlocListener<GroupBloc, GroupState>(
        listenWhen: (_, GroupState current) =>
            current is GroupFailureState || current is GroupLoadedState,
        listener: (BuildContext context, GroupState state) {
          if (state is GroupLoadedState) {
            context.go(
              RoutesList.navigateToSelectedGroup(
                _controller.text.trim(),
              ),
            );
          }

          if (state is GroupFailureState) {
            CustomSnackBarViewer.showSnackBar(
              context: context,
              text: state.message,
              error: true,
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.only(
            left: 16,
            top: 16,
            right: 16,
          ),
          child: Column(
            children: <Widget>[
              CustomTextField(
                hintText: 'Введите номер группы',
                inputType: TextInputType.number,
                controller: _controller,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                text: 'Выбрать',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<GroupBloc>()
                        .add(SelectGroupEvent(groupNumber: _controller.text));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
