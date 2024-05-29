import 'package:flutter/material.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/app/utils/constants.dart';
import 'package:money_manager/features/home/views/home_view.dart';
import 'desing_system/components/bottom_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeView(),
      bottomNavigationBar: IntrinsicHeight(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: getWidth(24), vertical: getHeight(8)),
          decoration: const BoxDecoration(
              color: Colors.white,
              border:
                  Border(top: BorderSide(color: Color(0xFFDADCE0), width: 1))),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: tabs
                  .asMap()
                  .map((key, value) => MapEntry(
                      key,
                      BottomBarItem(
                        tab: value,
                      )))
                  .values
                  .toList()),
        ),
      ),
    );
  }
}
