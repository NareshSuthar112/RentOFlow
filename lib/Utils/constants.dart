import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'AppColors.dart';

class Constants {
  // Live Mode
/*  static var BASE_URL = "https://holdhome.in/api/";
  static var IMAGE_BASE_URL = "https://holdhome.in/";*/

  // Demo Mode
  static var BASE_URL = "https://dev.minesawari.com/";
  static var IMAGE_BASE_URL = "https://staging.holdhome.in/";

  //shareprefrences key

  static var isLogin = "isLogin";

  static String removeLastCharacter(String str) {
    String result = '';
    if ((str != '') && (str.isNotEmpty)) {
      result = str.substring(0, str.length - 1);
    }

    return result;
  }

  static String changeDateTimeFormat(var date) {
    var inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
    var inputDate = inputFormat.parse(date); // <-- dd/MM 24H format

    var outputFormat = DateFormat('dd-MMM-yyyy');
    var outputDate = outputFormat.format(inputDate);
    print(outputDate);

    return outputDate.toString();
  }

  static String changeDateFormat(
      var date, var inputFormatDate, var outputFormatDate) {
    var inputFormat = DateFormat(inputFormatDate);
    var inputDate = inputFormat.parse(date); // <-- dd/MM 24H format

    var outputFormat = DateFormat(outputFormatDate);
    var outputDate = outputFormat.format(inputDate);
    print(outputDate);

    return outputDate.toString();
  }

  static void show(BuildContext context1) {}

  static Widget setHeightAndWidth(context, {var height = 0, var width = 0}) {
    return SizedBox(
      height: Constants.getSize(context, height),
      width: Constants.getSize(context, width),
    );
  }

/*
  static loaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
        content: Container(
      height: 60,
      width: 30,
      child: Center(
        child: CircularProgressIndicator(color: App.purpleColor),
      ),
    ));
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }*/

  /*static loaderDialog1(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: Container(
                height: 200,
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Lottie.asset(
                      'assets/lottie_anim/loading.json',
                    ))),
          );
        });
  }*/

  /* static changeDateFormat(date) {
    var inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
    var inputDate = inputFormat.parse(date);

    var outputFormat = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(inputDate);

    return outputDate;
  }*/

  static changeDateFormatforregistration(date) {
    var inputFormat = DateFormat('dd-MM-yyyy');
    var inputDate = inputFormat.parse(date);

    var outputFormat = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(inputDate);

    return outputDate;
  }

  static double getSize(context, multiplier) {
    return multiplier * (MediaQuery.of(context).size.height * 0.01);
  }

  static var fontFamilyName = "";

  static double getAppHorizontalSpace(context) {
    return Constants.getSize(2.4, context);
  }

  static Widget normalTextWidget(text, color, context,
      {var size = 12.0,
      FontWeight weight = FontWeight.w600,
      var maxLines = 100,
      TextAlign textAlign = TextAlign.start,
      var isUnderLine = false,
      var isLetterSpacing = false,
      var isHeight = false}) {
    return Text(text,
        textScaleFactor: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        maxLines: maxLines,
        style: TextStyle(
            color: color,
            fontSize: size,
            fontFamily: fontFamilyName,
            fontWeight: weight,
            letterSpacing: isLetterSpacing ? 0.6 : 0,
            height: isHeight ? Constants.getSize(0.2, context) : 0,
            decoration:
                isUnderLine ? TextDecoration.underline : TextDecoration.none));
  }

