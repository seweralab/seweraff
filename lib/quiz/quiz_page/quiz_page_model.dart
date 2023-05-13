import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/quiz/quiz_form/quiz_form_widget.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuizPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int? quizIndex = 0;

  List<String> quizVals = [];
  void addToQuizVals(String item) => quizVals.add(item);
  void removeFromQuizVals(String item) => quizVals.remove(item);
  void removeAtIndexFromQuizVals(int index) => quizVals.removeAt(index);

  ///  State fields for stateful widgets in this page.

  // Model for top_notification component.
  late TopNotificationModel topNotificationModel;
  // Models for quizForm dynamic component.
  late FlutterFlowDynamicModels<QuizFormModel> quizFormModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topNotificationModel = createModel(context, () => TopNotificationModel());
    quizFormModels = FlutterFlowDynamicModels(() => QuizFormModel());
  }

  void dispose() {
    topNotificationModel.dispose();
    quizFormModels.dispose();
  }

  /// Additional helper methods are added here.

}
