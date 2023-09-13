import 'dart:io';
import 'dart:ui';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:school_bills/app/data/models/transaction_model.dart';
import 'package:school_bills/app/domain/transactions_repository.dart';
import 'package:school_bills/app/view/provider/transactions_state.dart';
import 'package:school_bills/app/view/screens/transaction_screen.dart';
import 'package:school_bills/core/di/service_locator.dart';
import 'package:school_bills/core/utils/config.dart';
import 'package:share_plus/share_plus.dart';

final transactionProvider =
    NotifierProvider<TransactionsProvider, TransactionsState>(
  () => sl<TransactionsProvider>(),
);

final class TransactionsProvider extends Notifier<TransactionsState> {
  final TransactionsRepository transactionsRepository;
  TransactionsProvider({required this.transactionsRepository});

  TransactionModel? transaction;

  @override
  TransactionsState build() => const TransactionsState.idle();

  void updateTransaction(TransactionModel val) {
    transaction = val;
  }

  Future<bool> getTransactions(
      [TransactionFilter filter = TransactionFilter.all]) async {
    state = const TransactionsState.loading();
    final res = await switch (filter) {
      TransactionFilter.all => transactionsRepository.getMyTransactions(),
      TransactionFilter.department =>
        transactionsRepository.getDepartmentTransactions(),
      TransactionFilter.faculty =>
        transactionsRepository.getFacultyTransactions(),
    };
    return res.when(
      success: (transactions) {
        state = transactions.isEmpty
            ? const TransactionsState.empty()
            : TransactionsState.loaded(transactions);
        return true;
      },
      error: (error) {
        state = TransactionsState.error(error.message);
        return false;
      },
    );
  }

  Future<bool> getAllAdminTransactions() async {
    state = const TransactionsState.loading();
    final res = await transactionsRepository.getAllAdminTransactions();
    return res.when(
      success: (transactions) {
        state = transactions.isEmpty
            ? const TransactionsState.empty()
            : TransactionsState.loaded(transactions);
        return true;
      },
      error: (error) {
        state = TransactionsState.error(error.message);
        return false;
      },
    );
  }

  Future<void> shareTransaction(GlobalKey screenshotKey) async {
    final render = screenshotKey.currentContext?.findRenderObject();
    final image = await (render as RenderRepaintBoundary?)?.toImage();
    final byteData = await image?.toByteData(format: ImageByteFormat.png);
    if (byteData != null) {
      final bytes = byteData.buffer.asUint8List();
      final now = DateTime.now();
      final filename = 'file_${now.millisecondsSinceEpoch}.png';
      String? dir = (Config.isAndroid
              ? await getExternalStorageDirectory()
              : await getApplicationSupportDirectory())
          ?.path;
      final file = await File('$dir/$filename').writeAsBytes(bytes);
      await Share.shareXFiles([XFile(file.path)]);
    }
  }
}
