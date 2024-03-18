import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/shared_preferences_provider.dart';
import '../notifiers/group_number_notifier.dart';

typedef GroupNumberStateNotifier
    = StateNotifierProvider<GroupNumberNotifier, GroupNumber?>;
typedef GroupNumberStateNotifierRef
    = StateNotifierProviderRef<GroupNumberNotifier, GroupNumber?>;

final GroupNumberStateNotifier groupNumberProvider = GroupNumberStateNotifier(
  (GroupNumberStateNotifierRef ref) => GroupNumberNotifier(
    sharedPreferences: ref.read(
      sharedPreferencesProvider,
    ),
  ),
);
