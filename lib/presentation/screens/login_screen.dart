import 'package:diabetes_safety/cubit/auth/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Center(child: Image.asset('assets/logo.png')),
            Text(
              'البريد الالكتروني',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(
              height: 75,
              child: TextFormField(
                style: Theme.of(context).textTheme.displayMedium,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'alaa.263@gmail.com',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'كلمة المرور',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return SizedBox(
                  height: 75,
                  child: TextFormField(
                    obscureText: !context.read<AuthCubit>().isPasswordShown,
                    style: Theme.of(context).textTheme.displayMedium,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () => context.read<AuthCubit>().changePasswordVisibility(),
                        icon: Icon(
                          context.read<AuthCubit>().isPasswordShown ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      hintText: '****************',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * .6,
                height: 60,
                child: Card(
                  child: Center(
                    child: Text(
                      'تسجيل الدخول',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: Text(
                  'ليس لديك حساب؟',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
