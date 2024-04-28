import 'package:diabetes_safety/presentation/widgets/auth_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'لنبدأ',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Text(
                'من فضلك قم بملئ البيانات',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 20),
              Text(
                'اسم المستخدم',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const AuthTextField(
                prefixIcon: Icon(Icons.person),
                hintText: 'alaa.263@gmail.com',
              ),
              Text(
                'اسم المستخدم',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const AuthTextField(
                prefixIcon: Icon(Icons.person),
                hintText: 'alaa',
              ),
              Text(
                'انشاء كلمة المرور',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const AuthTextField(
                prefixIcon: Icon(Icons.lock),
                hintText: 'لا يقل عن 8 أحرف أو ارقام',
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * .6,
                  height: 60,
                  child: Card(
                    child: Center(
                      child: Text(
                        'انشاء حساب',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
