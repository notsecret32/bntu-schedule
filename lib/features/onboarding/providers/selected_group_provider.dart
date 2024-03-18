import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../notifiers/group_number_notifier.dart';
import 'group_number_provider.dart';

part 'selected_group_provider.g.dart';

@riverpod
GroupNumber? selectedGroupNumber(SelectedGroupNumberRef ref) => ref.watch(
      groupNumberProvider,
    );
