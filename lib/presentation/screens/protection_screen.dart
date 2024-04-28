import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ProtectionScreen extends StatelessWidget {
  const ProtectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الوقاية والتشخيص والعلاج',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/protection.png',
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الوقاية:',
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '''يُعد تغيير أنماط الحياة أفضل طريقة للوقاية من داء السكري أو تأخير ظهوره.
    وللمساعدة على الوقاية من داء السكري ومضاعفاته ينبغي للأشخاص ما يلي:''',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 10,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'لوصول إلى وزن الجسم الصحي والحفاظ عليه',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 10,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'المعتدل لمدة 30 دقيقة على الأقل يوميا',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    Text(
                      'الإبقاء على النشاط البدني بممارسة النشاط',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 10,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'اتباع نظام غذائي صحي مع الحد من المواد',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    Text(
                      'السكرية والدهون المشبّعة',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 10,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'عدم التدخين.',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'التشخيص والعلاج:',
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '''يمكن تشخيص داء السكري في مراحل مبكّرة بفحص مستوى الغلوكوز في الدم، وهو فحص زهيد التكلفة نسبياً. ويحتاج الأشخاص المصابون بداء السكري من النمط الأول إلى الحقن بالإنسولين للبقاء على قيد الحياة.
    وتتمثل إحدى أهم الطرق لعلاج داء السكري في الحفاظ على نمط الحياة الصحي.
    ويحتاج بعض الأشخاص المصابين بداء السكري إلى تناول الأدوية التي تساعد على التحكم في مستويات السكر في الدم. وقد تشمل هذه الأدوية حقن الأنسولين أو أدوية أخرى. وتتمثل بعض الأمثلة فيما يلي:''',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 10,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'الميتفورمين',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 10,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'السولفونيلوريا',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 10,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'مثبطات الناقلات المشتركة للصوديوم والغلوكوز .',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    Text(
                      '''وفضلاً عن الأدوية اللازمة لخفض مستوى السكر في الدم، عادة ما يحتاج مرضى السكري إلى الأدوية اللازمة لخفض ضغط الدم والستاتينات للحد من مخاطر المضاعفات.
    وقد تنشأ الحاجة إلى مزيد من الرعاية الطبية لمعالجة آثار داء السكري، مثل ما يلي:''',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 10,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'العناية بالقدم لعلاج القرح',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 10,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'الفحص لتحري مرض الكلى وعلاجه',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 10,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'الفحص لتحري اعتلال الشبكية السكري.',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    Text(
                      '(الذي يسبّب العمى) وعلاجه',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      'مزيد من معلومات من منظمة الصحة العالمية:',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    TextButton(
                      onPressed: () async {
                        final url = 'https://www.who.int/ar/news-room/fact-sheets/detail/diabetes';
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      child: Text(
                        'https://www.who.int/ar/news-room/fact-sheets/detail/diabetes',
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
