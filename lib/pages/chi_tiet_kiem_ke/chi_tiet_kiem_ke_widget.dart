import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/chi_tiet_k_k/chi_tiet_k_k_widget.dart';
import '/components/san_pham/san_pham_widget.dart';
import '/components/token_expire/token_expire_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chi_tiet_kiem_ke_model.dart';
export 'chi_tiet_kiem_ke_model.dart';

class ChiTietKiemKeWidget extends StatefulWidget {
  const ChiTietKiemKeWidget({
    Key? key,
    required this.stoName,
    required this.inventoryDate,
    required this.description,
    required this.gusId,
    required this.ounId,
    required this.pihId,
    required this.pihNumber,
  }) : super(key: key);

  final String? stoName;
  final String? inventoryDate;
  final String? description;
  final int? gusId;
  final int? ounId;
  final int? pihId;
  final String? pihNumber;

  @override
  _ChiTietKiemKeWidgetState createState() => _ChiTietKiemKeWidgetState();
}

class _ChiTietKiemKeWidgetState extends State<ChiTietKiemKeWidget> {
  late ChiTietKiemKeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChiTietKiemKeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (currentAuthTokenExpiration! <= getCurrentTimestamp) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: TokenExpireWidget(),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Chi tiết kiểm kê',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Be Vietnam Pro',
                  color: Colors.white,
                  fontSize: 20.0,
                ),
          ),
          actions: [
            FFButtonWidget(
              onPressed: () async {
                GoRouter.of(context).prepareAuthEvent();
                await authManager.signOut();
                GoRouter.of(context).clearRedirectLocation();

                context.goNamedAuth('DangNhap', context.mounted);
              },
              text: 'Đăng xuất',
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Be Vietnam Pro',
                      color: Colors.white,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.chiTietKKModel,
                          updateCallback: () => setState(() {}),
                          child: ChiTietKKWidget(
                            kiemKe: KiemKeStruct(
                              pihId: widget.pihId,
                              pihNumber: widget.pihNumber,
                              inventoryDate: widget.inventoryDate,
                              stoName: widget.stoName,
                              description: widget.description,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 12.0, 0.0, 12.0),
                        child: Text(
                          'Sản phẩm',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Be Vietnam Pro',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      FutureBuilder<ApiCallResponse>(
                        future: (_model.apiRequestCompleter ??=
                                Completer<ApiCallResponse>()
                                  ..complete(CheckKkCall.call(
                                    token: currentAuthenticationToken,
                                    gusId: widget.gusId,
                                    ounId: widget.ounId,
                                    pihId: widget.pihId,
                                  )))
                            .future,
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final listViewCheckKkResponse = snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final listSanPham = functions
                                      .spToList(
                                          listViewCheckKkResponse.jsonBody)
                                      ?.toList() ??
                                  [];
                              return RefreshIndicator(
                                onRefresh: () async {
                                  setState(
                                      () => _model.apiRequestCompleter = null);
                                  await _model.waitForApiRequestCompleted();
                                },
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listSanPham.length,
                                  itemBuilder: (context, listSanPhamIndex) {
                                    final listSanPhamItem =
                                        listSanPham[listSanPhamIndex];
                                    return Builder(
                                      builder: (context) {
                                        if (listSanPhamItem != null) {
                                          return SanPhamWidget(
                                            key: Key(
                                                'Keyoaj_${listSanPhamIndex}_of_${listSanPham.length}'),
                                            sanPham: listSanPhamItem,
                                          );
                                        } else {
                                          return TokenExpireWidget(
                                            key: Key(
                                                'Key10x_${listSanPhamIndex}_of_${listSanPham.length}'),
                                          );
                                        }
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 1.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'ScanQR',
                        queryParameters: {
                          'gusId': serializeParam(
                            widget.gusId,
                            ParamType.int,
                          ),
                          'ounId': serializeParam(
                            widget.ounId,
                            ParamType.int,
                          ),
                          'pihId': serializeParam(
                            widget.pihId,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).primary,
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: Icon(
                          Icons.qr_code_scanner_rounded,
                          color: FlutterFlowTheme.of(context).info,
                          size: 40.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
