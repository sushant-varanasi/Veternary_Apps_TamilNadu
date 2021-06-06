import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vetappadmin/admincasetile/admincasetile0.dart';

import 'admincasetile/admincasetile-1.dart';
import 'admincasetile/admincasetile2.dart';
import 'admincasetile/admincasetile3.dart';
import 'admincasetile/admincasetile5.dart';
import 'caseClass.dart';
import 'caseTile.dart';

class CasesList extends StatefulWidget {
  final int tab;
  CasesList({this.tab});
  @override
  _CasesListState createState() => _CasesListState();
}

class _CasesListState extends State<CasesList> {
  @override
  Widget build(BuildContext context) {
    final cases = Provider.of<List<CaseData>>(context) ?? [];

    return ListView.builder(
        itemCount: cases.length,
        itemBuilder: (context, index) {
          print(index);
          print(cases.length);

          if (widget.tab == 1) {
            return cases[index].stat == "-1" ||
                    cases[index].stat == "1" ||
                    cases[index].stat == "7"
                ? CaseTile_1(casestile: cases[index])
                : Container();
          }

          if (widget.tab == 2) {
            return cases[index].stat == "0"
                ? CaseTile_0(casestile: cases[index])
                : Container();
          }

          if (widget.tab == 3) {
            return cases[index].stat == "2" || cases[index].stat == "7"
                ? CaseTile_2(casestile: cases[index])
                : Container();
          }

          if (widget.tab == 4) {
            return cases[index].stat == "5"
                ? CaseTile_5(casestile: cases[index])
                : Container();
          }

          if (widget.tab == 5) {
            return cases[index].stat == "3"
                ? CaseTile_3(casestile: cases[index])
                : Container();
          }

          if (widget.tab == 10) {
            return cases[index].stat == "4" || cases[index].stat == "6"
                ? CaseTile(casestile: cases[index])
                : Container();
          }

          else {return Container();}
        });
  }
}
