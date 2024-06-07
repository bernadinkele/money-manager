import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/app/utils/types.dart';
import 'package:money_manager/desing_system/assets/assets_icons.dart';

class DefaultDropDown<T, S> extends StatelessWidget {
  const DefaultDropDown(
      {super.key,
      required this.contents,
      required this.hintText,
      required this.type,
      required this.value,
      required this.onChange});
  final List<(T, S)> contents;
  final DropdownType type;
  final String hintText;
  final (T, S)? value;
  final Function((T, S)) onChange;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: getHeight(50),
      child: DropdownButtonFormField2(
        isExpanded: true,
        decoration: InputDecoration(
            //prefixIcon: Padding(padding:EdgeInsets.symmetric(vertical: getHeight(16)), child: SvgPicture.asset(AssetsIcons.places),),
            contentPadding: EdgeInsets.symmetric(
              vertical: getHeight(16),
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
          hintText,
          style: TextStyle(
              fontFamily: "Nunito",
              fontWeight: FontWeight.w500,
              color: const Color(0xFF858C94),
              fontSize: getFontSize(16)),
        ),
        items: type == DropdownType.color
            ? contents
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: ColorItem(
                        value: e as ColorType,
                      ),
                    ))
                .toList()
            : type == DropdownType.icon
                ? contents
                    .map((e) => DropdownMenuItem(
                        value: e, child: IconItem(iconType: e as IconType)))
                    .toList()
                : type == DropdownType.text
                    ? contents
                        .map((e) => DropdownMenuItem(
                            value: e, child: TextItem(textType: e as TextType)))
                        .toList()
                    : [],
        validator: (value) {
          if (value == null) {
            return '';
          }
          return null;
        },
        onChanged: (value){
          onChange(value as (T, S));
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

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.value});
  final ColorType value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value.$2,
          style: TextStyle(
              fontFamily: "Nunito",
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: getFontSize(16)),
        ),
        CircleAvatar(
          radius: getFontSize(10),
          backgroundColor: Color(value.$1),
        ),
      ],
    );
  }
}

class IconItem extends StatelessWidget {
  const IconItem({super.key, required this.iconType});
  final IconType iconType;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          iconType.$2,
          style: TextStyle(
              fontFamily: "Nunito",
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: getFontSize(16)),
        ),
        SvgPicture.asset(
          iconType.$1,
          colorFilter:
              const ColorFilter.mode(Color(0xFF006AE0), BlendMode.srcIn),
        )
      ],
    );
  }
}

class TextItem extends StatelessWidget {
  const TextItem({super.key, required this.textType});
  final TextType textType;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textType.$2,
          style: TextStyle(
              fontFamily: "Nunito",
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: getFontSize(16)),
        ),
        Text(
          textType.$1,
          style: TextStyle(
              fontFamily: "Nunito",
              fontWeight: FontWeight.w500,
              color: const Color(0xFF006AE0),
              fontSize: getFontSize(16)),
        ),
      ],
    );
  }
}
