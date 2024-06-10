import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/app/routes/routes_name.dart';
import 'package:money_manager/core/expenses/domain/entities/expense.dart';
import 'package:money_manager/desing_system/assets/assets_icons.dart';
import 'package:money_manager/features/expenses/bloc/expense_bloc/expense_bloc.dart';
import 'package:money_manager/features/home/screens/custom_appbar.dart';
import 'package:money_manager/features/utils/utils.dart';

class ExpensesView extends StatelessWidget {
  const ExpensesView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ExpenseBloc>().add(GetExpensesEvent());
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      body: Column(
        children: [
          CustomAppBar(
            onTap: () =>
                Navigator.pushNamed(context, RoutesNames.addNewExpense),
          ),
          Expanded(child: SingleChildScrollView(
              child: BlocBuilder<ExpenseBloc, ExpenseState>(
            builder: (context, state) {
              if (state is ExpensesGettedState) {
                return Column(
                  children: state.expenses
                      .map(
                        (e) => ExpenseTile(
                          expense: e,
                        ),
                      )
                      .toList(),
                );
              } else {
                context.read<ExpenseBloc>().add(GetExpensesEvent());
                return const CircularProgressIndicator();
              }
            },
          )))
        ],
      ),
    );
  }
}

class ExpenseTile extends StatelessWidget {
  const ExpenseTile({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(12), vertical: getHeight(8)),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Color(0xFFF6F7F9)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueAccent.withOpacity(0.1),
                radius: getFontSize(12),
                child: SvgPicture.asset(
                  expense.wallet.value!.iconPath!,
                  width: getFontSize(16),
                  height: getFontSize(16),
                ),
              ),
              const Gap(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense.category.value!.categoryName!,
                    style: TextStyle(
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: getFontSize(14)),
                  ),
                  Text(
                    "${expense.createAt!.day} ${getMonthStringday(expense.createAt!.month)} ${expense.createAt!.year}",
                    style: TextStyle(
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF434A51),
                        fontSize: getFontSize(12)),
                  ),
                ],
              )
            ],
          ),
          Text.rich(TextSpan(
              text: "${expense.amount} ",
              style: TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: getFontSize(16)),
              children: [
                TextSpan(
                  text: expense.category.value!.currency!,
                  style: TextStyle(
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: getFontSize(8)),
                )
              ]))
        ],
      ),
    );
  }
}
