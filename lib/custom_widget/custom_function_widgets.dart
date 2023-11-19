import 'package:flutter/material.dart';

InputDecoration textFieldInputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.purple)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.purple),
    ),
  );
}

SizedBox customElevatedButton(String title,VoidCallback onTap){
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
        backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
      ),
      child: Text(title.toUpperCase(),style: const TextStyle(color: Colors.white,)),
    ),
  );
}

void pushNavigation(BuildContext context, Widget destinationPage){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>destinationPage));
}

void pushReplacementNavigation(BuildContext context, Widget destinationPage){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>destinationPage));
}

