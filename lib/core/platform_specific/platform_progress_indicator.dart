import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_bills/core/utils/config.dart';

class PlatformProgressIndicator extends StatelessWidget {
  const PlatformProgressIndicator({Key? key, this.height}) : super(key: key);

  final double? height;

  Widget progress() {
    if (Config.isWeb) return const CircularProgressIndicator();
    if (Config.isIOS) {
      return const CupertinoActivityIndicator(radius: 15);
    } else {
      return const CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Config.y(height ?? 35),
      width: Config.y(height ?? 35),
      child: Center(
        child: progress(),
      ),
    );
  }
}
