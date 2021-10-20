import 'package:firstproject/utils/colors.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final IconData icon;
  const CustomButton({ this.title, this.onClick, this.icon}) ;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColors.blue
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
          child: Center(child: Icon(icon,color: MyColors.white,)),
        ),
      ),
    );
  }
}
