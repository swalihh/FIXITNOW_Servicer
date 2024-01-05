import 'package:flutter/material.dart';
import 'package:servicer/resources/constants/fonts.dart';

class RevenueWidget extends StatelessWidget {
  final String todayRevenue;
  final String monthlyCollection;
  final String todayRevenueLabel;
  final String monthlyCollectionLabel;


  RevenueWidget({
    required this.todayRevenue,
    required this.monthlyCollection,
   required this.todayRevenueLabel,
   required this.monthlyCollectionLabel ,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.shade300,
        image: const DecorationImage(
          image: AssetImage('assets/images/bg1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    todayRevenue,
                    style: TextType.averagewhite,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    todayRevenueLabel,
                    style: TextType.smallWhite
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 2,
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  monthlyCollection,
                  style: TextType.averagewhite,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  monthlyCollectionLabel,
                  style:TextType.smallWhite
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
