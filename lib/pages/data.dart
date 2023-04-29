import 'package:flutter/material.dart';
import 'package:patients_app_task/Api/send_data_to_email.dart';
import 'package:patients_app_task/location/get_location.dart';
import 'package:patients_app_task/widgets/custom_text_field.dart';
import 'package:patients_app_task/widgets/mainButton.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final nameController = TextEditingController();

  @override
  initState() {
    super.initState();

    GetUserLocation.getLocation();
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(33),
            child: SingleChildScrollView(
              child: Form(
                key: formState,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 33,
                    ),
                    CustomTextField(
                      validatorr: (value) {
                        if (value!.isEmpty) {
                          return 'field must be not empty';
                        }
                        return null;
                      },
                      controller: nameController,
                      hinttextt: "Enter your name",
                      isPassword: false,
                      textInputTypee: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    CustomTextField(
                      validatorr: (value) {
                        if (value!.isEmpty) {
                          return 'field must be not empty';
                        }
                        return null;
                      },
                      controller: emailController,
                      hinttextt: "Enter your Email",
                      isPassword: false,
                      textInputTypee: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    CustomTextField(
                      validatorr: (value) {
                        if (value!.isEmpty) {
                          return 'field must be not empty';
                        }
                        return null;
                      },
                      controller: phoneController,
                      hinttextt: "Enter your phone",
                      isPassword: false,
                      textInputTypee: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    MainButton(
                      ontap: () async {
                        await Sendata(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          location: GetUserLocation.usercountry,
                        );
                        if (nameController.text.isNotEmpty ||
                            emailController.text.isNotEmpty ||
                            phoneController.text.isNotEmpty ||
                            nameController.text.length >
                                0 || /*formState.currentState!.validate()||*/
                            emailController.text.length > 0 ||
                            phoneController.text.length > 0) {
                          return Sendata(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            location: GetUserLocation.usercountry,
                          );
                        } else {
                          return null;
                        }
                      },
                      txt: 'Submit',
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
