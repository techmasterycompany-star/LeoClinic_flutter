import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/utils/app_colors.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/pages/forgot%20_password.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/pages/signup_screen.dart';
import 'package:leoclinic_flutter/features/authentication/presentation/widgets/app_text_button.dart';

import '../widgets/app_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  bool rememberDevice = false;
  String? selectedRole = "doctor";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Stack(
        children: [
          Container(
            height: 700.h,
            color: MyColors.background,
          ),
           Positioned(
              top: 30.h,
              left: 75.w,
              child:Image.asset("assets/images/Group.png",height: 210,),),
          Positioned(
            top: 160.h,
            child:Image.asset("assets/images/Rectangle.png"), ),
          Padding(padding: EdgeInsets.fromLTRB( 24.w,235.h,24.w,0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/logo-lockup.png"),
                  SizedBox(height: 12.h,),
                  Text("Login",style: TextStyle(color:MyColors.textPrimary,fontSize: 40,fontWeight: FontWeight.bold),),
                  Text("Welcome back. Please fill in your unique admin login details below.",style: TextStyle(color: MyColors.textPrimary,fontWeight: FontWeight.w400),),
                  SizedBox(height: 18.h,),
                  Form(
                    key: formKey,
                    child: Column(
                      children:[
                        AppTextFormField(hintText: "Email"),
                        SizedBox(height: 16.h,),
                        AppTextFormField(hintText: "Password",
                        isObscureText: isObscureText,
                          suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(isObscureText ? Icons.visibility_off : Icons.visibility,size: 24,),
                          ),
                        ),
                        SizedBox(height: 16.h,),
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(value: rememberDevice, onChanged: (value){
                              setState(() {
                                rememberDevice = value!;
                              });
                            }),
                            const Text("Remember device",style: TextStyle(color:MyColors.textPrimary,fontSize: 14,fontWeight: FontWeight.w600),),
                            Spacer(),
                            GestureDetector(
                              onTap: (){Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const ForgotPassword(),),);},
                              child: Text("Forgot Password?",style: TextStyle(color: MyColors.backgroundCard,fontSize: 14),),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        AppTextButton(backgroundColor: MyColors.backgroundCard,buttonText: "Log in",
                            textStyle: TextStyle(color: MyColors.textCard,fontSize: 16,fontWeight: FontWeight.w500), onPressed: (){}),
                        SizedBox(height: 10),
                        Row(children: [Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text("OR",style: TextStyle(color:MyColors.textSecondary,fontWeight: FontWeight.w500),),),
                            Expanded(child: Divider()),
                          ],
                        ),
                    RadioGroup<String>(
                      groupValue: selectedRole,
                      onChanged: (value) {
                        setState(() {selectedRole = value;});},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [const Text("Doctor", style: TextStyle(fontSize: 16),), const Radio<String>(value: "doctor",),
                          const SizedBox(width: 20),
                          const Text("Patient", style: TextStyle(fontSize: 16),),
                          const Radio<String>(value: "patient",
                          ),
                        ],
                      ),
                    ),
                        AppTextButton(borderWidth: 1.1,buttonWidth: 250,buttonHeight: 18,borderColor: MyColors.textPrimary,
                            buttonText: "Login with Google", textStyle: TextStyle(color:MyColors.textPrimary, fontSize: 16,fontWeight: FontWeight.w500,),
                            icon: Image.asset("assets/images/material-icon-theme_google.png",height: 20.h,width: 20.w,), onPressed: (){}),
                        SizedBox(height: 5),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Don't have an account? "), GestureDetector(onTap: () {
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => const SignupScreen(),),);},
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  color: MyColors.backgroundCard,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

