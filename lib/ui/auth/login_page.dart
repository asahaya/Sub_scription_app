import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sub_scription_app/main.dart';
import 'package:sub_scription_app/service/sign_in_service.dart';
import 'package:sub_scription_app/ui/auth/button_freame.dart';
import 'package:sub_scription_app/ui/auth/sign_up_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    // 認証機能を使用するクラス
    final signInService = SignInService();

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
                "https://www.chargebee.com/blog/wp-content/uploads/2022/07/Chargebee-Subscription-Box-Industry-trends-opportunities-and-Market-Size.png"),
            Text("LOGIN"),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                hintText: 'メールアドレスを入力してください',
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
              controller: password,
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
              label: "LOGIN",
              colors: Colors.blue,
              onPressed: () async {
                try {
                  await signInService.signIn(email.text, password.text);
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
            ButtonFlame(
              label: "REGISTER",
              colors: Colors.red,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
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
