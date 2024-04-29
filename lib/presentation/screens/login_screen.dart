import 'package:diabetes_safety/core/theme/palette.dart';
import 'package:diabetes_safety/core/utile/shared/loading.dart';
import 'package:diabetes_safety/core/utile/shared/show_message.dart';
import 'package:diabetes_safety/cubit/auth/auth_cubit.dart';
import 'package:diabetes_safety/presentation/screens/main_screen.dart';
import 'package:diabetes_safety/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController email;
  late final TextEditingController password;
  late final GlobalKey<FormState> formKey;
  @override
  void initState() {
    formKey = GlobalKey<FormState>();

    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showLoading(context);
        } else if (state is AuthSuccess) {
          Navigator.pop(context);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
        } else if (state is AuthFail) {
          Navigator.pop(context);
          showMessage(context,
              content: Text(
                state.message,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'حاول مره اخري',
                    style:
                        Theme.of(context).textTheme.displayMedium!.copyWith(color: AppPalette.primaryButtonColorLight),
                  ),
                )
              ]);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: formKey,
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
                  height: 85,
                  child: TextFormField(
                    controller: email,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "هذه الخانة مطلوبه";
                      } else if (!context.read<AuthCubit>().isValidEmail(value)) {
                        return 'عنوان البريد الإلكتروني غير صحيح';
                      } else {
                        return null;
                      }
                    },
                    style: Theme.of(context).textTheme.displayMedium,
                    decoration: const InputDecoration(
                      prefixIconColor: Colors.grey,
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
                      height: 85,
                      child: TextFormField(
                        controller: password,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "هذه الخانة مطلوبه";
                          } else if (value.length < 8) {
                            return 'يجب ان لا تقل كلمه السر عن 8 أحرف أو ارقام';
                          } else {
                            return null;
                          }
                        },
                        obscureText: !context.read<AuthCubit>().isPasswordShown,
                        style: Theme.of(context).textTheme.displayMedium,
                        decoration: InputDecoration(
                          prefixIconColor: Colors.grey,
                          suffixIconColor: Colors.grey,
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
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthCubit>().login(
                            email: email.text,
                            password: password.text,
                          );
                    }
                  },
                  child: Center(
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
                ),
                const Spacer(),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                    },
                    child: Text(
                      'ليس لديك حساب؟',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
