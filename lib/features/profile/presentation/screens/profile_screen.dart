import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sermanos/features/profile/presentation/widgets/complete_profile.dart';
import 'package:sermanos/features/profile/presentation/widgets/incomplete_profile.dart';
import 'package:sermanos/features/user/providers.dart';

import '../../../user/domain/models/app_user_model.dart';

class ProfileScreen extends ConsumerWidget {
  static const route = "/profile";
  static const routeName = "profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppUser? user = ref.watch(currentUserProvider);

    if (user == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (user.isProfileFilled()) {
      return CompleteProfile(user: user);
    } else {
      return IncompleteProfile(user: user);
    }
  }
}
