import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinWidget extends StatelessWidget {
  PinWidget({super.key, required this.pageController});
  final PageController pageController;
  final pinController = PinInputController();
  bool isFormValid = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: formKey,
      child: Container(
        height: 92.h,
        width: 344.w,
        color: isFormValid ? Colors.red : Colors.white,
        child: MaterialPinField(
          length: 4,
          onCompleted: (pin) {
            if (formKey.currentState!.validate()) {
              pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          },
          obscureText: true,
          autoFocus: true,
          pinController: pinController,
          //obscuringWidget: Icons.thre,
          onChanged: (value) {
            final pattern = RegExp(r'^[0-9]+$');
            if (!pattern.hasMatch(value)) {
              return;
            } else {
              "Invalid Code";
            }
          },
          theme: MaterialPinTheme(
            shape: MaterialPinShape.outlined,
            cellSize: Size(74.w, 68.h),
            borderRadius: BorderRadius.circular(10.r),
            fillColor: Color(0xffDFE7F7),
            borderColor: Color(0xffDFE7F7),
            cursorColor: Colors.black,
            animateCursor: true,
            animationDuration: Duration(milliseconds: 300),
            animationCurve: Curves.easeIn,
            completeBorderColor: Color(0xffDFE7F7),
            completeTextStyle: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 16.sp,
              fontWeight: .w500,
            ),

            completeFillColor: Color(0xffDFE7F7),
            errorBorderColor: Color(0xffCC1010),
            errorBorderWidth: 2.w,
            errorFillColor: Color(0xffF9F9F9),
            focusedFillColor: Color(0xffDFE7F7),
            errorColor: Color(0xffDFE7F7),
            borderWidth: 2.w,
            enableErrorShake: true,
            filledBorderColor: Color(0xffDFE7F7),
            focusedBorderColor: Color(0xffDFE7F7),
            textStyle: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 16.sp,
              fontWeight: .w500,
            ),
            filledFillColor: Color(0xffDFE7F7),
            obscuringCharacter: "*",
          ),
        ),
      ),
    );
  }
}
