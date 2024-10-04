import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:halaka/widgets/custom_elevated_button.dart';
import 'package:halaka/widgets/custom_text_form_field.dart';
import 'package:intl/intl.dart';
import 'halaka_screen.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('اهلا بكم برجاء تسجيل الدخول',
                  style: TextStyle(fontSize: 18.0)),
              const SizedBox(height: 30.0),
              CustomTextFormField(
                controller: _codeController,
                // labelText: 'labelText',
                keyboardType: TextInputType.number,
                prefixIcon: Icons.lock,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء ادخال الكود الصحيح';
                  }
                  return null;
                },
                labelText: ' كود الطالب', // Save the email value
              ),
              const SizedBox(height: 30.0),
              InkWell(
                child: AbsorbPointer(
                  child: CustomTextFormField(
                    labelText: ' تاريخ ميلاد الطالب',
                    prefixIcon: Icons.calendar_month,
                    controller: _birthdayController,
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value == null || value.isEmpty || value == "") {
                        return 'الرجاء ادخال تاريخ ميلاد الطالب الصحيح';
                      }
                      return null;
                    },
                  ),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1990),
                    lastDate: DateTime.now(),
                  );

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    setState(() {
                      _birthdayController.text = formattedDate;
                    });
                  }
                },
              ),
              const SizedBox(height: 30.0),
              CustomElevatedButton(
                label: 'تسجيل الدخول',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HalakaScreen(),
                      ),
                    );
                  }
                },
                backgroundColor: Colors.green,
                textColor: Colors.white,
                borderRadius: 12.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
