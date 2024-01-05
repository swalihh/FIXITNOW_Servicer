import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:servicer/resources/constants/colors.dart';
import 'package:servicer/resources/constants/fonts.dart';

class BookingItemWidget extends StatelessWidget {
  final String name;
  final String phone;
  final String location;
  final String date;
  final String description;
  final VoidCallback? onPhoneClicked;
  final VoidCallback? onMarkAsCompleted;
  final bool isloading;

  const BookingItemWidget({
    Key? key,
    required this.name,
    required this.phone,
    required this.location,
    required this.date,
    required this.description,
    this.onPhoneClicked,
    this.onMarkAsCompleted,
    required this.isloading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 196, 196, 196),
        height: 365,
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Appcolor.backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: onPhoneClicked,
                      icon: const Icon(Icons.phone),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text('Name      :', style: TextType.head),
                  Text(name, style: TextType.smallLabels),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text('Phone     :', style: TextType.head),
                  Text(phone, style: TextType.smallLabels),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text('Location :', style: TextType.head),
                  Text(location, style: TextType.smallLabels),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text('Date        :', style: TextType.head),
                  Text(date, style: TextType.smallLabels),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                color: Appcolor.backgroundColor,
                width: double.infinity,
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(description),
                ),
              ),
              const SizedBox(height: 5),
              if (onMarkAsCompleted != null)
                CustomAcceptedElevatedButton(
                  onPressed: onMarkAsCompleted!,
                  buttonText: 'Mark as Completed',isloading: isloading,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAcceptedElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final bool isloading;
  const CustomAcceptedElevatedButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    required this.isloading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Appcolor.success,
      ),
      child: isloading
          ? LoadingAnimationWidget.prograssiveDots(
              color: Colors.white, size: 20)
          : Text(buttonText),
    );
  }
}
