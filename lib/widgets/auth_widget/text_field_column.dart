import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/const_data/app_color.dart';
import 'custom_text_field.dart';

class TextFieldColumn extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController? nameController;
  final TextEditingController passWordController;
  final bool obscureText;
  final bool isloginScreen;
  final Function()? changeObscureText;
  const TextFieldColumn(
      {super.key,
      required this.emailController,
      this.nameController,
      required this.passWordController,
      required this.obscureText,
      required this.isloginScreen,
      this.changeObscureText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        isloginScreen
            ?SizedBox()  : CustomTextField(
                obscureText: false,
                controller: nameController!,
                hint: 'xxxx',
                label: 'Your Name')
           ,
        CustomTextField(
            obscureText: false,
            controller: emailController,
            hint: 'xyz@gmail.com',
            label: 'Email Address'),
        
        CustomTextField(
            obscureText: obscureText,
            suffixIcon: IconButton(
                onPressed: changeObscureText,
                icon: obscureText
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility)),
            controller: passWordController,
            hint: '*****',
            label: 'Password'),  isloginScreen?     Row(
                children: [
                  Expanded(child: SizedBox()),
                  Text(
                    'PRecovery Password',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Poppins',
                        color: AppColor.subTitleColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ):SizedBox(),
        SizedBox(height: 20),
      ],
    );
  }
}
