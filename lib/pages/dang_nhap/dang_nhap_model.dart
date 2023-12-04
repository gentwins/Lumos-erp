import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/bottom_sheet/bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dang_nhap_widget.dart' show DangNhapWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DangNhapModel extends FlutterFlowModel<DangNhapWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameController;
  String? Function(BuildContext, String?)? userNameControllerValidator;
  String? _userNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nhập tên tài khoản!';
    }

    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nhập mật khẩu!';
    }

    return null;
  }

  // State field(s) for companyCode widget.
  FocusNode? companyCodeFocusNode;
  TextEditingController? companyCodeController;
  String? Function(BuildContext, String?)? companyCodeControllerValidator;
  String? _companyCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nhập mã công ty!';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Authentication)] action in Button widget.
  ApiCallResponse? authenticationResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userNameControllerValidator = _userNameControllerValidator;
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
    companyCodeControllerValidator = _companyCodeControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    userNameFocusNode?.dispose();
    userNameController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    companyCodeFocusNode?.dispose();
    companyCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
