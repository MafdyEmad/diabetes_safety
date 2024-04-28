import 'package:diabetes_safety/presentation/screens/login_screen.dart';
import 'package:diabetes_safety/presentation/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Image.asset('assets/logo.png'),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
            },
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * .6,
              height: 60,
              child: Card(
                child: Center(
                  child: Text(
                    'انشاء حساب جديد',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'لديك حساب؟',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: Text(
                  'تسجيل دخول',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
