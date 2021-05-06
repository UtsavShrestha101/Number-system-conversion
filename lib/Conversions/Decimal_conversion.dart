import 'package:Number_Conversion/main_brain/decimal_to_binary_conversion.dart';
import 'package:Number_Conversion/main_brain/decimal_to_hexadecimal_conversion.dart';
import 'package:Number_Conversion/main_brain/decimal_to_octal_conversion.dart';
// import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../DataContainer.dart';

// const String testDevice = "YOUR_DEVICE_ID";

// ignore: camel_case_types
class Decimal_conversion extends StatefulWidget {
  @override
  _Decimal_conversionState createState() => _Decimal_conversionState();
}

// ignore: camel_case_types
class _Decimal_conversionState extends State<Decimal_conversion> {
  TextEditingController _controller = new TextEditingController();

  // ignore: non_constant_identifier_names
  var InputValue;

  String binary = "0.0";

  String octal = "0.0";

  String hexadecimal = "0.0";

  // static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  //     testDevices: testDevice != null ? <String>[testDevice] : null,
  //     keywords: <String>['wallpapers', 'walls', 'amoled']);

  // InterstitialAd _interstitialAd;

  // InterstitialAd createInterstitialAd() {
  //   return InterstitialAd(
  //       adUnitId: "ca-app-pub-4624789056859901/7241231042",
  //       // targetingInfo: targetingInfo,
  //       listener: (MobileAdEvent event) {
  //         print("InterstitialAd event : $event");
  //       });
  // }

  // @override
  // void dispose() {
  //   // ignore: todo
  //   // TODO: implement dispose
  //   super.dispose();
  //   _interstitialAd?.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context,
    //     designSize: Size(360, 740), allowFontScaling: false);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
            left: ScreenUtil().setSp(20), right: ScreenUtil().setSp(20)),
        child: Column(
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(65),
            ),
            Text(
              "Enter Decimal number down below:",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(15),
            ),
            TextField(
              onChanged: (String value) {
                setState(() {
                  InputValue = value;
                });
              },
              controller: _controller,
              style: TextStyle(fontSize: ScreenUtil().setSp(19)),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setWidth(10),
                      horizontal: ScreenUtil().setHeight(10)),
                  prefixIcon: Icon(
                    Icons.edit,
                    size: ScreenUtil().setSp(20),
                  ),
                  labelText: "Decimal number",
                  helperText: "Decimal number contains 0 1 2 3 4 5 6 7 8 9",
                  helperMaxLines: 2,
                  labelStyle: TextStyle(fontSize: ScreenUtil().setSp(20)),
                  helperStyle: TextStyle(
                      color: Colors.grey[600],
                      fontSize: ScreenUtil().setSp(13))),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(15),
            ),
            DataContainer(name: "Binary: ", classes: "$binary"),
            SizedBox(
              height: ScreenUtil().setHeight(15),
            ),
            DataContainer(name: "Octal: ", classes: "$octal"),
            SizedBox(
              height: ScreenUtil().setHeight(15),
            ),
            DataContainer(name: "Hexadecimal: ", classes: "$hexadecimal"),
            SizedBox(
              height: ScreenUtil().setHeight(15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // // =================Convert ============//
                SizedBox(
                  // Mero mobile ma
                  // width: MediaQuery.of(context).size.width * 0.25,
                  // Mamu ko mobile ma
                  width: ScreenUtil().setWidth(110),
                  height: ScreenUtil().setHeight(50),
                  child: new RaisedButton(
                    color: Colors.grey[200],
                    onPressed: () {
                      // _interstitialAd?.dispose();
                      //   _interstitialAd = createInterstitialAd()..load();
                      //   _interstitialAd?.show();
                      setState(() {
                        binary = decimal_to_binary_conversion(InputValue);
                        octal = decimal_to_octal_conversion(InputValue);
                        hexadecimal =
                            decimal_to_hexadecimal_conversion(InputValue);
                      });
                    },
                    child: Text(
                      'Convert',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(19),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                // =========================Detail=========================//

                // SizedBox(
                //   // Mero mobile ma
                //   // width: MediaQuery.of(context).size.width * 0.25,
                //   // Mamu ko mobile ma
                //   width: ScreenUtil().setWidth(105),
                //   height: ScreenUtil().setSp(50),
                //   child: new RaisedButton(
                //     color: Colors.grey[200],
                //     onPressed: () {},

                //         child: Text(
                //           'Detail',
                //           style: TextStyle(
                //             fontSize: ScreenUtil().setSp(19),
                //             fontWeight: FontWeight.bold

                //           ),
                //         ),
                //   ),
                // ),

                // =================== Clear ===================//

                SizedBox(
                  // Mero mobile ma
                  // width: MediaQuery.of(context).size.width * 0.25,
                  // Mamu ko mobile ma
                  width: ScreenUtil().setWidth(105),
                  height: ScreenUtil().setHeight(50),
                  child: new RaisedButton(
                    color: Colors.grey[200],
                    onPressed: () {
                      setState(() {
                        _controller.clear();
                        binary = "0.0";
                        octal = "0.0";
                        hexadecimal = "0.0";
                      });
                    },
                    child: Text(
                      'Clear',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(19),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: ScreenUtil().setHeight(60),),
          ],
        ),
      ),
    );
  }
}
