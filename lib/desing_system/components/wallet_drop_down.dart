import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/core/wallet/domain/entities/wallet.dart';
import 'package:money_manager/desing_system/assets/assets_icons.dart';

class WalletDropDown extends StatelessWidget {
  const WalletDropDown({super.key, required this.value, required this.onChange, required this.items});
  final List<Wallet> items;
  final Function(Wallet) onChange;
  final Wallet? value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: getHeight(100),
      child: DropdownButtonFormField2(
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
          "Choose the Wallet",
          style: TextStyle(
              fontFamily: "Nunito",
              fontWeight: FontWeight.w500,
              color: const Color(0xFF858C94),
              fontSize: getFontSize(16)),
        ),
        items:items
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child:  WalletItem(
                  wallet: e,
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
          if(val!=null){
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

class WalletItem extends StatelessWidget {
  const WalletItem({super.key, required this.wallet});
final Wallet wallet;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: getFontSize(12),
                  backgroundColor: const Color(0xFFDADCE0),
                  child: SvgPicture.asset(
                    wallet.iconPath!,
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    width: getFontSize(16),
                  ),
                ),
                const Gap(8),
                Text(
                  "UBA",
                  style: TextStyle(
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: getFontSize(14)),
                ),
              ],
            ),
            Row(
              children: [
                Text("3456",
                    style: TextStyle(
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: getFontSize(16))),
                const Gap(4),
                Text("FCFA",
                    style: TextStyle(
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: getFontSize(9))),
              ],
            )
          ],
        ),
      ],
    );
  }
}
