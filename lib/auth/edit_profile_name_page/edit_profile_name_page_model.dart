import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/customnavbar/customnavbar_widget.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileNamePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for top_notification component.
  late TopNotificationModel topNotificationModel;
  // State field(s) for surnameField widget.
  TextEditingController? surnameFieldController;
  String? Function(BuildContext, String?)? surnameFieldControllerValidator;
  // State field(s) for nameField widget.
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  // State field(s) for patronymicField widget.
  TextEditingController? patronymicFieldController;
  String? Function(BuildContext, String?)? patronymicFieldControllerValidator;
  // Model for customnavbar component.
  late CustomnavbarModel customnavbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topNotificationModel = createModel(context, () => TopNotificationModel());
    customnavbarModel = createModel(context, () => CustomnavbarModel());
  }

  void dispose() {
    topNotificationModel.dispose();
    surnameFieldController?.dispose();
    nameFieldController?.dispose();
    patronymicFieldController?.dispose();
    customnavbarModel.dispose();
  }

  /// Additional helper methods are added here.

}
