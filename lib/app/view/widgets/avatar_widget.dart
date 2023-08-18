import 'package:flutter/material.dart';
import 'package:school_bills/core/utils/config.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: Config.y(34),
      child: Text('AA', style: Config.h2),
    );
  }
}
