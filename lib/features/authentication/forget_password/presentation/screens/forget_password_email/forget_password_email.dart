import 'package:exam_app_elevate/features/authentication/forget_password/presentation/screens/widgets/forget_password_block.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/presentation/screens/widgets/forget_password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/values/app_strings.dart';

class ForgetPasswordEmail extends StatefulWidget {
  ForgetPasswordEmail({super.key, required this.pageController});
  PageController pageController;
  @override
  State<ForgetPasswordEmail> createState() => _ForgetPasswordEmailState();
}

class _ForgetPasswordEmailState extends State<ForgetPasswordEmail> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  bool? isFormValid; // دي الحالة اللي هنربط بيها لون الزرار
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: formKey,
      onChanged: () {
        setState(() {
          // هنا بنسأل الـ Form: "هل كل الـ Validators اللي جواك مرجعين null؟"
          // بس بنستخدم validate() بحذر عشان متطلعش رسالة Error وإحنا لسه بنكتب
          isFormValid = formKey.currentState?.validate() ?? false;
        });
      },
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: 32.h,
        children: [
          ForgetPasswordBlock(
            title: AppStrings.forgetPassword,
            content: AppStrings.passwordScreenDescription,
          ),
          ForgetPasswordTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.emailMessage;
              }
              String pattern = AppStrings.emailRegex;
              RegExp regex = RegExp(pattern);
              if (!regex.hasMatch(value)) {
                return AppStrings.emailMessage;
              }
              return null;
            },
            textInputType: TextInputType.emailAddress,
            controller: controller,
            hintText: AppStrings.emailHint,
            labelText: AppStrings.emailLabel,
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () {
              if (isFormValid == true || isFormValid == null) {
                if (formKey.currentState!.validate()) {
                  // تأكيد أخير قبل النقل
                  widget.pageController.nextPage(
                    duration: Duration(
                      milliseconds: 300,
                    ), // زودت الوقت شوية عشان يبان السلاسة
                    curve: Curves.easeIn,
                  );
                }
              }
              null;
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: (isFormValid == false)
                  ? Color(0xff878787)
                  : Color(0xff02369C),
            ),
            child: Text(
              AppStrings.continueButton,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Color(0xffF9F9F9),
                fontWeight: .bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
