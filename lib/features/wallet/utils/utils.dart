import 'package:money_manager/desing_system/assets/assets_icons.dart';

enum CardType { text, icon, operator}

typedef CalculatorType = (String title, CardType type, String value);

final calculatorCardsContents = <CalculatorType>[
  ("/", CardType.operator, "/"),
  ("7", CardType.text, "7"),
  ("8", CardType.text, "8"),
  ("9", CardType.text, "9"),
  (AssetsIcons.delete, CardType.icon, "9"),
  ("x", CardType.operator, "x"),
  ("4", CardType.text, "4"),
  ("5", CardType.text, "5"),
  ("6", CardType.text, "6"),
  (AssetsIcons.percent, CardType.icon, "9"),
  ("-", CardType.operator, "-"),
  ("1", CardType.text, "1"),
  ("2", CardType.text, "2"),
  ("3", CardType.text, "3"),
  (AssetsIcons.bank, CardType.icon, "9"),
  ("+", CardType.operator, "+"),
  ("0", CardType.text, "0"),
  (".", CardType.text, "."),
  (AssetsIcons.check, CardType.icon, "9"),

];
