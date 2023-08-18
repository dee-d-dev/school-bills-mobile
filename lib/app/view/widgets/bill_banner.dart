import 'package:flutter/material.dart';
import 'package:school_bills/core/extensions/extentions.dart';
import 'package:school_bills/core/utils/config.dart';

class BillBanner extends StatelessWidget {
  const BillBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config.y(220),
      width: double.infinity,
      padding: Config.contentPadding(h: 15, v: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Colors.transparent, Color(0xFF66096F)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('School fees • Level 300',
              style: Config.b3.copyWith(color: Colors.white)),
          Text(110000.00.price, style: Config.h2.copyWith(color: Colors.white)),
          Container(
            padding: Config.contentPadding(h: 20, v: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.green,
            ),
            child: Text('Paid', style: Config.b2.copyWith(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
