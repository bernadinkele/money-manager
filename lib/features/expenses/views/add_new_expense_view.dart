import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/core/wallet/domain/entities/category_entity.dart';
import 'package:money_manager/core/wallet/domain/entities/wallet.dart';
import 'package:money_manager/desing_system/assets/assets_icons.dart';
import 'package:money_manager/desing_system/components/category_drop_down.dart';
import 'package:money_manager/desing_system/components/secondary_appbar.dart';
import 'package:money_manager/desing_system/components/wallet_drop_down.dart';
import 'package:money_manager/desing_system/utils/utils.dart';
import 'package:money_manager/features/expenses/bloc/category_bloc/category_bloc.dart';
import 'package:money_manager/features/expenses/bloc/expense_bloc/expense_bloc.dart';
import 'package:money_manager/features/utils/utils.dart';
import 'package:money_manager/features/wallet/bloc/wallet_bloc.dart';
import 'package:money_manager/features/wallet/widgets/calculator_card.dart';
import '../../wallet/utils/utils.dart';

class AddNewExpense extends StatefulWidget {
  const AddNewExpense({super.key});

  @override
  State<AddNewExpense> createState() => _AddNewExpenseState();
}

class _AddNewExpenseState extends State<AddNewExpense> {
  CategoryEntity? _categoryEntity;
  Wallet? wallet;
  final expenseNamedFieldController = TextEditingController();
  String currencyText = "";
  String operation = "";
  Parser p = Parser();
  ContextModel cm = ContextModel();
  List<CategoryEntity>? categories;
  @override
  Widget build(BuildContext context) {
    context.read<WalletBloc>().add(
          GetWalletsEvents(),
        );
    context
        .read<CategoryBloc>()
        .add(GetCategoriesEvent());
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      body: Column(
        children: [
          const SecondaryCustomAppBar(title: "New expense"),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: getHeight(4),
            ),
            color: Colors.white,
            child: Center(
              child: Text(
                getCompleteDateString(DateTime.now()),
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF000000),
                  fontSize: getFontSize(14),
                ),
              ),
            ),
          ),
          const Spacer(),
          Text(
            currencyText,
            style: TextStyle(
              fontFamily: "Nunito",
              fontWeight: FontWeight.w700,
              color: const Color(0xFF434A51),
              fontSize: getFontSize(24),
            ),
          ),
          const Gap(8),
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            operation == "" ? "0.0" : operation,
            style: TextStyle(
                fontFamily: "Nunito",
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: getFontSize(64)),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: getHeight(12),
              horizontal: getWidth(24),
            ),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "From account",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF006AE0),
                    fontSize: getFontSize(14),
                  ),
                ),
                const Gap(8),
                BlocBuilder<WalletBloc, WalletState>(
                  buildWhen: (previous, current) => false,
                  builder: (context, state) {
                    if (state is WalletInitial || state is WalletCreatedState) {
                      context.read<WalletBloc>().add(GetWalletsEvents());
                    }
                    if (state is WalletsGettedState) {
                      return WalletDropDown(
                          value: wallet,
                          onChange: (p0) {
                            setState(
                              () {
                                wallet = p0;
                                currencyText = p0.currency.toString();
                              },
                            );
                          },
                          items: state.wallets);
                    } else {
                      return Text(
                        state.toString(),
                      );
                    }
                  },
                ),
                const Gap(24),
                Text(
                  "To Category",
                  style: TextStyle(
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF006AE0),
                      fontSize: getFontSize(14)),
                ),
                const Gap(8),
                BlocBuilder<CategoryBloc, CategoryState>(
                  buildWhen: (previous, current) => true,
                  builder: (context, state) {
                    if (state is CategoryGettingState ||
                        state is CategoryInitial) {
                      context.read<CategoryBloc>().add(GetCategoriesEvent());
                    }
                    if (state is CategoryGettedState) {
                      return CategoryDropDown(
                          items: state.categories,
                          onChange: (p0) {
                            setState(() {
                              _categoryEntity = p0;
                            });
                          },
                          value: _categoryEntity);
                    } else {
                      return Text(
                        state.toString(),
                      );
                    }
                  },
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: getWidth(8),
              vertical: getHeight(16),
            ),
            child: Wrap(
              children: calculatorCardsContents
                  .map(
                    (calculate) => IntrinsicWidth(
                      child: CalculatorCard(
                        onTap: () {
                          setState(
                            () {
                              if (calculate.$2 == CardType.text ||
                                  calculate.$2 == CardType.operator) {
                                operation += calculate.$1;
                              } else {}

                              if (calculate.$1 == AssetsIcons.delete) {
                                operation = "";
                              } else if (calculate.$1 == AssetsIcons.bank) {
                                Expression exp = p.parse(operation);
                                operation = exp
                                    .evaluate(EvaluationType.REAL, cm)
                                    .toString();
                              } else if (calculate.$1 == AssetsIcons.check) {
                                if (wallet != null && _categoryEntity != null) {
                                  try {
                                    final amount = double.parse(operation);

                                    context.read<ExpenseBloc>().add(
                                          CreateExpenseEvent(
                                            wallet: wallet!,
                                            category: _categoryEntity!,
                                            createAt: DateTime.now(),
                                            expenseName: "",
                                            amount: amount,
                                          ),
                                        );
                                    Navigator.pop(context);
                                    showSuccesMesssage(
                                        context: context,
                                        content: "Expense Added");
                                  } catch (e) {
                                    showErrorMesssage(
                                        context: context,
                                        content: "Incorrect amount");
                                  }
                                } else {
                                  showErrorMesssage(
                                      context: context,
                                      content: "Please fill all the fields");
                                }
                              }
                            },
                          );
                        },
                        calculatorType: calculate,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

