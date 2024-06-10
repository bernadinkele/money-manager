import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/app/utils/types.dart';
import 'package:money_manager/desing_system/components/default_button.dart';
import 'package:money_manager/desing_system/components/default_dropdown.dart';
import 'package:money_manager/desing_system/components/default_numberfield.dart';
import 'package:money_manager/desing_system/components/default_textfield.dart';
import 'package:money_manager/desing_system/components/secondary_appbar.dart';
import 'package:money_manager/desing_system/utils/utils.dart';
import 'package:money_manager/features/wallet/bloc/wallet_bloc.dart';

class AddWalletView extends StatefulWidget {
  const AddWalletView({super.key});

  @override
  State<AddWalletView> createState() => _AddWalletViewState();
}

class _AddWalletViewState extends State<AddWalletView> {
  final key = GlobalKey<FormState>();
  final accountNameFieldController = TextEditingController();
  final accountNumberFieldController = TextEditingController();
  final descriptionFieldController = TextEditingController();
  final amountFieldController = TextEditingController();
  ColorType? color;
  IconType? icon;
  TextType? currency;
  TextType? account;
  bool addBalance = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, getHeight(56)),
          child: const SecondaryCustomAppBar(
            title: "New Wallet",
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(24)),
                child: Form(
                  key: key,
                  child: Column(
                    children: [
                      const Gap(24),
                      DefaultTextField(
                        hintText: "Account name",
                        controller: accountNameFieldController,
                        type: TextInputType.text,
                      ),
                      const Gap(12),
                      DefaultTextField(
                        hintText: "Account number or ID",
                        controller: accountNumberFieldController,
                        type: TextInputType.number,
                      ),
                      const Gap(12),
                      Row(
                        children: [
                          Expanded(
                              child: DefaultDropDown<String, String>(
                            type: DropdownType.icon,
                            hintText: "Icon",
                            value: icon,
                            contents: iconsItems,
                            onChange: (p0) {
                              setState(() {
                                icon = p0;
                              });
                            },
                          )),
                          const Gap(12),
                          Expanded(
                              child: DefaultDropDown<int, String>(
                            type: DropdownType.color,
                            hintText: "Color",
                            contents: colorsItems,
                            value: color,
                            onChange: (p0) {
                              setState(() {
                                color = p0;
                              });
                            },
                          )),
                        ],
                      ),
                      const Gap(12),
                      DefaultTextField(
                        hintText: "Description",
                        controller: descriptionFieldController,
                        type: TextInputType.text,
                      ),
                      const Gap(12),
                      DefaultTextField(
                        hintText: "Amount",
                        controller: amountFieldController,
                        type: TextInputType.number,
                      ),
                      const Gap(12),
                      DefaultDropDown<String, String>(
                        type: DropdownType.text,
                        hintText: "Account type",
                        contents: accountsItem,
                        value: account,
                        onChange: (p0) {
                          setState(() {
                            account = p0;
                          });
                        },
                      ),
                      const Gap(12),
                      DefaultDropDown<String, String>(
                        type: DropdownType.text,
                        hintText: "Account currency",
                        contents: currencyItems,
                        value: currency,
                        onChange: (p0) {
                          setState(() {
                            currency = p0;
                          });
                        },
                      ),
                      const Gap(12),
                      DefaultNumberField(
                        value: addBalance,
                        onChange: (p0) => setState(() {
                          addBalance = p0;
                        }),
                      ),
                      const Gap(12),
                      DefaultButton(onTap: () {
                       if(key.currentState!.validate()){
                         context.read<WalletBloc>().add(CreatWalletEvent(
                            amount: double.parse(amountFieldController.text),
                            accountName: accountNameFieldController.text,
                            accountNumber:
                                double.parse(accountNumberFieldController.text),
                            accountType: account!.$1,
                            addBalance: addBalance,
                            colorHex: color!.$1,
                            iconPath: icon!.$1,
                            currency: currency!.$1));
                        context.read<WalletBloc>().add(GetWalletsEvents());
                        Navigator.pop(context);
                        showSuccesMesssage(context: context, content: "New Wallet added");
                       }
                      })
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
