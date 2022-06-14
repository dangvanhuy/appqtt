import 'dart:async';

import 'package:excel_mananger/api/api.dart';
import 'package:excel_mananger/common/utils.dart';
import 'package:excel_mananger/resources/images/image.resource.dart';
import 'package:excel_mananger/viewmodels/page1.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> listensheet(Page1Viewmodel model) async {
    Timer.periodic(const Duration(milliseconds: 5000), (timer) async {
      print(5000);
      model.getSum();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(ImagePath.imageHome)),
              )),
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Tổng giá trị quỹ '),
                ViewModelBuilder<Page1Viewmodel>.reactive(
                  onModelReady: (model) => model.getSum(),
                  builder: (BuildContext context, Page1Viewmodel model,
                      Widget? child) {
                    // listensheet(model);
                    return InkWell(
                      onTap: () {
                        model.getSum();
                      },
                      child: Text(
                        Utils.formatNumberCurrency(model.sum.toString()) +
                            'vnđ',
                        style: TextStyle(fontSize: 30),
                      ),
                    );
                  },
                  viewModelBuilder: () => Page1Viewmodel(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
