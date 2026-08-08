import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leoclinic_flutter/core/utils/app_colors.dart';
import '../widgets/app_text_button.dart';
import '../widgets/app_text_form_field.dart';
import 'login_screen.dart';



class SignupScreen extends StatefulWidget {

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  bool isConfirmPasswordObscure = true;
  bool isTermsAccepted = false;
String? selectedRole = "Patient";
class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Stack(
        children: [
          Container(
            height: 812,
            color: MyColors.background,
          ),
            Positioned(
                top: 66,
                left: 37,
                child: Image.asset("assets/images/Group2.png")),
          Positioned(
              top: 145,
              child: Image.asset("assets/images/Rectangle.png")),
          Padding(padding: EdgeInsets.fromLTRB(20.w, 200.h, 20.w, 0),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text("Signup",style: TextStyle(color: MyColors.textPrimary,fontSize: 28,fontWeight: FontWeight.w600),),
                SizedBox(height: 14.h,),
                Text("Create your account.",style: TextStyle(color: MyColors.textPrimary,fontSize: 16,fontWeight: FontWeight.w400),),
                SizedBox(height: 22.h,),
                 Form(
                     key: formKey,
                     child: Column(
                   children: [
                     Row(
                       children: [
                         SizedBox(
                           width: 164.w,
                           height: 40.h,
                           child: AppTextFormField(hintText: "First Name"),
                         ),
                         Spacer(),
                         SizedBox(
                           width: 164.w,
                           height: 40.h,
                           child: AppTextFormField(hintText: "Last Name"),
                         )
                       ],
                     ),
                     SizedBox(height: 27.h,),
                     Row(
                       children: [
                         SizedBox(
                           width: 164.w,
                           height: 40.h,
                           child: AppTextFormField(hintText: "Email"),
                         ),
                         Spacer(),
                         SizedBox(
                           width: 164.w,
                           height: 40.h,
                           child: AppTextFormField(hintText: "Phone Number"),
                         )
                       ],
                     ),
                     SizedBox(height: 22.h,),
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
                     AppTextFormField(hintText: "Confirm Password",
                       isObscureText: isConfirmPasswordObscure,
                       suffixIcon: GestureDetector(
                         onTap: (){
                           setState(() {
                             isConfirmPasswordObscure = !isConfirmPasswordObscure;
                           });
                         },
                         child: Icon(isConfirmPasswordObscure ? Icons.visibility_off : Icons.visibility,size: 24,),
                       ),
                     ),
                     SizedBox(height: 16.h,),
                     Row(
                       mainAxisAlignment:MainAxisAlignment.start,
                       children: [
                         Checkbox(value: isTermsAccepted, onChanged: (value){
                           setState(() {
                             isTermsAccepted = value!;
                           });
                         }),
                         RichText(text: TextSpan(
                             children: [
                               TextSpan(text: "I agree to all the ",style: TextStyle(color: MyColors.textPrimary,fontSize: 16,fontWeight: FontWeight.w400)),
                               TextSpan(text: "Terms ",style: TextStyle(color: MyColors.textPrimary,fontSize: 16,fontWeight: FontWeight.w600, ),),
                               TextSpan(text: "and ",style: TextStyle(color: MyColors.textPrimary,fontSize: 16,fontWeight: FontWeight.w400, ),),
                               TextSpan(text:"Privacy Policies" ,style: TextStyle(color: MyColors.textPrimary,fontSize: 16,fontWeight: FontWeight.w600, ),)
                             ]
                         )),
                       ],
                     ),
                     SizedBox(height: 16.h,),
                     AppTextButton(backgroundColor: MyColors.backgroundCard,buttonText: "Sign up",
                         textStyle: TextStyle(color: MyColors.textCard,fontSize: 16,fontWeight: FontWeight.w500), onPressed: (){}),
                     SizedBox(height: 16),
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
                       children: [Text("Already have an account? "), GestureDetector(onTap: () {
                         Navigator.push(context,
                           MaterialPageRoute(builder: (context) => const LoginScreen(),),);},
                         child: Text(
                           "Login",
                           style: TextStyle(
                             color: MyColors.backgroundCard,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                       ),
                       ],
                     ),

                   ],

                 )),
                 ],
               ),
            ),
          ),
        ],
      ),
    );
  }
}
