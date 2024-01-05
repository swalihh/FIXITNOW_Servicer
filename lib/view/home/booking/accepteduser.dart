import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicer/bloc/acceptesuser/bloc/acceptedusers_bloc.dart';
import 'package:servicer/bloc/completed/bloc/completed_bloc.dart';
import 'package:servicer/bloc/history/bloc/history_bloc.dart';
import 'package:servicer/resources/widgets/accepted.dart';


// ignore: must_be_immutable
class Accepted extends StatelessWidget {
  Accepted({
    super.key,
  });
  int? tempindex;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AcceptedusersBloc, AcceptedusersState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is FetchAcceptedusersSucessState&&state.acceptedBooking.isNotEmpty) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final userdetails = state.acceptedBooking[index];
                    return BlocConsumer<CompletedBloc, CompletedState>(
                      listener: (context, state) {
                        if (state is CompleteSrtvicerOnpressedLoadingState &&
                            tempindex == index) {
                          isloading = true;
                        } else if (state
                            is CompleteSrtvicerOnpressedErrorState) {
                          isloading = false;
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)));
                        } else if (state
                            is CompleteSrtvicerOnpressedSuccessState && state.index==index) {
                          isloading = false;
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Completed SuccessFully')));
                                  context.read<AcceptedusersBloc>().add(MoveToCompletedEvent());
                                  context.read<HistoryBloc>().add(FetchCompletedDetailsEvent());
                        }
                      },
                      builder: (context, state) {
                        
                          return BookingItemWidget(
                            isloading: isloading,
                            date: userdetails.date!,
                            description: userdetails.description!,
                            location: userdetails.city!,
                            name: userdetails.username!,
                            phone: userdetails.phone!,
                            onMarkAsCompleted: () {
                              Map completed = {
                                "bookingid": userdetails.id,
                                "status": "Completed"
                              };
                              context.read<CompletedBloc>().add(
                                  CompleteServiceSuccessEvent(
                                      status: completed, index));
                            },
                            onPhoneClicked: () {
                             // launchPhoneDialer('9400135069');
                            },
                          );
                
                      },
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 5),
                  itemCount: state.acceptedBooking.length,
                );
              }
              return const Center(
                child: SizedBox(
                  child: Text('Empty !'),
                ),
              );
            }));
  }

  // Future<void> launchPhoneDialer(String contactNumber) async {
  //   final Uri _phoneUri = Uri(scheme: "tel", path: contactNumber);
  //   try {
  //     if (await canLaunch(_phoneUri.toString()))
  //       await launch(_phoneUri.toString());
  //   } catch (error) {
  //     throw ("Cannot dial");
  //   }
  // }
}
