import 'package:eclass/common/global.dart';
import 'package:eclass/provider/home_data_provider.dart';
import 'package:eclass/provider/walletDetailsProvider.dart';
import 'package:eclass/screens/top_up_wallet_screen.dart';
import 'package:eclass/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    // TODO: implement initState
    currency = Provider.of<HomeDataProvider>(context, listen: false)
        .homeModel
        .currency
        .currency;
    super.initState();
  }

  String currency;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, translate("Wallet_")),
      body: Consumer<WalletDetailsProvider>(
        builder: (_, provider, __) {
          String currentBalance = provider.walletModel.wallet != null
              ? provider.walletModel.wallet.contains(".")
                  ? "${currencySymbol(currency)} ${provider.walletModel.wallet}"
                  : "${currencySymbol(currency)} ${provider.walletModel.wallet}.00"
              : "${currencySymbol(currency)} 0.00";
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Card(
                    elevation: 3.0,
                    child: Container(
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: Colors.black45,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: Colors.black45,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    translate("Wallet_"),
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 38.0,
                                    backgroundColor: Colors.redAccent,
                                    child: Icon(
                                      Icons.account_balance_wallet_outlined,
                                      size: 55.0,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    translate("Current_Balance"),
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    currentBalance,
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TopUpWalletScreen(currentBalance,
                                                  "${currencySymbol(currency)}"),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      translate("Top_up_Wallet"),
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Text(translate("Scan_this_QR_Code_for_Referral_Link")),
                  Card(
                    elevation: 5.0,
                    child: QrImage(
                      data: "${provider.walletModel.path}",
                      version: QrVersions.auto,
                      size: 300,
                    ),
                  ),
                  SizedBox(height: 25.0),
                  InkWell(
                    onTap: () {
                      Share.share("${provider.walletModel.path}",
                          subject: translate("Referral_Link"));
                    },
                    splashColor: Colors.black12,
                    child: Container(
                      height: 30,
                      width: 220,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            translate("Share_Referral_Link"),
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.share,
                            color: Colors.indigo,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
