import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cancel_order_page_model.dart';
export 'cancel_order_page_model.dart';

class CancelOrderPageWidget extends StatefulWidget {
  const CancelOrderPageWidget({
    Key? key,
    this.order,
  }) : super(key: key);

  final OrdersRecord? order;

  @override
  _CancelOrderPageWidgetState createState() => _CancelOrderPageWidgetState();
}

class _CancelOrderPageWidgetState extends State<CancelOrderPageWidget> {
  late CancelOrderPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CancelOrderPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.showInputError = false;
        _model.showTopError = false;
      });
    });

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.topNotificationModel,
                    updateCallback: () => setState(() {}),
                    child: TopNotificationWidget(
                      isDisbaledHome: true,
                      isDisabledNotification: true,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 26.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                  size: 24.0,
                                ),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: AutoSizeText(
                                      widget.order!.servicename!
                                          .maybeHandleOverflow(maxChars: 28),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Fira Sans',
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  if (_model.showTopError == true)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Container(
                                        width: 277.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFFEE83),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 10.0, 8.0, 10.0),
                                          child: Text(
                                            'Нужно выбрать хотя бы один вариант',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Fira Sans',
                                                  fontSize: 14.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Text(
                              'Почему хотите отменить заказ?',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional(-1.0, 1.0),
                              children: [
                                FlutterFlowCheckboxGroup(
                                  options: functions
                                      .cancelOrderCheckboxes()
                                      .toList(),
                                  onChanged: (val) async {
                                    setState(
                                        () => _model.checkboxGroupValues = val);
                                    setState(() {
                                      _model.showTopError = false;
                                    });
                                  },
                                  controller:
                                      _model.checkboxGroupValueController ??=
                                          FormFieldController<List<String>>(
                                    ['Дорого'],
                                  ),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  checkColor: Colors.white,
                                  checkboxBorderColor: Color(0xFF95A1AC),
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  itemPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  initialized:
                                      _model.checkboxGroupValues != null,
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        30.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.05),
                                        child: Container(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: _model.textController,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.textController',
                                              Duration(milliseconds: 10),
                                              () async {
                                                setState(() {
                                                  _model.showInputError = false;
                                                });
                                              },
                                            ),
                                            onFieldSubmitted: (_) async {
                                              setState(() {
                                                _model.showInputError = false;
                                              });
                                            },
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Другое',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: functions
                                                      .borderErrorColor(_model
                                                          .showInputError),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xFFE0E3E7),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (_model.showInputError == true)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 15.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 1.0, 0.0, 0.0),
                                        child: SvgPicture.asset(
                                          'assets/images/confirm.svg',
                                          width: 14.0,
                                          height: 14.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Это поле нужно заполнить',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Fira Sans',
                                                fontSize: 12.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 24.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_model.checkboxGroupValues!.length > 0) {
                      if (functions.isCheckboxHaveInput(
                          _model.checkboxGroupValues?.toList())) {
                        if (_model.textController.text == '') {
                          setState(() {
                            _model.showInputError = true;
                          });
                          return;
                        }
                      }
                    } else {
                      setState(() {
                        _model.showTopError = true;
                      });
                      return;
                    }

                    final ordersUpdateData = createOrdersRecordData(
                      status: 'Отменен',
                      whyCancel: functions.combineCancelCheckboxes(
                          _model.checkboxGroupValues!.toList(),
                          _model.textController.text),
                    );
                    await widget.order!.reference.update(ordersUpdateData);

                    context.pushNamed('ordersPage');
                  },
                  text: 'Отменить заказ',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF405460),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Fira Sans',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
