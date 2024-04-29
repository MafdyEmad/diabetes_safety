import 'package:diabetes_safety/core/theme/palette.dart';
import 'package:diabetes_safety/core/utile/shared/loading.dart';
import 'package:diabetes_safety/core/utile/shared/show_message.dart';
import 'package:diabetes_safety/cubit/auth/auth_cubit.dart';
import 'package:diabetes_safety/presentation/screens/main_screen.dart';
import 'package:diabetes_safety/presentation/widgets/auth_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController name;
  late final TextEditingController email;
  late final TextEditingController password;
  late final GlobalKey<FormState> formKey;
  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
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
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'لنبدأ',
                    style:
                        Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'من فضلك قم بملئ البيانات',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'الايميل',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 90,
                    child: AuthTextField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "هذه الخانة مطلوبه";
                        } else if (!context.read<AuthCubit>().isValidEmail(value)) {
                          return 'عنوان البريد الإلكتروني غير صحيح';
                        } else {
                          return null;
                        }
                      },
                      controller: email,
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'alaa.263@gmail.com',
                    ),
                  ),
                  Text(
                    'اسم المستخدم',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 90,
                    child: AuthTextField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "هذه الخانة مطلوبه";
                        } else if (value.length < 3) {
                          return 'يجب ان يكون اسم المستخد اكثر من 3 احرف';
                        } else {
                          return null;
                        }
                      },
                      controller: name,
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'alaa',
                    ),
                  ),
                  Text(
                    'انشاء كلمة المرور',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 90,
                    child: AuthTextField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "هذه الخانة مطلوبه";
                        } else if (value.length < 8) {
                          return 'يجب ان لا تقل كلمه السر عن 8 أحرف أو ارقام';
                        } else {
                          return null;
                        }
                      },
                      controller: password,
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'لا يقل عن 8 أحرف أو ارقام',
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().register(
                              name: name.text,
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
                              'انشاء حساب',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
