import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
 final void Function()? onTap;
 final Color color;

 final Widget? buttonContent;
  const CustomButton({super.key,  this.onTap, required this.color, this.buttonContent});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(child:buttonContent ),
        ),
      ),
    );
  }
}
