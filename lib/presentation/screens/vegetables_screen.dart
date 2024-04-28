import 'package:diabetes_safety/models/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VegetablesScreen extends StatelessWidget {
  const VegetablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Food> food = [
      Food(
          foodName: 'البروكلي',
          description:
              'هو الأنسب لمرضى السكر بسبب احتوائه على نسبة عالية من الألياف وقليلة السعرات الحرارية، إنه غني بفيتامينات A و C. يحتوي البروكلي أيضًا على مركب غني بالكبريت يسمى sulforaphane والذي قد يساعد في تنظيم مستويات السكر في الدم',
          image: 'assets/broccoli.png'),
      Food(
          foodName: 'البامية',
          description:
              'هو الأنسب لمرضى السكر بسبب احتوائه على نسبة عالية من الألياف وقليلة السعرات الحرارية، إنه غني بفيتامينات A و C. يحتوي البروكلي أيضًا على مركب غني بالكبريت يسمى sulforaphane والذي قد يساعد في تنظيم مستويات السكر في الدم (edited)',
          image: 'assets/okra.png'),
      Food(
          foodName: 'الجزر',
          description:
              ' يحتوي الجزر على أحد مضادات الأكسدة التي تسمى بيتا كاروتين والتي تساعد على خفض مستويات الأنسولين في الجسم، كما أنه يحتوي على فيتامين أ الذي يعزز عمل الجهاز المناعي.',
          image: 'assets/carrots.png'),
      Food(
          foodName: 'الفاصوليا',
          description:
              'هي خيار صحي آخر يمكن لمرضى السكر أن يدرجوه في نظامهم الغذائي، وهي مصادر غنية بالحديد والكالسيوم والبوتاسيوم وفيتامين أ وحمض الفوليك والمغنيسيوم، تحتوي الفاصوليا أيضًا على الألياف والبروتين، تعتبر الأطعمة ذات المؤشر الجلايسيمي المنخفض من العناصر المقاومة الطبيعية ضد مرض السكري.',
          image: 'assets/beans.png'),
      Food(
          foodName: 'الكرنب',
          description:
              'هو أفضل طريقة لإضافة الفيتامينات A و K إلى نظام مرضى السكري، كما أنه مصدر غني بالمنجنيز، والألياف، وفيتامين ب 6، يساعد الكرنب على خفض مستويات السكر في الدم في الجسم، ويضمن حسن سير عمل البنكرياس، يقوم البنكرياس بإفراز الإنزيم الحيوي الذي يسمى الأنسولين والذي يتحكم في مستويات السكر في الدم في الجسم.',
          image: 'assets/cabbage.png'),
      Food(
          foodName: 'القرنبيط',
          description:
              'القرنبيط من الخضروات منخفضة الكربوهيدرات، يوفر كمية يومية من فيتامين سي، قد تساعد الكمية الجيدة من الحديد والكالسيوم والألياف بشكل فعال في خفض مستويات السكر في الدم.',
          image: 'assets/cauliflower.png'),
      Food(
          foodName: 'الخيار',
          description:
              'الخيار منخفض الكربوهيدرات لمرضى السكري، يساعدك على مراقبة ارتفاع مستويات السكر في الدم، يعتبر الخيار مصدرًا جيدًا لفيتامين K جنبًا إلى جنب مع البوتاسيوم وفيتامين C.',
          image: 'assets/cucumber.png'),
      Food(
          foodName: 'الطماطم',
          description:
              'تعتبر الطماطم من الأطعمة الفائقة الأخرى لمرض السكري، غنية بفيتامين"C"، وهى مصدر جيد لفيتامين أ والبوتاسيوم والألياف، يجب على مرضى السكر أن يدرجوا الطماطم في نظامهم الغذائي اليومي لمرضى السكري.',
          image: 'assets/tomatoes.png'),
      Food(
          foodName: 'السبانخ',
          description:
              'تعتبر هذه الأوراق الخضراء أيضًا خيارًا ممتازًا لمرضى السكر، لأنها غنية بالماغنيسيوم، والفولات والبوتاسيوم التي تساعد في السيطرة على مرض السكري، من المعروف أن هذه الخضروات الخضراء تقلل بشكل مثير للإعجاب من خطر الإصابة بمرض السكري، الأشخاص الذين يتناولون السبانخ يوميًا ينخفض ​​لديهم خطر الإصابة بمرض السكري بنسبة 20%.',
          image: 'assets/spinach.png'),
      Food(
          foodName: 'الباذنجان',
          description:
              '  هو نبات منخفض الكربوهيدرات، ومنخفض السعرات الحرارية لمرضى السكر، يمكن أن يمنع ارتفاع مستويات السكر في الدم عن طريق تنظيم إنتاج الأنسولين.',
          image: 'assets/eggplant.png'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'قسم الخضراوت',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            thickness: 2,
          ),
          itemCount: food.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(food[index].image),
                ),
                Text(
                  '${index + 1}.${food[index].foodName}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  food[index].description,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
