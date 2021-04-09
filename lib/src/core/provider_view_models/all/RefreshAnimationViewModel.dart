import 'package:flutter/material.dart';
import 'package:inki/src/core/provider_view_models/base/base_change_notifier_model.dart';

enum Fragnance { white, yellow, blue, orange }

class RefreshAnimationViewModel extends BaseChangeNotifierModel {
  BuildContext context;

  RefreshAnimationViewModel(BuildContext context) {}


  @override
  void dispose() {
    super.dispose();
  }
}
