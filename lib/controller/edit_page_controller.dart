import 'dart:convert';
import 'dart:developer';

import 'package:flutter_app/model/contact_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../model/contact_list_model.dart';
import '../model/contact_list_data_string.dart' as contactListData;

class EditPageController extends ControllerMVC {
  static EditPageController _controller = EditPageController._internal();

  /// Singleton Factory
  factory EditPageController() {
    if (_controller == null) _controller = EditPageController._internal();
    return _controller;
  }

  EditPageController._internal();

  /// Allow for easy access to 'the Controller' throughout the application.
  static EditPageController get con => _controller;


}
