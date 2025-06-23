import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_activity_frontend/features/user/application/user_view_model.dart';


class UserHeader extends ConsumerWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          state.user != null ? 'Hallo ${state.user!.username}' : 'Hallo',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
    );
  }
}