  static Widget button(context, text, {var isLoading = false}) {
    return SizedBox(
      height: getSize(context, 6.5),
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 10,
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.getSize(context, 0.8)),
        ),
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      normalTextWidget(text, Colors.white, context,
                          size: getSize(context, 1.6), weight: FontWeight.w600),
                    ],
                  )),
      ),
    );
  }

  static Widget buttonBorder(context, text,
      {var isLoading = false, var borderColor = Colors.black}) {
    return SizedBox(
      height: getSize(context, 6.5),
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 10,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(Constants.getSize(context, 0.8)),
            side: BorderSide(
                width: Constants.getSize(context, 0.1), color: borderColor)),
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      normalTextWidget(text, Colors.black, context,
                          size: getSize(context, 1.6), weight: FontWeight.w600),
                    ],
                  )),
      ),
    );
  }

  static Widget textField(
      var text, var textInputAction, TextEditingController controller,
      {var isNumber = false,
      required BuildContext context,
      var keyboardType = TextInputType.text,
      var isObsecureText = false,
      var maxLines = 1,
      var isEnabled = true}) {
    return SizedBox(
      height: maxLines == 1
          ? Constants.getSize(context, 7)
          : Constants.getSize(context, 12),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: isObsecureText,
        textInputAction: textInputAction,
        enabled: isEnabled,
        cursorColor: AppColors.buttonColor,
        maxLines: maxLines,
        maxLength: isNumber ? 10 : 100,
        style: TextStyle(
            color: AppColors.purpleColor,
            fontFamily: fontFamilyName,
            fontSize: Constants.getSize(context, 1.8)),
        decoration: InputDecoration(
          hintText: text,
          counterText: "",
          hintStyle: TextStyle(
              color: Colors.grey[600],
              fontSize: Constants.getSize(context, 1.4)),
          contentPadding: EdgeInsets.symmetric(
              vertical: Constants.getSize(context, 2), horizontal: 10.0),
          border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(Constants.getSize(context, 1)),
              borderSide: BorderSide(color: AppColors.normalDarkGrey)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Constants.getSize(context, 1)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Constants.getSize(context, 1)),
            borderSide: BorderSide(width: 1, color: AppColors.normalDarkGrey),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Constants.getSize(context, 1)),
            // Customize the radius for disabled state
            borderSide: BorderSide(
                width: 1,
                color: Colors
                    .grey), // Customize the border color for disabled state
          ),
        ),
      ),
    );
  }

  static Widget textFieldWhiteBackground(
      var text, var textInputAction, TextEditingController controller,
      {var isNumber = false,
      required BuildContext context,
      var keyboardType = TextInputType.text,
      var isObsecureText = false,
      var maxLines = 1,
      ValueChanged<String>? onChange,
      var isEnabled = true}) {
    return SizedBox(
      height: maxLines == 1
          ? Constants.getSize(context, 7)
          : Constants.getSize(context, 12),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: isObsecureText,
        textInputAction: textInputAction,
        enabled: isEnabled,
        cursorColor: AppColors.buttonColor,
        maxLines: maxLines,
        maxLength: isNumber ? 10 : 100,
        onChanged: onChange,
        style: TextStyle(
            color: AppColors.purpleColor,
            fontFamily: fontFamilyName,
            fontSize: Constants.getSize(context, 1.8)),
        decoration: InputDecoration(
          hintText: text,
          fillColor: Colors.white,
          filled: true,
          counterText: "",
          hintStyle: TextStyle(
              color: Colors.grey[600],
              fontSize: Constants.getSize(context, 1.4)),
          contentPadding: EdgeInsets.symmetric(
              vertical: Constants.getSize(context, 2), horizontal: 10.0),
          border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(Constants.getSize(context, 1)),
              borderSide: BorderSide(color: AppColors.normalDarkGrey)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Constants.getSize(context, 1)),
            borderSide: BorderSide(width: 1, color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Constants.getSize(context, 1)),
            borderSide: BorderSide(width: 1, color: Colors.white),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Constants.getSize(context, 1)),
            // Customize the radius for disabled state
            borderSide: BorderSide(
                width: 1,
                color: Colors
                    .white), // Customize the border color for disabled state
          ),
        ),
      ),
    );
  }

  static Widget dropDown(BuildContext context, var text, var selectedValue) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: Constants.getSize(context, 1.4),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: Constants.getSize(context, 2),
          // Adjust the vertical padding to align text and arrow
          horizontal: 10.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Constants.getSize(context, 1)),
          borderSide: BorderSide(color: AppColors.normalDarkGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Constants.getSize(context, 1)),
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Constants.getSize(context, 1)),
          // Customize the radius for disabled state
          borderSide: BorderSide(
              width: 1,
              color:
                  Colors.red), // Customize the border color for disabled state
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Constants.getSize(context, 1)),
          borderSide: BorderSide(width: 1, color: AppColors.normalDarkGrey),
        ),
      ),
      items: [
        // ... dropdown items
      ],
      onChanged: (value) {
        // ... handle onChanged
      },
      value: selectedValue, // assign the current selected value
    );
  }

  static Widget showBorderTextView(context, text,
      {var color = Colors.grey,
      var textSize = 12.0,
      var fontWeight = FontWeight.w600}) {
    return Container(
      height: Constants.getSize(context, 6.2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.getSize(context, 1)),
          border: Border.all(
              color: Colors.grey, width: Constants.getSize(context, 0.1))),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Constants.getSize(context, 1)),
            child: Constants.normalTextWidget(text, color, context,
                size: textSize, weight: fontWeight),
          )),
    );
  }

  static void redirectToWhatsApp(String phoneNumber) async {
    final url = 'whatsapp://send?phone=$phoneNumber';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle the case where the user can't launch WhatsApp
      print('Could not launch WhatsApp');
    }
  }

  static void redirectToDialer(String phoneNumber) async {
    final url = 'tel:$phoneNumber';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle the case where the user can't launch the dialer
      print('Could not launch the dialer');
    }
  }

  static Widget whiteBackgroundTextView(context, text) {
    return Container(
      height: Constants.getSize(context, 6.2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Constants.getSize(context, 1)),
      ),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Constants.getSize(context, 1)),
            child: Constants.normalTextWidget(text, Colors.grey, context),
          )),
    );
  }

  static Widget appBar(context, text) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.black,
        ),
      ),
      title: Constants.normalTextWidget(
        text,
        Colors.black,
        context,
        size: Constants.getSize(context, 1.8),
      ),
    );
  }

  static Widget searchBar(BuildContext context, String hintName,
      TextEditingController searchController,
      {ValueChanged<String>? onChanged}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: Constants.getSize(context, 6),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: Constants.getSize(context, 0.4))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(Constants.getSize(context, 0.8))),
      child: Padding(
        padding: EdgeInsets.only(
            left: getSize(context, 2), right: Constants.getSize(context, 2)),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: Constants.getSize(context, 3),
            ),
            SizedBox(
              width: Constants.getSize(context, 1),
            ),
            Expanded(
                child: Constants.textFieldWhiteBackground(
                    hintName, TextInputAction.done, searchController,
                    context: context, onChange: onChanged))
          ],
        ),
      ),
    );
  }
}
