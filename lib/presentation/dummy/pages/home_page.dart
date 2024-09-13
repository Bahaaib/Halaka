import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:halaka/widgets/custom_elevated_button.dart';
import 'package:halaka/widgets/text_form_field_widget.dart';
import 'halaka_screen.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController=TextEditingController();
  final TextEditingController _birthdayController=TextEditingController();

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
              const Text ('اهلا بكم برجاء تسجيل الدخول',
                  style: TextStyle(fontSize: 18.0)),
              const SizedBox(height: 30.0),
              CustomTextFormField(
                controller: _codeController,
                labelText: 'labelText',
                keyboardType: TextInputType.number,
                hintText: 'hintText',
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ) {
                    return 'Please enter right code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30.0),
              CustomTextFormField(
                hintText: 'ادخل تاريخ الميلاد الطالب',
                labelText: 'enter student birthday',
                prefixIcon: Icons.person,
                controller: _birthdayController,
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty || value == "") {
                    return 'Please enter right birthday';
                  }
                  return null;
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
