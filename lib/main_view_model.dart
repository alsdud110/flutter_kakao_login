import 'package:flutter_kakao_login/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class MainViewModel {
  final SocialLogin _socialLogin;
  bool isLogined = false;
  User? user;

  MainViewModel(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      user = await UserApi.instance.me();
      print('사용자 정보 요청 성공'
          '\n회원번호: ${user!.id}'
          '\n닉네임: ${user!.kakaoAccount?.profile?.nickname}');
    }
  }

  Future logout() async {
    await _socialLogin.logout();
    isLogined = false;
    user = null;
  }
}
