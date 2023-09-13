import 'package:flutter/material.dart';
import 'package:school_bills/app/data/models/bill_model.dart';
import 'package:school_bills/core/extensions/extentions.dart';
import 'package:school_bills/core/utils/config.dart';

class BillBanner extends StatelessWidget {
  final List<BillModel> paidBills;
  const BillBanner({super.key, required this.paidBills});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Config.y(220),
      child: ListView.separated(
        padding: Config.contentPadding(h: 20),
        scrollDirection: Axis.horizontal,
        itemCount: paidBills.length,
        itemBuilder: (context, index) {
          final bill = paidBills[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                SizedBox(
                  height: Config.y(220),
                  width: Config.x(370),
                  child: Image.asset(
                    'assets/images/school.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: Config.y(220),
                  width: Config.x(370),
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
                      Text(bill.title.capSentence,
                          style: Config.textTheme.labelSmall
                              ?.copyWith(color: Colors.white)),
                      Text(bill.amount.price,
                          style: Config.textTheme.titleMedium
                              ?.copyWith(color: Colors.white)),
                      Container(
                        padding: Config.contentPadding(h: 20, v: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.green,
                        ),
                        child: Text('Paid',
                            style: Config.textTheme.bodySmall
                                ?.copyWith(color: Colors.white)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => Config.hGap10,
      ),
    );
  }
}
