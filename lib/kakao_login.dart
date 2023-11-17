import 'package:flutter_kakao_login/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      print(isInstalled);
      if (isInstalled) {
        print("깔려있으면");
        try {
          await UserApi.instance.loginWithKakaoTalk();
          return true;
        } catch (e) {
          return false;
        }
      } else {
        print("안 깔려있으면");
        try {
          // var keyHash = Utility.getKeyHash(this);
          print(await KakaoSdk.origin);
          await UserApi.instance.loginWithKakaoAccount();
          return true;
        } catch (e) {
          print("오류발생 : $e");
          return false;
        }
      }
    } catch (e) {
      print("오류발생 : $e");
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (error) {
      return false;
    }
  }
}
