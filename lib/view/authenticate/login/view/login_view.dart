import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../_widgets/button/login_button.dart';
import '../viewmodel/login_view_model.dart';
import 'face_book_button.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) => buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            MavLoginButton(
              onComplete: (data) {
                print(data);
              },
            ),
            FaceBookButton(
              onComplete: (data, {errorMessage}) {
                if (data != null) {
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(errorMessage),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      );

  Text buildText(BuildContext context) {
    return Text(
      "Hello",
      style: context.textTheme.headline1.copyWith(color: context.theme.primaryColor),
    );
  }
}
