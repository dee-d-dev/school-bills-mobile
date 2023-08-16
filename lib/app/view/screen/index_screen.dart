import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:school_bills/core/constants/constants.dart';

class IndexScreen extends ConsumerStatefulWidget {
  const IndexScreen({
    super.key,
    required this.navigationShell,
  });
  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends ConsumerState<IndexScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final isIndex = [Routes.home, Routes.transaction, Routes.article, Routes.settings].contains(
    //     widget.navigationShell.shellRouteContext.routeMatchList.fullPath);

    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.navigationShell.currentIndex,
        items: [
          ...kNavItems.map(
            (e) {
              return BottomNavigationBarItem(
                label: e['title'],
                icon: e['inactice'],
                activeIcon: e['icon'],
              );
            },
          ).toList()
        ],
        onTap: (index) => _goBranch(index),
      ),
    );
  }
}
