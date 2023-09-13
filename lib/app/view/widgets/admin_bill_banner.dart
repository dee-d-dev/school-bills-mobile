import 'package:flutter/material.dart';
import 'package:school_bills/app/data/models/user_model.dart';
import 'package:school_bills/core/extensions/extentions.dart';
import 'package:school_bills/core/utils/config.dart';

class AdminBillBanner extends StatelessWidget {
  final UserModel user;
  const AdminBillBanner({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Config.contentPadding(h: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            SizedBox(
              height: Config.y(220),
              width: double.infinity,
              child: Image.asset(
                'assets/images/school.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: Config.y(220),
              width: double.infinity,
              padding: Config.contentPadding(h: 15, v: 15),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Color(0xFF66096F)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('${user.adminPosition}'.capSentence,
                      style: Config.textTheme.labelSmall
                          ?.copyWith(color: Colors.white)),
                  Text(user.fullName.capSentence,
                      style: Config.textTheme.titleMedium
                          ?.copyWith(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
