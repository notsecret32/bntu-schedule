import 'package:bntu_schedule/features/schedules/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SchedulesView extends StatefulWidget {
  const SchedulesView({
    super.key,
    required this.groupNumber,
  });

  final String groupNumber;

  @override
  State<SchedulesView> createState() => _SchedulesViewState();
}

class _SchedulesViewState extends State<SchedulesView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SchedulesHeader(
        formKey: _formKey,
        controller: _controller,
      ),
      body: SchedulesBody(groupNumber: widget.groupNumber),
    );
  }
}
