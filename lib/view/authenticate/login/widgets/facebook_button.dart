import 'package:flutter/material.dart';

import '../../../../core/components/button/title_text_button.dart';

class FaceBookButton extends StatelessWidget {
  final Function(FaceBookModel? data, {String errorMessage})? onComplete;

  const FaceBookButton({Key? key, this.onComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MavTextButton(
      text: "Facebook Login",
      onPressed: () {
        if (1 == 0) {
          onComplete!(FaceBookModel("token", "mail"));
        } else {
          onComplete!(null, errorMessage: "Facebook user not found");
        }
      },
    );
  }
}

class FaceBookModel {
  final String token;
  final String mail;

  FaceBookModel(this.token, this.mail);
}
