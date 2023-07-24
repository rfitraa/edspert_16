import 'package:edspert_16/presentation/screen/home/page/home_page.dart';
import 'package:edspert_16/presentation/widget/auth_button.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/login-image.png'),
            const Column(
              children: [
                Text(
                  'Selamat Datang',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Text(
                  'Selamat datang di aplikasi Aplikasi Widya Edu \n'
                  'Aplikasi Latihan dan Konsultasi Soal',
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                AuthButton(
                  iconPath: 'assets/google-logo.png',
                  text: 'Masuk dengan Google',
                  color: Colors.white,
                  textColor: Colors.black,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                AuthButton(
                  iconPath: 'assets/apple-logo.png',
                  text: 'Masuk dengan Apple',
                  color: Colors.black,
                  textColor: Colors.white,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
