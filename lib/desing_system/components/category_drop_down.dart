import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/core/wallet/domain/entities/category_entity.dart';
import 'package:money_manager/desing_system/assets/assets_icons.dart';

class CategoryDropDown extends StatelessWidget {
  const CategoryDropDown(
      {super.key,
      required this.items,
      required this.onChange,
      required this.value});
  final List<CategoryEntity> items;
  final Function(CategoryEntity) onChange;
  final CategoryEntity? value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(50),
      child: DropdownButtonFormField2(
        // value: value,
        isExpanded: true,
        decoration: InputDecoration(
            //prefixIcon: Padding(padding:EdgeInsets.symmetric(vertical: getHeight(16)), child: SvgPicture.asset(AssetsIcons.places),),
            contentPadding: EdgeInsets.symmetric(
              vertical: getHeight(0),
            ),
            border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFDADCE0), width: 0.5),
                borderRadius: BorderRadius.circular(getFontSize(8))),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFDADCE0), width: 0.5),
                borderRadius: BorderRadius.circular(getFontSize(8))),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFDADCE0), width: 0.5),
                borderRadius: BorderRadius.circular(getFontSize(8))),
            fillColor: Colors.white,
            filled: true),
        hint: Text(
          "Category",
          style: TextStyle(
              fontFamily: "Nunito",
              fontWeight: FontWeight.w500,
              color: const Color(0xFF858C94),
              fontSize: getFontSize(16)),
        ),
        items: items
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: CategoryItem(
                  category: e,
                ),
              ),
            )
            .toList(),
        validator: (value) {
          if (value == null) {
            return '';
          }
          return null;
        },
        onChanged: (val) {
          if (val != null) {
            onChange(val);
          }
        },
        onSaved: (value) {
          value = value;
        },
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.only(right: getWidth(16)),
        ),
        iconStyleData: IconStyleData(
          icon: SvgPicture.asset(
            AssetsIcons.arrow,
            width: getFontSize(16),
            height: getFontSize(16),
          ),
          iconSize: getFontSize(24),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(getFontSize(16)),
            color: Colors.white,
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final CategoryEntity category;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: getFontSize(10),
          backgroundColor: Color(category.colorHex!),
        ),
        const Gap(8),
        Text(
          category.categoryName!,
          style: TextStyle(
              fontFamily: "Nunito",
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: getFontSize(16)),
        ),
      ],
    );
  }
}
