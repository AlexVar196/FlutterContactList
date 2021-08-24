import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter_app/model/contact_model.dart';
import 'package:flutter_app/view/contact_edit_page.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class InfoPageController extends ControllerMVC {
  static InfoPageController _controller = InfoPageController._internal();

  /// Singleton Factory
  factory InfoPageController() {
    if (_controller == null) _controller = InfoPageController._internal();
    return _controller;
  }

  InfoPageController._internal();

  /// Allow for easy access to 'the Controller' throughout the application.
  static InfoPageController get con => _controller;

  /// Responds to edit button click.
  ///
  /// Navigates to the ContactEditPage and passing [contact].
  /// When returns from next page, navigates back and then refreshes previous page.
  void onEditPressed(BuildContext context, ContactModel contact) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ContactEditPage(contact)))
        .then((value) => Navigator.pop(context, () {
              setState(() {});
            }));
  }
}
