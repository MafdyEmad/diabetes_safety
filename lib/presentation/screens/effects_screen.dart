import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EffectsScreen extends StatelessWidget {
  const EffectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'أعراض واثار مرض السكر',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/side_effects.png',
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
                      'الأعراض:',
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'قد تحدث أعراض داء السكري فجأة. وفي داء السكري من النمط 2، قد تكون الأعراض خفيفة وقد تمر سنوات عديدة قبل أن تُلاحظ.',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      'وقد تشمل أعراض داء السكري ما يلي:',
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
                          'الشعور بالعطش الشديد',
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
                          'زيادة الحاجة إلى التبول على المعتاد',
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
                          'عدم وضوح الرؤية',
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
                          'الشعور بالتعب',
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
                          'فقدان الوزن عن غير قصد.',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    Text(
                        '''ممكن أن يتسبّب داء السكري مع مرور الوقت، في إلحاق الضرر بالأوعية الدموية في القلب والعينين والكلى وفي الأعصاب.
    ويشتد تعرض المصابين بداء السكري للمشكلات الصحية بما في ذلك النوبات القلبية والسكتة الدماغية والفشل الكلوي.
    ويمكن أن يتسبب داء السكري في الفقدان الدائم للبصر نتيجة لتلف الأوعية الدموية في العينين.
    ويصاب العديد من مرضى السكري بمشكلات في أقدامهم بسبب تلف الأعصاب وضعف تدفق الدم. وقد يسبب ذلك قرحاً في القدم وقد يؤدي إلى البت'''),
                    const SizedBox(height: 10),
                    Text(
                      'داء السكري من النمط 1',
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'يتسم داء السكري من النمط 1 (الذي كان يُعرف سابقاً باسم داء السكري المعتمد على الإنسولين أو داء السكري الذي يظهر في مرحلة الشباب أو الطفولة) بنقص في إنتاج الإنسولين، ويقتضي تعاطي الإنسولين يومياً. وفي عام 2017، بلغ مجموع المصابين بداء السكري من النمط 1، 9 ملايين شخص؛ ويعيش معظم هؤلاء في البلدان المرتفعة الدخل. وتُجهل العوامل المسببة لداء السكري من النمط 1، كما تُجهل وسائل الوقاية منه.',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'داء السكري من النمط 2',
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '''يؤثر داء السكري من النمط 2 على كيفية استخدام جسمك للسكر (الغلوكوز) للحصول على الطاقة. ويمنع الجسم من استخدام الإنسولين استخداماً صحيحاً، ما قد يؤدي إلى ارتفاع السكر في الدم إلى مستويات عالية إذا لم يعالج.
    وبمرور الوقت، يمكن أن يسبب داء السكري من النمط 2 ضرراً خطيراً للجسم، ولاسيما الأعصاب والأوعية الدموية.
    وعادة ما يمكن الوقاية من داء السكري من النمط 2. وتشمل العوامل التي تسهم في الإصابة بداء السكري من النمط 2، زيادة الوزن، وعدم ممارسة الرياضة بالقدر الكافي، والعوامل الوراثية.
    ويُعد التشخيص المبكر مهماً لمنع أسوأ آثار داء السكري من النمط 2. وتتمثل أفضل طريقة للكشف المبكر عن داء السكري في إجراء الفحوصات الدورية واختبارات الدم لدى مقدم الرعاية الصحية.
    وقد تكون أعراض داء السكري من النمط 2 خفيفة. وقد تمر عدة سنوات قبل ان تُلاحظ. وقد تكون أعراض هذا النمط مماثلة لأعراض النمط 1، ولكنها لا تظهر بشكل جليّ في كثير من الأحيان. ولذا فقد يُشخّص الداء بعد مرور عدة أعوام على بدء الأعراض، أي بعد حدوث المضاعفات.
    ويعاني أكثر من 95% من مرضى السكري من داء السكري من النمط 2. وكان داء السكري من النمط 2 يسمى في السابق داء السكري "غير المعتمد على الأنسولين" أو "الذي ينشأ بعد البلوغ". وحتى وقت قريب، كان هذا النمط من داء السكري لا يُلاحظ إلا في البالغين، ولكنه صار الآن يصيب الأطفال أيضاً على نحو متزايد.''',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'سكري الحمل',
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '''سكري الحمل هو فرط الغلوكوز في الدم بحيث تزيد قيم غلوكوز الدم عن المستوى الطبيعي ولكنها لا تصل إلى المستوى اللازم لتشخيص داء السكري. ويحدث هذا النمط أثناء الحمل.
    ويزداد احتمال حدوث المضاعفات أثناء الحمل وعند الولادة لدى النساء المصابات بسكري الحمل. ويزداد احتمال الإصابة بداء السكري من النمط 2 في المستقبل لدى هؤلاء النساء وربما لدى أطفالهم.
    ويُشخّص سكري الحمل عن طريق عمليات الفحص قبل الولادة، وليس عن طريق الأعراض المبلغ عنها.
    اختلال تحمّل الغلوكوز واختلال الغلوكوز مع الصيام
    يمثّل اختلال تحمّل الغلوكوز واختلال الغلوكوز مع الصيام حالتين وسيطتين في الانتقال من الحالة الطبيعية إلى الإصابة بداء السكري. والأشخاص المصابون بإحدى هاتين الحالتين معرّضون بشدة للإصابة بداء السكري من النمط 2، رغم أن حدوثه ليس حتمياً.''',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
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
