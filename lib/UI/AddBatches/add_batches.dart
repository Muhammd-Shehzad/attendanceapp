import 'package:attendanceapp/UI/AddBatches/add_batches_provider.dart';
import 'package:attendanceapp/UI/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AddBatches extends StatefulWidget {
  const AddBatches({super.key});

  @override
  State<AddBatches> createState() => _AddBatchesState();
}

class _AddBatchesState extends State<AddBatches> {
  bool isOpen = false;
  String selectOption = 'Enter Location';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddBatchesProvider(),
      child: Consumer<AddBatchesProvider>(
        builder: (context, model, child) => Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: -80,
                      left: -70,
                      child: Image.asset(
                        'assets/login.png',
                        height: 210.h,
                        width: 230.w,
                      ),
                    ),
                    Positioned(
                      top: 120.h,
                      left: 20.w,
                      right: 20.w,
                      child: Column(
                        children: [
                          Text(
                            'Enter Batch Details',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Enter Batch Name',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            width:
                                350.w, // Matches the width of the TextFormField
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isOpen =
                                          !isOpen; // Toggles dropdown visibility
                                    });
                                  },
                                  child: Container(
                                    height: 50
                                        .h, // Set height to match TextFormField
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          selectOption.isNotEmpty
                                              ? selectOption
                                              : 'Enter Location',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Icon(isOpen
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down),
                                      ],
                                    ),
                                  ),
                                ),
                                if (isOpen)
                                  Container(
                                    width: 310
                                        .w, // Ensure the dropdown matches the parent width
                                    constraints: BoxConstraints(
                                      maxHeight: 90
                                          .h, // Set a max height for the dropdown
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 4,
                                          spreadRadius: 2,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: ListView(
                                      primary: false,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      children: model.location
                                          .map(
                                            (e) => InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectOption =
                                                      e; // Updates selected option
                                                  isOpen =
                                                      false; // Closes the dropdown
                                                });
                                              },
                                              child: Container(
                                                height: 30
                                                    .h, // Ensure each item has the same height
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16.w),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  e,
                                                  style: TextStyle(
                                                      fontSize: 14.sp),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                              ],
                            ),
                          ),

                          // InkWell(
                          //   onTap: () {
                          //     isOpen = !isOpen;
                          //     setState(() {});
                          //   },
                          //   child: Container(
                          //     width: 350.w,
                          //     decoration: BoxDecoration(
                          //       color: Colors.grey[200],
                          //       borderRadius: BorderRadius.circular(30),
                          //     ),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Padding(
                          //           padding: EdgeInsets.symmetric(
                          //               horizontal: 16.w, vertical: 8.h),
                          //           child: Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.spaceBetween,
                          //             children: [
                          //               Text(
                          //                 'Enter Location',
                          //                 style: TextStyle(
                          //                     fontSize: 14.sp,
                          //                     fontWeight: FontWeight.w400),
                          //               ),
                          //               Icon(Icons.keyboard_arrow_down),
                          //             ],
                          //           ),
                          //         ),
                          //         if (isOpen)
                          //           ListView(
                          //             primary: false,
                          //             shrinkWrap: true,
                          //             physics: NeverScrollableScrollPhysics(),
                          //             padding: EdgeInsets.zero,
                          //             children: model.location
                          //                 .map(
                          //                   (e) => Padding(
                          //                     padding: EdgeInsets.symmetric(
                          //                         horizontal: 16.w,
                          //                         vertical: 8.h),
                          //                     child: InkWell(
                          //                       onTap: () {
                          //                         selectOption = e;
                          //                         setState(() {});
                          //                       },
                          //                       child: Text(
                          //                         e,
                          //                         style: TextStyle(
                          //                             fontSize: 14.sp),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 )
                          //                 .toList(),
                          //           ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Enter Number of Students',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Batch Lead Details',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Enter Batch Leader\'s Name',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Enter Batch Leader\'s Mobil',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(HomeScreen());
                            },
                            child: Container(
                              height: 50.h,
                              width: 320.w,
                              decoration: BoxDecoration(
                                color: Color(0xFF5AB7B7),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 607.h,
                      right: 10.w,
                      child: Image.asset(
                        'assets/SplashScrren2.png',
                        height: 80.h,
                        width: 80.w,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
