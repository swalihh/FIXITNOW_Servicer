import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servicer/bloc/register/register_bloc.dart';
import 'package:servicer/resources/constants/colors.dart';
import 'package:servicer/resources/strings/login0string.dart';
import 'package:servicer/resources/widgets/customappbar.dart';
import 'package:servicer/resources/widgets/description.dart';
import 'package:servicer/resources/widgets/dropdown.dart';
import 'package:servicer/resources/widgets/image_widget.dart';
import 'package:servicer/resources/widgets/loadingbutton.dart';
import 'package:servicer/resources/widgets/signuotextfield.dart';
import 'package:servicer/resources/widgets/sizedbox.dart';
import 'package:servicer/utils/fonts.dart';
import 'package:servicer/utils/image_picker.dart';
import 'package:servicer/utils/validations.dart';
import 'package:servicer/view/signup/waitingpage.dart';

class Registeration extends StatelessWidget {
  Registeration({super.key});
  TextEditingController dropdowncontroller = TextEditingController();
  File? image;
  File? document;
  String? jobtype;
  final fullnamecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  final locationcontroller = TextEditingController();
  final registerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(
            backgroundColor: Appcolor.backgroundColor,
            title: Text(
              Loginstring.register,
              style: TextType.headings,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Form(
                key: registerKey,
                child: Column(
                  children: [
                    SignUpTextField(
                      validator: (p0) => Validations.isEmpty(p0, 'Full name'),
                      label: 'Full Name',
                      labelStyle: TextType.labels,
                      controller: fullnamecontroller,
                    ),
                    const TextFieldSpacing(),
                    DescriptionTextField(
                      validator: (p0) => Validations.isEmpty(p0, 'Description'),
                      controller: descriptioncontroller,
                      label: 'Job Description',
                      labelStyle: TextType.labels,
                      hintText: 'Describe...',
                      maxLength: 500,
                      maxLines: 4,
                    ),
                    const TextFieldSpacing(),
                    DropDownWid(controller: dropdowncontroller,onSelected: (selectedValue) {
    // Do something with the selected value (in this case, update the jobtype variable)
    jobtype = selectedValue;
  },),

                    const TextFieldSpacing(),

                    //---------------------------------------------------------image picking-----------------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(onTap: () async {
                          final document = await ImagePickService()
                              .pickCropImage(
                                  cropAspectRatio: const CropAspectRatio(
                                      ratioX: 16, ratioY: 9),
                                  imageSource: ImageSource.gallery);
                          if (document == null) {
                            return;
                          }
                          // ignore: use_build_context_synchronously
                          context.read<RegisterBloc>().add(DocumentpickedEvent(
                              documentpath: File(document.path)));
                        }, child: BlocBuilder<RegisterBloc, RegisterState>(
                          buildWhen: (previous, current) => current is! RegisterLodingState,
                          builder: (context, state) {
                            if (state is ImagepickedState) {
                              document = state.documentpath;
                              return ImageContainer(
                                imageProvider: document == null
                                    ? null
                                    : FileImage(File(document!.path)),
                                labelText: 'Verification Document',
                              );
                            } else {
                              // ignore: prefer_const_constructors
                              return ImageContainer(
                                labelText: 'Verifiacation Document',
                                childText: ' Add Document',
                              );
                            }
                          },
                        )),

                        InkWell(onTap: () async {
                          final image = await ImagePickService().pickCropImage(
                              cropAspectRatio:
                                  const CropAspectRatio(ratioX: 2.0, ratioY: 3.0),
                              imageSource: ImageSource.gallery);
                          if (image == null) {
                            return;
                          }
                          // ignore: use_build_context_synchronously
                          context.read<RegisterBloc>().add(
                              ImsgepickedEvent(imagepath: File(image.path)));
                        }, child: BlocBuilder<RegisterBloc, RegisterState>(
                          buildWhen: (previous, current) => current is ! RegisterLodingState,
                          builder: (context, state) {
                            
                            if (state is ImagepickedState) {
                              image = state.imagepath;

                              return ImageContainer(
                                imageProvider: image == null
                                    ? null
                                    : FileImage(File(image!.path)),
                                labelText: 'Photo',
                              );
                            } else {
                              return const ImageContainer(
                                labelText: 'photo',
                                childText: 'Add Photo',
                              );
                            }
                          },
                        )),
                      ],
                    ),
                    //------------------------------------------------image picked ------------------------------------------------------------
                    const TextFieldSpacing(),
                    SignUpTextField(
                      validator: (p0) => Validations.isNumber(p0, 'Amount'),
                      controller: amountcontroller,
                      label: 'Amount Per Hour',
                      keyboardType: TextInputType.number,
                      labelStyle: TextType.labels,
                      prefixIcon: const Icon(Icons.currency_rupee),
                    ),
                    const TextFieldSpacing(),
                    SignUpTextField(
                      validator: (p0) => Validations.isEmpty(p0, 'Location'),
                      controller: locationcontroller,
                      label: 'Location',
                      labelStyle: TextType.labels, 
                      prefixIcon: const Icon(Icons.location_on),
                    ),
                    const TextFieldSpacing(),
                    BlocConsumer<RegisterBloc, RegisterState>(
                      listener: (context, state) {
                     //   print(state);
                        if(state is RegisterSuccessState){
                       
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Waiting(),), (route) => false);
                               Flushbar(flushbarPosition: FlushbarPosition.TOP,
                                flushbarStyle: FlushbarStyle.FLOATING,
                            title: Loginstring.success,
                            message:
                                Loginstring.wait,
                            backgroundColor: Appcolor.success,
                            duration: const Duration(seconds: 3),
                            boxShadows: const[
                              BoxShadow(
                                color: Appcolor.success,
                                offset:  Offset(0.0, 2.0),
                                blurRadius: 3.0,
                              )
                            ],
                          ).show(context);
                        }else if(state is RegisterErrorState){
                          Flushbar(
                         title: state.message,
                         backgroundColor: Appcolor.errorcolor,
                         flushbarPosition: FlushbarPosition.TOP,
                         duration: const Duration(seconds: 3),

                          ).show(context);
                  

                        }
                      },
                      builder: (context, state) {
                        bool isloading = state is RegisterLodingState;
                        return Loadingbutton(
                          onPressed: () {
                            if(registerKey.currentState!.validate()){
                            context.read<RegisterBloc>().add(
                                SubmitButtonClickedEvent( 
                                    fullname: fullnamecontroller.text,
                                    description: descriptioncontroller.text,
                                    jobType: jobtype?? dropdowncontroller.text,
                                    amount: amountcontroller.text,
                                    location: locationcontroller.text));
                            }
                          },
                          showloader: isloading,
                          buttonText: 'Submit',
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
