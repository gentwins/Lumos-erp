import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kiem_ke_model.dart';
export 'kiem_ke_model.dart';

class KiemKeWidget extends StatefulWidget {
  const KiemKeWidget({
    Key? key,
    required this.kiemKe,
  }) : super(key: key);

  final KiemKeStruct? kiemKe;

  @override
  _KiemKeWidgetState createState() => _KiemKeWidgetState();
}

class _KiemKeWidgetState extends State<KiemKeWidget>
    with TickerProviderStateMixin {
  late KiemKeModel _model;

  final animationsMap = {
    'cardOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(0.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KiemKeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.of(context).primaryBackground,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: FlutterFlowTheme.of(context).primary,
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                child: Icon(
                  Icons.newspaper_rounded,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: FlutterFlowTheme.of(context).primary,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                child: Text(
                  'Số kiểm kê: ${widget.kiemKe?.pihNumber}',
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Be Vietnam Pro',
                        color: FlutterFlowTheme.of(context).info,
                      ),
                ),
              ),
            ),
            Text(
              'Ngày kiểm kê: ${widget.kiemKe?.inventoryDate}',
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Be Vietnam Pro',
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'Kho: ${widget.kiemKe?.stoName}',
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Be Vietnam Pro',
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'Diễn giải: ${widget.kiemKe?.description}',
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Be Vietnam Pro',
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    ).animateOnPageLoad(animationsMap['cardOnPageLoadAnimation']!);
  }
}
