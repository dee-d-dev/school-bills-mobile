import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_bills/app/view/provider/auth_provider.dart';
import 'package:school_bills/core/utils/config.dart';

class AvatarWidget extends ConsumerWidget {
  const AvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(authProvider).user;
    return CircleAvatar(
      backgroundColor: Colors.grey.shade300,
      radius: Config.y(34),
      child: Text('${user?.abbv}'.toUpperCase(),
          style: Config.textTheme.titleMedium
              ?.copyWith(color: Colors.grey.shade500)),
    );
  }
}
