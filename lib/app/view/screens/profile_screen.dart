import 'package:flutter/material.dart';
import 'package:school_bills/app/view/widgets/avatar_widget.dart';
import 'package:school_bills/app/view/widgets/reciept_info.dart';
import 'package:school_bills/core/utils/config.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(backgroundColor: const Color(0xFFF2F2F2)),
      body: ListView(
        padding: Config.contentPadding(h: 20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dotun Adetigba',
                    style: Config.h3,
                    textAlign: TextAlign.center,
                  ),
                  Text('ART1277726',
                      style: Config.b2, textAlign: TextAlign.center),
                ],
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
                const RecieptInfo(
                    leading: 'Name', trailing: 'Adedotun Adetigba'),
                Config.vGap30,
                const RecieptInfo(
                    leading: 'Department', trailing: 'Biochemisty'),
                Config.vGap30,
                const RecieptInfo(leading: 'Faculty', trailing: 'Life Science'),
                Config.vGap30,
                const RecieptInfo(
                    leading: 'Matriculation number', trailing: 'LSC1211515'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
