import 'package:exam_app_elevate/features/authentication/forget_password/presentation/screens/forget_password_verify/widgets/pin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/values/app_strings.dart';
import '../widgets/forget_password_block.dart';

class ForgetPasswordVerify extends StatelessWidget {
  const ForgetPasswordVerify({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      // spacing: 20.h,
      children: [
        ForgetPasswordBlock(
          title: AppStrings.forgetPassword,
          content: AppStrings.passwordScreenDescription,
        ),
        SizedBox(height: 32.h),
        PinWidget(pageController: pageController),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: AppStrings.verifyText,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Color(0xff0F0F0F),
                ),
              ),
              TextSpan(
                text: AppStrings.resend,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Color(0xff02369C),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: const Color(
                    0xff02369C,
                  ), // تأكيد لون الخط نفسه
                  decorationStyle: TextDecorationStyle.solid,
                  height: 6,
                ),
                // هنا تقدر تضيف الـ recognizer عشان لما يضغط يعيد الإرسال
                // recognizer: TapGestureRecognizer()..onTap = () { /* Action */ },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
