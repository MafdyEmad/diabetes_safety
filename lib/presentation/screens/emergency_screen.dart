import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'الطوارئ',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  Image.asset('assets/ambulance.png')
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.warning,
                    color: Colors.red,
                  ),
                  Expanded(
                    child: Text(
                      ' برجاء إضافة جهات الاتصال ذات الاهمية للوصول إليك والمساعده في أسرع وقت ممكن:',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Text(
                'الأسم',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: 75,
                width: double.infinity,
                child: Card(
                  child: Center(
                    child: TextFormField(
                      style: Theme.of(context).textTheme.displayMedium,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'رقم الهاتف',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: 75,
                width: double.infinity,
                child: Card(
                  child: Center(
                    child: TextFormField(
                      style: Theme.of(context).textTheme.displayMedium,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'رسالة',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Center(
                    child: TextFormField(
                      maxLines: null,
                      style: Theme.of(context).textTheme.displayMedium,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  child: SizedBox(
                    height: 65,
                    width: MediaQuery.sizeOf(context).width * .6,
                    child: Card(
                      child: Center(
                        child: Text(
                          'اضافة',
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
    );
  }
}
