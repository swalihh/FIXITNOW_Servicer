import 'package:flutter/material.dart';
import 'package:servicer/resources/constants/colors.dart';
import 'package:servicer/resources/constants/fonts.dart';
import 'package:servicer/resources/strings/homestrings.dart';
import 'package:servicer/resources/widgets/circularavatar.dart';
import 'package:servicer/resources/widgets/customappbar.dart';
import 'package:servicer/resources/widgets/homecontainer.dart';
import 'package:servicer/resources/widgets/labelwidget.dart';
import 'package:servicer/resources/widgets/sizedbox.dart';
import 'package:servicer/resources/widgets/statuscontainer.dart';
import 'package:servicer/view/home/drawer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  Home({super.key});

  final ValueNotifier<int> value = ValueNotifier(0);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();

  void openBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        final Size screenSize = MediaQuery.of(context).size;

        return SizedBox(
            height: screenSize.height * 0.8,
            child: const BottomProfileSheets());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          rightText: HomeString.appNameS,
          backgroundColor: Appcolor.backgroundColor,
          leading: InkWell(
            onTap: openBottomSheet,
            child: const CircularAvatarWidget(
              imagePath: 'assets/images/plumber.jpg',
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenSize.height * 0.18,
                width: screenSize.width,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (value) {
                    widget.value.value = value;
                  },
                  children: [
                    RevenueWidget(
                      monthlyCollection: '2500',
                      monthlyCollectionLabel: HomeString.monthlyCollectionLabel,
                      todayRevenue: '5000',
                      todayRevenueLabel: HomeString.todayRevenueLabel,
                    ),
                    RevenueWidget(
                      monthlyCollection: '25',
                      monthlyCollectionLabel: HomeString.totelBooking,
                      todayRevenue: '10',
                      todayRevenueLabel: HomeString.compleated,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ValueListenableBuilder<int>(
                  valueListenable: widget.value,
                  builder: (context, activeIndex, child) {
                    return AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: 2,
                      effect: const WormEffect(
                        activeDotColor: Appcolor.primerycolor,
                        dotHeight: 10,
                        dotWidth: 10,
                        type: WormType.thinUnderground,
                      ),
                    );
                  },
                ),
              ),
              const TextFieldSpacing(),
              Text(
                HomeString.recentBook,
                style: TextType.labels,
              ),
              const TextFieldSpacing(),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
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
                          const Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomInfoRow(
                                    label: 'Name',
                                    value: 'Muhammed Swalih',
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  CustomInfoRow(
                                    label: 'Phone',
                                    value: '9401135069',
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  CustomInfoRow(
                                    label: 'Location',
                                    value: 'Nilambur',
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  CustomInfoRow(
                                    label: 'Amount',
                                    value: '2000',
                                  ),
                                  SizedBox(
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
                                    const StatusCard(
                                      backgroundColor: Appcolor.success,
                                      text: 'Completed',
                                    ),
                                    Text(
                                      '28/09/2024',
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
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  itemCount: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
