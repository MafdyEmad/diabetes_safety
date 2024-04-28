import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'عن التطبيق',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/logo.png'),
            Text(
              'هذا التطبيق هو صحي من أجل متابعة مرض السكر فقد أثبتت دراسات كثيرة أن نجاحك في ضبط سكر الدم من خلال تغير سلوك وعادات حياتك .',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'يساعدك سكرينا  علي تسجيل قراءات سكرك والادوية ومواعيد الطبيب وتنبئ بمرض  السكر وبعض الاطعمة المهمة وغير ذلك.وأيضا يمكن المتابعة مع طبيبك عن طريق التقارير.',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'يمكنك التواصل معانا للاستفسارت او مساعدة عن طريق :',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Row(
              children: [
                const Icon(Icons.email),
                Text(
                  'البريد الالكتروني:diabeticsafety@gmail.com',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.call),
                Text(
                  'واتساب:01551404137',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
