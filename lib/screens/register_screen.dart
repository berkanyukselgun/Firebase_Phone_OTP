import 'package:country_picker/country_picker.dart';
import 'package:firebase_phone_auth/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();

  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
        TextPosition(offset: phoneController.text.length));

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 199, 246, 236)),
                  child: Image.asset(
                    'assets/register.png',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Add your phone number, We'll send you a verification code",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: const Color.fromARGB(255, 102, 200, 197),
                  controller: phoneController,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  onChanged: (value) {
                    setState(() {
                      phoneController.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Phone Number",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey.shade600),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black12)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                              context: context,
                              countryListTheme: const CountryListThemeData(
                                  bottomSheetHeight: 600),
                              onSelect: (value) {
                                setState(() {
                                  selectedCountry = value;
                                });
                              });
                        },
                        child: Text(
                          "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    suffixIcon: phoneController.text.length > 9
                        ? Container(
                            height: 30,
                            width: 30,
                            margin: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 96, 195, 187),
                            ),
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 20,
                            ),
                          )
                        : null,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    text: "Login",
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
