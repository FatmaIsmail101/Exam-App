import 'package:exam_app_elevate/config/base_classes/base_response.dart';

import '../../../../auth_response/auth_base_response.dart';
import '../../models/reset_password/reset_password_request.dart';

abstract class ResetPasswordDataSourceContract {
  Future<BaseResponse<AuthBaseResponse>> resetPassword(
    ResetPasswordRequest request,
  );
}
