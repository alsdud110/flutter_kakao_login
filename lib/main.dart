import 'package:flutter/material.dart';
import 'package:flutter_kakao_login/kakao_login.dart';
import 'package:flutter_kakao_login/main_view_model.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() {
  KakaoSdk.init(nativeAppKey: 'd9030cd900f4923d0d86cdf9d192167f');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter KaKao Login',
      home: MyHomePage(title: 'Flutter KaKao Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final viewModel = MainViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.8,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            viewModel.isLogined
                ? Text("${viewModel.user?.kakaoAccount?.profile?.nickname}")
                : const Text("로그인 안됨"),
            Text(
              '${viewModel.isLogined}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            _loginButton("kakao_logo"),
            ElevatedButton(
              onPressed: () async {
                await viewModel.logout();
                setState(() {});
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginButton(String path) {
    return Card(
      elevation: 10.0,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: Ink.image(
        image: AssetImage('assets/image/$path.png'),
        width: 60,
        height: 60,
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(35.0),
          ),
          onTap: () async {
            await viewModel.login();
            setState(() {});
          },
        ),
      ),
    );
  }
}
