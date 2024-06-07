import 'package:flutter/material.dart';
import 'package:money_manager/app/routes/routes_name.dart';
import 'package:money_manager/features/wallet/views/add_new_category_view.dart';
import 'package:money_manager/features/expenses/views/add_new_expense_view.dart';
import 'package:money_manager/features/wallet/views/add_wallet_view.dart';
import 'package:money_manager/main_view.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesNames.main:
        return MaterialPageRoute(
          builder: (context) => const MainView(),
        );
      case RoutesNames.addWallet:
        return MaterialPageRoute(
          builder: (context) => const AddWalletView(),
        );
      case RoutesNames.addNewCategory:
        return MaterialPageRoute(
          builder: (context) => const AddNewCategoryView(),
        );
      case RoutesNames.addNewExpense:
        return MaterialPageRoute(
          builder: (context) => const AddNewExpense(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Text("UnKnown"),
          ),
        );
    }
  }
}
