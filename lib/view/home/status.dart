import 'package:flutter/material.dart';
import 'package:servicer/resources/constants/colors.dart';
import 'package:servicer/view/home/booking/accepteduser.dart';
import 'package:servicer/view/home/booking/requets.dart';

class StatusTab  extends StatelessWidget {
  const StatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Appcolor.primerycolor,
          title: const Text('Bookings',),
          bottom: const TabBar(
            dividerColor: Appcolor.backgroundColor,
            indicatorColor: Appcolor.backgroundColor,
            
            tabs: [
              Tab(text: 'Requests'),
              Tab(text: 'Accepted'),
            ],
          ), 
        ),
        body:  TabBarView(
          
          
          children: [
           Requests(),
           Accepted(),
          ],
        ),
      ),
    );
  }
}
