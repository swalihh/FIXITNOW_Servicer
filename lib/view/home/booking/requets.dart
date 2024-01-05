import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:servicer/bloc/acceptesuser/bloc/acceptedusers_bloc.dart';
import 'package:servicer/bloc/getbookings/bloc/bookings_bloc.dart';
import 'package:servicer/bloc/requestApproveandreject/bloc/acceptandreject_bloc.dart';
import 'package:servicer/resources/constants/colors.dart';
import 'package:servicer/resources/constants/fonts.dart';
import 'package:servicer/resources/widgets/alertbox.dart';

class Requests extends StatelessWidget {
  Requests({super.key});
  bool isloading = false;
  bool iserrorloading = false;
  int? tempIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<BookingsBloc, BookingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetAllBookingsFetchSuccessState) {
          if (state.booking.isNotEmpty) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final bookings = state.booking[index];

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: double.infinity,
                      color: const Color.fromARGB(255, 196, 196, 196),
                      height: 320,
                      child: Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('Name      :', style: TextType.head),
                                Text(bookings.username!,
                                    style: TextType.smallLabels),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('Phone     :', style: TextType.head),
                                Text(bookings.phone!,
                                    style: TextType.smallLabels),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('Location :', style: TextType.head),
                                Text(
                                    '${bookings.city!}${bookings.buildingName}',
                                    style: TextType.smallLabels),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('Date        :', style: TextType.head),
                                Text(bookings.date!,
                                    style: TextType.smallLabels),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              color: Appcolor.backgroundColor,
                              width: double.infinity,
                              height: 120,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  bookings.description!,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                BlocConsumer<AcceptandrejectBloc,
                                        AcceptandrejectState>(
                                    listener: (context, state) {
                                  if (state is RejectUserLoadingState) {
                                    iserrorloading = true;
                                  }
                                  if (state is RejectUserErrorState) {
                                    iserrorloading = false;
                                  } else if (state is RejectUserSucessState) {
                                    iserrorloading = false;
                                    context.read<BookingsBloc>().add(
                                          RemoveBooking(id: bookings.id),
                                        );
                                  }
                                }, builder: (context, state) {
                                  return ElevatedButton.icon(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Appcolor.errorcolor)),
                                      onPressed: () {
                                        showDialog( 
                                          context: context,
                                          builder: (context) =>
                                              CustomAlertDialogWidget(
                                            text1: 'Reject Servicer',
                                            text2: 'Do you want to Reject',
                                            text3: 'Cancel',
                                            text4: 'Confirm',
                                            onPressFunction: () {
                                              Map status = {
                                                "bookingid": bookings.id,
                                                "status": "Rejected"
                                              };
                                              context
                                                  .read<AcceptandrejectBloc>()
                                                  .add(RejectEvent(
                                                      status: status,
                                                      index: index));
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.close),
                                      label: iserrorloading &&
                                              tempIndex == index
                                          ? LoadingAnimationWidget
                                              .prograssiveDots(
                                                  color: Colors.white, size: 50)
                                          : const Text('Reject'));
                                }),
                                const SizedBox(
                                  width: 10,
                                ),
                                BlocConsumer<AcceptandrejectBloc,
                                        AcceptandrejectState>(
                                    listener: (context, state) {
                                  if (state is AcceptUserLoadingState) {
                                    isloading = true;
                                  }
                                  if (state is AcceptUserErrorState) {
                                    isloading = false;
                                  } else if (state is AcceptUserSucessState) {
                                    isloading = false;
                                     context.read<BookingsBloc>().add(
                                          RemoveBooking(id: bookings.id),
                                        );
                                        context.read<AcceptedusersBloc>().add(FetchAcceptedUserDetailsEvent());
                                  }
                                }, builder: (context, state) {
                                  return ElevatedButton.icon(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Appcolor.success)),
                                      onPressed: () {
                                        Map status = {
                                          "bookingid": bookings.id,
                                          "status": "Accepted"
                                        };
                                        context.read<AcceptandrejectBloc>().add(
                                            AcceptEvent(
                                                status: status, index: index));

                                                
                                      },
                                      icon: const Icon(Icons.done),
                                      label: isloading && tempIndex == index
                                          ? LoadingAnimationWidget
                                              .prograssiveDots(
                                                  color: Colors.white, size: 50)
                                          : const Text('Accept'));
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                itemCount: state.booking.length);
          }
        }
        return const Center(child: Text('No Request Found!'));
      },
    ));
  }
}
