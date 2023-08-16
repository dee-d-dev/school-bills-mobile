import 'package:flutter/material.dart';
import 'package:school_bills/core/utils/app_icons.dart';

typedef JsonMap = Map<String, dynamic>;

List<JsonMap> kNavItems = [
  {
    'title': 'Home',
    'icon': Icon(AppIcons.home),
    'inactice': Icon(AppIcons.homeOl),
  },
  {
    'title': 'Transaction',
    'icon': Icon(AppIcons.transaction),
    'inactice': Icon(AppIcons.transactionOl),
  },
  {
    'title': 'Article',
    'icon': Icon(AppIcons.article),
    'inactice': Icon(AppIcons.articleOl),
  },
  {
    'title': 'Settings',
    'icon': Icon(AppIcons.settings),
    'inactice': Icon(AppIcons.settingsOl),
  },
];
