import 'dart:ui';

import 'package:money_manager/desing_system/assets/assets_icons.dart';

enum DropdownType { icon, text, color }

typedef ColorType = (int colorHex, String title);
typedef IconType = (String icon, String title);
typedef TextType = (String value, String title);

final colorsItems = <ColorType>[
  (0xFFCCFF00,"yellow"),
  (0xFF375EFB,"Blue"),
];

final iconsItems = <IconType>[
  (AssetsIcons.astroCash, "Astro"),
  (AssetsIcons.bank, "Bank"),
  (AssetsIcons.wallet, "Wallet")
];

final currencyItems = <TextType>[
  ('XOF', 'Franc CFA BCEAO'),
  ('USD', 'Dollar Americain'),
];

final accountsItem = <TextType>[
  ('Regular', 'Regular'),
  ('Medium', 'Medium'),
];

