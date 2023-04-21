import 'package:flutter_translate/flutter_translate.dart';
import '../Widgets/appbar.dart';
import 'about_us_view.dart';
import '../common/theme.dart' as T;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TermsCondition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    T.Theme mode = Provider.of<T.Theme>(context);
    return Scaffold(
      appBar: customAppBar(context, translate("Tnc")),
      backgroundColor: mode.bgcolor,
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Education is the passport to the future, for tomorrow belongs to those who prepare for it today",overflow: TextOverflow.ellipsis,maxLines: 5,),
            ],
          ),
        ),)
    );
  }
}
