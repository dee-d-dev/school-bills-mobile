import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_bills/app/view/provider/auth_provider.dart';
import 'package:school_bills/app/view/widgets/avatar_widget.dart';
import 'package:school_bills/app/view/widgets/reciept_info.dart';
import 'package:school_bills/core/extensions/extentions.dart';
import 'package:school_bills/core/utils/config.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(backgroundColor: const Color(0xFFF2F2F2)),
      body: Consumer(
        builder: (context, ref, child) {
          final user = ref.read(authProvider).user!;
          return ListView(
            padding: Config.contentPadding(h: 20),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.fullName.capSentence,
                          style: Config.textTheme.titleSmall,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        Text(user.id.toUpperCase(),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  const AvatarWidget(),
                ],
              ),
              Config.vGap20,
              Container(
                padding: Config.contentPadding(h: 15, v: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    RecieptInfo(
                        leading: 'Name', trailing: user.fullName.capSentence),
                    if ((user.department ?? '').isNotEmpty) ...[
                      Config.vGap30,
                      RecieptInfo(
                          leading: 'Department',
                          trailing: '${user.department}'.capSentence),
                    ],
                    if ((user.faculty ?? '').isNotEmpty) ...[
                      Config.vGap30,
                      RecieptInfo(
                          leading: 'Faculty',
                          trailing: '${user.faculty}'.capSentence),
                    ],
                    if ((user.matricNo ?? '').isNotEmpty) ...[
                      Config.vGap30,
                      RecieptInfo(
                          leading: 'Matriculation number',
                          trailing: '${user.matricNo}'.capSentence),
                    ],
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
