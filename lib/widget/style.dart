import 'package:flutter/material.dart';

ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(20),
      backgroundColor: Colors.redAccent,
      shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
      )
  );
}