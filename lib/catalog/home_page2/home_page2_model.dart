import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/customnavbar/customnavbar_widget.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage2Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for top_notification component.
  late TopNotificationModel topNotificationModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrdersRecord? newOrderfromNotificationMainPage;
  // Stores action output result for [Backend Call - Create Document] action in Services widget.
  OrdersRecord? newOrder;
  // Model for customnavbar component.
  late CustomnavbarModel customnavbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topNotificationModel = createModel(context, () => TopNotificationModel());
    customnavbarModel = createModel(context, () => CustomnavbarModel());
  }

  void dispose() {
    topNotificationModel.dispose();
    customnavbarModel.dispose();
  }

  /// Additional helper methods are added here.

}
