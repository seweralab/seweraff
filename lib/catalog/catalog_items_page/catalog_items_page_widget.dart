import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/customnavbar/customnavbar_widget.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'catalog_items_page_model.dart';
export 'catalog_items_page_model.dart';

class CatalogItemsPageWidget extends StatefulWidget {
  const CatalogItemsPageWidget({
    Key? key,
    this.catalog,
  }) : super(key: key);

  final String? catalog;

  @override
  _CatalogItemsPageWidgetState createState() => _CatalogItemsPageWidgetState();
}

class _CatalogItemsPageWidgetState extends State<CatalogItemsPageWidget> {
  late CatalogItemsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CatalogItemsPageModel());
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
          child: Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.topNotificationModel,
                          updateCallback: () => setState(() {}),
                          child: TopNotificationWidget(),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 10.0, 18.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFF3F4F5),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('SearchPage');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Найти услугу в каталоге',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Fira Sans',
                                            color: Color(0xB3102938),
                                            fontSize: 14.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                      size: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 0.0, 18.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 32.0, 0.0, 32.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.safePop();
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 18.0, 0.0),
                                          child: Icon(
                                            Icons.arrow_back_sharp,
                                            color: Colors.black,
                                            size: 24.0,
                                          ),
                                        ),
                                        Text(
                                          widget.catalog!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Fira Sans',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: StreamBuilder<List<ServicesRecord>>(
                                    stream: queryServicesRecord(
                                      queryBuilder: (servicesRecord) =>
                                          servicesRecord
                                              .where('category',
                                                  arrayContains: widget.catalog)
                                              .orderBy('order'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        );
                                      }
                                      List<ServicesRecord>
                                          listViewServicesRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewServicesRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewServicesRecord =
                                              listViewServicesRecordList[
                                                  listViewIndex];
                                          return Stack(
                                            children: [
                                              if (listViewServicesRecord
                                                      .title !=
                                                  functions
                                                      .defineAllServicesText())
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      FFAppState()
                                                          .currentQuizIndex = 0;

                                                      final ordersCreateData =
                                                          createOrdersRecordData(
                                                        status: 'Не оформлен',
                                                        cost: 0,
                                                        client:
                                                            currentUserReference,
                                                        service:
                                                            listViewServicesRecord
                                                                .reference,
                                                        servicename:
                                                            listViewServicesRecord
                                                                .title,
                                                        orderDate:
                                                            getCurrentTimestamp,
                                                        cashback:
                                                            listViewServicesRecord
                                                                .cashback,
                                                      );
                                                      var ordersRecordReference =
                                                          OrdersRecord
                                                              .collection
                                                              .doc();
                                                      await ordersRecordReference
                                                          .set(
                                                              ordersCreateData);
                                                      _model.newOrderFull = OrdersRecord
                                                          .getDocumentFromData(
                                                              ordersCreateData,
                                                              ordersRecordReference);
                                                      FFAppState()
                                                              .currentOrder =
                                                          _model.newOrderFull!
                                                              .reference;

                                                      context.pushNamed(
                                                        'QuizPage2',
                                                        queryParams: {
                                                          'serviceRef':
                                                              serializeParam(
                                                            listViewServicesRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      setState(() {});
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (listViewIndex > 0)
                                                          Divider(
                                                            thickness: 1.0,
                                                          ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      3.0,
                                                                      0.0,
                                                                      3.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              AutoSizeText(
                                                                listViewServicesRecord
                                                                    .title!
                                                                    .maybeHandleOverflow(
                                                                        maxChars:
                                                                            30),
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Fira Sans',
                                                                      lineHeight:
                                                                          1.2,
                                                                    ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (listViewServicesRecord
                                                                          .cashback! >
                                                                      0)
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            Color(0xFF7556FE),
                                                                            Color(0xFFFC56C9),
                                                                            Color(0xFFFEC121)
                                                                          ],
                                                                          stops: [
                                                                            0.0,
                                                                            0.3,
                                                                            1.0
                                                                          ],
                                                                          begin: AlignmentDirectional(
                                                                              -0.03,
                                                                              -1.0),
                                                                          end: AlignmentDirectional(
                                                                              0.03,
                                                                              1.0),
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(8.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            5.0,
                                                                            8.0,
                                                                            5.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                              child: SvgPicture.asset(
                                                                                'assets/images/Union.svg',
                                                                                width: 12.0,
                                                                                height: 12.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                listViewServicesRecord.cashback?.toString(),
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Fira Sans',
                                                                                    color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                    fontWeight: FontWeight.w800,
                                                                                    fontStyle: FontStyle.italic,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              '%',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Fira Sans',
                                                                                    color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                    fontWeight: FontWeight.w800,
                                                                                    fontStyle: FontStyle.italic,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  Icon(
                                                                    Icons
                                                                        .chevron_right,
                                                                    color: Colors
                                                                        .black,
                                                                    size: 24.0,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              if (listViewServicesRecord
                                                      .title ==
                                                  functions
                                                      .defineAllServicesText())
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          'QuizSelectDate');
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 48.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF3F4F5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    14.0,
                                                                    14.0,
                                                                    14.0,
                                                                    14.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          14.0,
                                                                          0.0),
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/images/noservice.svg',
                                                                width: 20.0,
                                                                height: 20.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Тут нет моей услуги',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Fira Sans',
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          );
                                        },
                                      );
                                    },
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
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.customnavbarModel,
                    updateCallback: () => setState(() {}),
                    child: CustomnavbarWidget(
                      supportactive: false,
                      homeactive: true,
                      orderactive: false,
                      profileactive: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
