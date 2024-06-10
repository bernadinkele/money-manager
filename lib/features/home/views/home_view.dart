import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/app/routes/routes_name.dart';
import 'package:money_manager/features/home/screens/custom_appbar.dart';
import 'package:money_manager/features/home/screens/network_screen.dart';
import 'package:money_manager/features/home/screens/wallet_tile.dart';
import 'package:money_manager/features/wallet/bloc/wallet_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<_ChartData> data;

  @override
  void initState() {
    data = [
      _ChartData('CHN', 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<WalletBloc>().add(GetWalletsEvents());
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, getHeight(56)),
          child: CustomAppBar(
              onTap: () => showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(getFontSize(16))),
                        child: IntrinsicHeight(
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.popAndPushNamed(
                                      context, RoutesNames.addNewCategory),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.add),
                                      Gap(8),
                                      Text("Create new Category")
                                    ],
                                  ),
                                ),
                                const Gap(24),
                                GestureDetector(
                                  onTap: () => Navigator.popAndPushNamed(
                                      context, RoutesNames.addWallet),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.add),
                                      Gap(8),
                                      Text("Create Wallet")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ))),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(24)),
        child: Column(
          children: [
            const Gap(26),
            const NetWorkScreen(),
            const Gap(24),
            SizedBox(
              height: getHeight(176),
              child: SfCartesianChart(
                  primaryXAxis: const CategoryAxis(),
                  primaryYAxis:
                      const NumericAxis(minimum: 0, maximum: 40, interval: 10),
                  backgroundColor: Colors.white,
                  series: <CartesianSeries<_ChartData, String>>[
                    BarSeries<_ChartData, String>(
                        dataSource: data,
                        xValueMapper: (_ChartData data, _) => data.x,
                        yValueMapper: (_ChartData data, _) => data.y,
                        name: 'Gold',
                        color: const Color.fromRGBO(8, 142, 255, 1))
                  ]),
            ),
            const Gap(24),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(getFontSize(8))),
                child: BlocBuilder<WalletBloc, WalletState>(
                  builder: (context, state) {
                    if (state is WalletInitial || state is WalletCreatedState) {
                      context.read<WalletBloc>().add(GetWalletsEvents());
                    }
                    if (state is WalletsGettedState) {
                      return Column(
                        children: state.wallets
                            .map((e) => WalletTile(
                                  wallet: e,
                                  activeBorder: false,
                                ))
                            .toList(),
                      );
                    } else {
                      return Text(state.toString());
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }
}
/*
child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AssetsIcons.major),
                      const Gap(10),
                      Text(
                        "Major expenses",
                        style: TextStyle(
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF000000),
                            fontSize: getFontSize(16)),
                      ),
                    ],
                  ),
                  const Gap(16),
                ],
              ),
 */

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
