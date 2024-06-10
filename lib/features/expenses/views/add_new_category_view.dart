import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/app/utils/types.dart';
import 'package:money_manager/desing_system/components/default_button.dart';
import 'package:money_manager/desing_system/components/default_dropdown.dart';
import 'package:money_manager/desing_system/components/default_textfield.dart';
import 'package:money_manager/desing_system/components/secondary_appbar.dart';
import 'package:money_manager/desing_system/utils/utils.dart';
import 'package:money_manager/features/expenses/bloc/category_bloc/category_bloc.dart';

class AddNewCategoryView extends StatefulWidget {
  const AddNewCategoryView({super.key});

  @override
  State<AddNewCategoryView> createState() => _AddNewCategoryViewState();
}

class _AddNewCategoryViewState extends State<AddNewCategoryView> {
  final key = GlobalKey<FormState>();
  final categoryNameFieldController = TextEditingController();
  final descriptionFieldController = TextEditingController();
  ColorType? color;
  IconType? icon;
  TextType? currency;
  TextType? categoryType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SecondaryCustomAppBar(title: "New Category"),
          const Gap(22),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(24)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DefaultTextField(
                      hintText: "Category Name",
                      controller: categoryNameFieldController,
                      type: TextInputType.text,
                    ),
                    const Gap(12),
                    DefaultDropDown<int, String>(
                      type: DropdownType.color,
                      hintText: "Color",
                      contents: colorsItems,
                      value: color,
                      onChange: (p0) {
                        setState(() {
                          color = p0;
                        });
                      },
                    ),
                    const Gap(12),
                    DefaultTextField(
                      hintText: "Description",
                      controller: descriptionFieldController,
                      type: TextInputType.text,
                    ),
                    const Gap(12),
                    DefaultDropDown<String, String>(
                      type: DropdownType.text,
                      hintText: "Category Type",
                      contents: categoriesTypes,
                      value: categoryType,
                      onChange: (p0) {
                        setState(() {
                          categoryType = p0;
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
                    DefaultButton(
                      onTap: () {
                        if (categoryNameFieldController.text.isNotEmpty &&
                            color != null &&
                            descriptionFieldController.text.isNotEmpty &&
                            categoryType != null &&
                            currency != null) {
                          context.read<CategoryBloc>().add(CreateCategoryEvent(
                              categoryName: categoryNameFieldController.text,
                              categoryType: categoryType!.$1,
                              colorHex: color!.$1,
                              currency: currency!.$1,
                              description: descriptionFieldController.text));

                          Navigator.pop(context);
                          showSuccesMesssage(
                              context: context, content: "new Category Added");
                          context
                              .read<CategoryBloc>()
                              .add(GetCategoriesEvent());
                        } else {
                          showErrorMesssage(
                              context: context,
                              content: "Please fill all the fields");
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
