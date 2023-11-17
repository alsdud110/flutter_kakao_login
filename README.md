# flutter_kakao_login

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



1. Kakao Developer 사이트 설정하기
    - 내 애플리케이션 추가하기(생성)
    - 네이티브 앱 키 확인 (d9030cd900f4923d0d86cdf9d1*****)
    - 플랫폼 등록(Android, iOS)
    - Android => com.example.${어플리케이션 이름}, iOS => com.example.${어플리케이션 이름} (카멜케이스로)
    - Android 등록 시 키 해쉬를 입력해야함
    - 터미널에서 keytool -exportcert -alias androiddebugkey -keystore ~/.android/debug.keystore -storepass android -keypass android | openssl sha1 -binary | openssl base64 입력 후 결과값 등록 (키 해쉬)
    - 카카오 로그인 활성화 상태

2. pub.dev 에서 flutter 관련 sdk 설치
    - kakao_flutter_sdk: ^1.7.0 
    - kakao_flutter_sdk_user: ^1.7.0

3. android > app > src > AndroidManifest.xml 수정
    <activity android:name="com.kakao.sdk.flutter.AuthCodeCustomTabsActivity">
      <intent-filter android:label="flutter_web_auth">
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <!-- Redirect URI, "kakao${YOUR_NATIVE_APP_KEY}://oauth" 형식 -->
        <data android:scheme="kakaod9030cd900f4923d0d86cdf9d1*****" android:host="oauth"/>
      </intent-filter>
    </activity>
    
    android:scheme=kakao[본인 Native Key](d9030cd900f4923d0d86cdf9d1*****)

4. android/app/build.gradle 수정
    - minSdkVersion 19 로

5. 그 다음 코드로~#   f l u t t e r _ k a k a o _ l o g i n  
 