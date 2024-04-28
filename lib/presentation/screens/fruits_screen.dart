import 'package:diabetes_safety/models/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FruitScreen extends StatelessWidget {
  const FruitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Food> food = [
      Food(
          foodName: 'الجريب فروت',
          description:
              'حوالي 91% من الفاكهة ماء، الجريب فروت غني بفيتامين C، ويحتوي على كمية عالية من الألياف القابلة للذوبان، يشمل الجريب فروت أيضًا نارينجين وهو فلافونويد يعزز حساسية جسمك للإنسولين، تناولي حوالي نصف جريب فروت يوميًا للحفاظ على مستويات السكر في الدم تحت السيطرة.',
          image: 'assets/grapefruit.png'),
      Food(
          foodName: 'الفراولة',
          description:
              'تحتوى الفراولة على الفيتامينات، ومضادات الأكسدة، والألياف التي تساعدك على السيطرة على مرض السكري الخاص بك، بالإضافة إلى ذلك ، تحتوي الفراولة على نسبة قليلة من السكر، ونسبة الكربوهيدرات منخفضة، الفراولة تبقي معدتك ممتلئة ، وتساعدك على تحقيق التوازن بين مستويات السكر في الدم، تناول حوالي ربع كوب من الفراولة يوميًا يمكن أن يكون مفيدًا لمرضى السكر.',
          image: 'assets/strawberry.png'),
      Food(
          foodName: 'البرتقال',
          description:
              'يحتوي على نسبة منخفضة من السكر، يحتوي على نسبة عالية من فيتامين (C) والثيامين، والبرتقال يساعد في الحفاظ على مستويات السكر في الدم في السيطرة عليها، يساعدك البرتقال أيضًا في الحفاظ على وزنك تحت السيطرة، تأخذ البرتقال يوميا للحفاظ على مستوى السكر فى الدم.',
          image: 'assets/orange.png'),
      Food(
          foodName: 'الكمثري',
          description:
              'تحتوى على الكثير من الألياف، والفيتامينات التي تساعد على الحفاظ على مستويات السكر في الدم تحت السيطرة، تعتبر الكمثرى مفيدة للغاية لمرض السكري لأنها تساعد على تحسين حساسية الأنسولين، وانخفاض مستوى السكر في الدم ،يمكنك تناول كمثرى صغيرة يوميًا.',
          image: 'assets/pear.png'),
      Food(
          foodName: 'البرقوق',
          description:
              'بصرف النظر عن كونها منخفضة في السعرات الحرارية، البرقوق مصدر غني بالألياف يجعله ثمرة مثالية لمرضى السكر ومرضى القلب، نظرًا لأن العديد من مرضى السكري يعانون من الإمساك، فهو يساعد على تحسين الجهاز الهضمي، ويعالج الإمساك.',
          image: 'assets/plum.png'),
      Food(
          foodName: 'الكرز',
          description:
              'الكرز غني بفيتامين C، ومضادات الأكسدة، والحديد ، ويحتوى على البيتا كاروتين، والبوتاسيوم، الفولات، الماغنيسيوم والألياف، الكرز مفيد للغاية لمرض السكري، علاوة على ذلك، فإن الكرز مليء بالانثوسيانين التي يعتقد أنها تخفض مستويات السكر في الدم عن طريق زيادة إنتاج الأنسولين بنسبة 50%، يمكن أن تستهلك  كوب من الكرز في يوم مفيد للغاية في السيطرة على مرض السكري.',
          image: 'assets/cherry.png'),
      Food(
          foodName: 'التفاح',
          description:
              'التفاح غنى بفيتامين C، الألياف القابلة للذوبان ومضادات الأكسدة، يمكن أن يساعدك التفاح على السيطرة على مرض السكري، كما أنها تحتوي على البكتين الذي يساعد على إزالة السموم من الجسم وتقليل احتياجات الأنسولين لدى مرضى السكري بنحو 35 %.',
          image: 'assets/apples.png'),
      Food(
          foodName: 'الرمان',
          description:
              'استهلاك هذه الفاكهة مفيد لمرضى السكري، لأنه يساعد على تحسين مستويات السكر في الدم في الجسم. لديها مؤشر نسبة السكر في الدم منخفضة من 18.',
          image: 'assets/pomegranate.png'),
      Food(
        foodName: 'الأناناس',
        description:
            'الاناناس غنية في الخصائص المضادة للفيروسات ومضادة للالتهابات، يمكن أن تستهلك الأناناس من الأفراد الذين يعانون من مرض السكري.',
        image: 'assets/pineapple.png',
      ),
      Food(
        foodName: 'الأفوكادو',
        description:
            ' الدهون الصحية والبوتاسيوم في الأفوكادو يجعلها مفيدة لمرضى السكر، يساعد الأفوكادو أيضًا على خفض مستويات الدهون الثلاثية، والكولسترول الضار في الجسم',
        image: 'assets/avocado.png',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'قسم الفواكة',
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
