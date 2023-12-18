import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../Text/text.dart';



class BuildDropDownButtonField extends StatelessWidget {

  late double height;
  late double width;
  late List item;
  late var cubit;
  late int num;
  late String hint;
  late String? Function(String?)? valid;


   BuildDropDownButtonField({
    required this.cubit,
     required this.height,
     required this.width,
     required this.hint,
     required this.valid,
     required this.item,
     required this.num,
});
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(

      //alignment: Alignment.centerRight,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      isExpanded: true,
      hint: BuildText(
        text: hint,
        size: 12,
        bold: true,
        color: Colors.grey,

      ),

      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.grey,
        textDirection: TextDirection.ltr,
      ),
      iconSize: 30,
      buttonHeight: height * 0.07,
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),

      dropdownMaxHeight: height * 0.75,
      scrollbarThickness: 10,
      scrollbarAlwaysShow: true,
      scrollbarRadius: Radius.circular(15),
      items: item
          .map((item) => DropdownMenuItem<String>(
        value: item,
        child: BuildText(
         text: item,
         // textDirection: TextDirection.rtl,
          size: 14,
          bold: true,
          color: Colors.grey,
        ),
      ))
          .toList(),
      validator: valid,
      onChanged: (value){

      },
      onSaved: (value) {},
    );
  }
}








