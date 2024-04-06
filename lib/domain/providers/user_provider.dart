import 'package:flutter/cupertino.dart';

import '../models/sign_in_model/sign_in_response_model.dart';

class UserProvider extends ChangeNotifier {
  SignInResponseModel? userModel;
}
