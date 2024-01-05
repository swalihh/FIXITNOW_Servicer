import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicer/bloc/history/bloc/history_bloc.dart';
import 'package:servicer/resources/constants/colors.dart';
import 'package:servicer/resources/constants/fonts.dart';
import 'package:servicer/resources/widgets/labelwidget.dart';
import 'package:servicer/resources/widgets/statuscontainer.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed'),
        backgroundColor: Appcolor.primerycolor,
        toolbarHeight: screenSize.height * 0.1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<HistoryBloc, HistoryState>(
          listener: (context, state) {
        if(state is FetchCompletedErrorState){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }

          },
          builder: (context, state) {
            if(state is FetchCompletedUserSuccessState){
                return ListView.separated(
                itemBuilder: (context, index) {
                  final data= state.services[index];
                  return Container(
                    constraints: const BoxConstraints(
                      minHeight: 130,
                    ),
                    width: screenSize.width,
                    height: screenSize.height * 0.160,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 195, 195, 195),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                         Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomInfoRow(
                                  label: 'Name',
                                  value: data.username!,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                CustomInfoRow(
                                  label: 'Phone',
                                  value: data.phone!,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                CustomInfoRow(
                                  label: 'Location',
                                  value: data.city!,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                CustomInfoRow(
                                  label: 'Amount',
                                  value: data.serviceAmount!.toString(),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 20, right: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                   StatusCard(
                                    backgroundColor: Appcolor.success,
                                    text: data.status!,
                                  ),
                                  Text(
                                    data.date!,
                                    style: TextType.smallLabels,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: state.services.length);
            }return const Center(child: SizedBox(child: Text('No Completed Bookings...'),));
          
          }
        ),
      ),
    );
  }
}
