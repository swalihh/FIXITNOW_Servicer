import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servicer/resources/strings/login0string.dart';
import 'package:servicer/resources/constants/fonts.dart';

class DropDownWid extends StatefulWidget {
  final Function(String?) onSelected;
  final TextEditingController controller;

  const DropDownWid({super.key, required this.onSelected, required this.controller});

  @override
  State<DropDownWid> createState() => _DropDownWidState();
}

class _DropDownWidState extends State<DropDownWid> {
  String selectedItem = "--choose--";
  String customText = "";
  TextEditingController othersInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final transList = ['Plumber', 'Electrician', 'Cleaning', 'Painting', 'Cooking', 'Others'];

    final TextStyle labelStyle = GoogleFonts.poppins(fontWeight: FontWeight.w600);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          Loginstring.catogory,
          style: TextType.labels,
        ),
        const SizedBox(height: 8),
        CustomDropdown(
          selectedStyle: GoogleFonts.poppins(color: Colors.black),
          hintText: selectedItem,
          hintStyle: GoogleFonts.poppins(),
          items: transList,
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black, width: 1),
          controller: widget.controller,
          excludeSelected: false,
          listItemBuilder: (context, result) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(result, style: labelStyle),
                const Icon(Icons.circle_outlined),
              ],
            );
          },
          onChanged: (dynamic newValue) {
            setState(() {
              selectedItem = newValue;

              if (selectedItem == "Others") {
                customText = "Please specify the service you require:";
                othersInputController.clear();
              } else {
                customText = "";
                othersInputController.text = "";
              }

            });
          },
        ),
        Visibility(
          visible: selectedItem == "Others",
          child: Column(
            children: [
              const SizedBox(height: 8),
              TextField(onChanged: (value) {
                 widget.onSelected(value);
                  
              },
                controller: othersInputController,
                decoration: const InputDecoration(
                  hintText: "Enter service details",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
