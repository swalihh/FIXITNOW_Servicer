import 'package:flutter/material.dart';
import 'package:servicer/resources/constants/colors.dart';
import 'package:servicer/view/home/completed.dart';
import 'package:servicer/view/home/request.dart';
import 'package:servicer/view/home/home.dart';

class ScreenParant extends StatefulWidget {
  const ScreenParant({super.key});

  @override
  State<ScreenParant> createState() => _ScreenParantState();
}

class _ScreenParantState extends State<ScreenParant> {
  int currentPage = 0;
  List<Widget> pages = [const Home(), const Requests(), const Completed()];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: pages[currentPage],
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: NavBar(
            pageIndex: currentPage,
            ontap: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        )
      ],
    );
  }
}

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) ontap;
  const NavBar({super.key, required this.pageIndex, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Appcolor.primerycolor,
        ),
        height: 60,
        child: Row(
          children: [
            navItem(Icons.home, pageIndex == 0, ontap: () => ontap(0)),
            navItem(Icons.list_alt, pageIndex == 1, ontap: () => ontap(1)),
            navItem(Icons.checklist, pageIndex == 2, ontap: () => ontap(2)),
          ],
        ),
      ),
    );
  }

  Widget navItem(IconData icon, bool selected, {Function()? ontap}) {
    return Expanded(
        child: InkWell(
      onTap: ontap,
      child: Icon(icon,
          color: selected
              ? const Color.fromARGB(255, 255, 255, 255)
              : Appcolor.backgroundColor.withOpacity(0.5)),
    ));
  }
}
