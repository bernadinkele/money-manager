import 'package:flutter/material.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/app/utils/constants.dart';
import 'package:money_manager/features/expenses/views/expense_view.dart';
import 'package:money_manager/features/home/views/home_view.dart';
import 'desing_system/components/bottom_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [HomeView(), ExpensesView(), SizedBox(), SizedBox()],
      ),
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
                        onTap: () => setState(() {
                          _currentIndex = key;
                        }),
                        tab: value,
                      )))
                  .values
                  .toList()),
        ),
      ),
    );
  }
}
