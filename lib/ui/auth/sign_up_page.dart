import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sub_scription_app/main.dart';
import 'package:sub_scription_app/service/sign_in_service.dart';
import 'package:sub_scription_app/service/platform_service.dart';
import 'package:sub_scription_app/service/sign_up_service.dart';
import 'package:sub_scription_app/ui/auth/button_freame.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController pf_name = TextEditingController();
    // 新規登録をするサービスクラス
    final signUpService = SignUpService();
    // プラットフォーム名を登録するメソッド
    final platformService = PlatformService();

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
                "https://www.chargebee.com/blog/wp-content/uploads/2022/07/Chargebee-Subscription-Box-Industry-trends-opportunities-and-Market-Size.png"),
            Text("REGISTER"),
            TextFormField(
              decoration: InputDecoration(
                hintText: '名前を入力してください',
                fillColor: Colors.orange[100],
                filled: true,
                isDense: true,
                prefixIcon: const Icon(Icons.man),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'メールアドレスを入力してください',
                fillColor: Colors.orange[100],
                filled: true,
                isDense: true,
                prefixIcon: const Icon(Icons.mail),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'パスワードを入力してください',
                fillColor: Colors.orange[100],
                filled: true,
                isDense: true,
                prefixIcon: const Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            ButtonFlame(
              label: "REGISTER",
              colors: Colors.red,
              onPressed: () async {
                try {
                  await signUpService.signUp(email.text, password.text);
                  await platformService.addPlatFormName(pf_name.text);
                  // 認証に成功した場合の処理
                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FirstPage()),
                        (route) => false);
                  }
                } catch (e) {
                  _showErrorSnackbar(context, e.toString());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
