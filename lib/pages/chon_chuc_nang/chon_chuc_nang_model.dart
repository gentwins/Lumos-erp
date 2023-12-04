import '/auth/custom_auth/auth_util.dart';
import '/components/bottom_sheet/bottom_sheet_widget.dart';
import '/components/menu/menu_widget.dart';
import '/components/token_expire/token_expire_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'chon_chuc_nang_widget.dart' show ChonChucNangWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChonChucNangModel extends FlutterFlowModel<ChonChucNangWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Menu component.
  late MenuModel menuModel1;
  // Model for Menu component.
  late MenuModel menuModel2;
  // Model for Menu component.
  late MenuModel menuModel3;
  // Model for Menu component.
  late MenuModel menuModel4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    menuModel1 = createModel(context, () => MenuModel());
    menuModel2 = createModel(context, () => MenuModel());
    menuModel3 = createModel(context, () => MenuModel());
    menuModel4 = createModel(context, () => MenuModel());
  }

  void dispose() {
    unfocusNode.dispose();
    menuModel1.dispose();
    menuModel2.dispose();
    menuModel3.dispose();
    menuModel4.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
