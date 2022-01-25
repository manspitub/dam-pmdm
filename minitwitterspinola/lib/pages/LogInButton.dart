import 'package:flutter/material.dart';


class LogInButton extends StatelessWidget {

  final String btnText;
  final Function onbtnPressed;

  const LogInButton({ Key? key, required this.btnText, required this.onbtnPressed}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Colors.blue,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        onPressed: onbtnPressed(),
        minWidth: 200,
        height: 60,
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: 20, 
            color: Colors.white
          ),
        ),

      ),
    );
  }
}