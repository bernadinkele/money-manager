import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/desing_system/components/default_button.dart';
import 'package:money_manager/desing_system/components/default_dropdown.dart';
import 'package:money_manager/desing_system/components/default_textfield.dart';
import 'package:money_manager/desing_system/components/secondary_appbar.dart';

class AddNewCategoryView extends StatelessWidget {
  const AddNewCategoryView({super.key});

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
                    //DefaultTextField(),
                    Gap(12),
                   // DefaultDropDown(),
                    Gap(12),
                   // DefaultTextField(),
                    Gap(12),
                   // DefaultDropDown(),
                    Gap(12),
                    //DefaultDropDown(),
                    Gap(12),
                    DefaultButton(
                      onTap: () {
                        
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
