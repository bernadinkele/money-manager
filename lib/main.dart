import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/app/routes/router.dart';
import 'package:money_manager/app/routes/routes_name.dart';
import 'package:money_manager/core/wallet/domain/entities/wallet.dart';
import 'package:money_manager/features/wallet/bloc/wallet_bloc.dart';
import 'package:money_manager/services/service_locator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [WalletSchema],
    directory: dir.path,
  );
  await initGetIt(isar);
  AppDimensions.init(navigatorKey);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<WalletBloc>(),
          )
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.onGenerateRoute,
          initialRoute: RoutesNames.main,
        ));
  }
}
