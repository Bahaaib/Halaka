import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halaka/routing/main_router.gr.dart';
import 'package:halaka/widgets/custom_elevated_button.dart';
import 'package:halaka/widgets/custom_text_form_field.dart';
import 'package:intl/intl.dart';
import 'halaka_screen.dart';
import 'home_page_cubit/home_page_cubit.dart';
import 'home_page_cubit/home_page_state.dart';

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
      body: BlocProvider(
        create: (context) => HomePageCubit(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<HomePageCubit, HomePageState>(
            listener: (context, state) {
              if (state is HomePageSuccessState) {
                context.router.push(const HalakaRoute());

              } else if (state is HomePageErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('اهلا بكم برجاء تسجيل الدخول',
                        style: TextStyle(fontSize: 18.0)),
                    const SizedBox(height: 30.0),
                    CustomTextFormField(
                      controller: _codeController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      prefixIcon: Icons.lock,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء ادخال الكود الصحيح';
                        }
                        return null;
                      },
                      labelText: ' كود الطالب',
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
                            if (value == null || value.isEmpty) {
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
                          locale: const Locale('ar', ''),
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
                          context.read<HomePageCubit>().getStudent( _codeController.text, _birthdayController.text);
                        }
                      },
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      borderRadius: 12.0,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
