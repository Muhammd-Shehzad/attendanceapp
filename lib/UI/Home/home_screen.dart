// import 'package:attendanceapp/UI/Auth/Login/login_screen.dart';
// import 'package:attendanceapp/UI/Custom/bottom_sheet_widget.dart';

// import 'package:attendanceapp/UI/Home/home_screen_provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => HomeScreenProvider(),
//       child: Consumer<HomeScreenProvider>(
//         builder: (context, model, child) => Scaffold(
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       top: -80.h,
//                       left: -70.w,
//                       child: Image.asset(
//                         'assets/login.png',
//                         height: 210.h,
//                         width: 230.w,
//                       ),
//                     ),
//                     Positioned(
//                       top: 60.h,
//                       right: 5.w,
//                       child: InkWell(
//                         onTap: () {
//                           setState(() {
//                             model.showMenu = !model.showMenu;
//                           });
//                         },
//                         child: const Icon(
//                           Icons.more_vert_outlined,
//                           size: 45,
//                           color: Color(0xFF5F6368),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 100.h,
//                       left: 90.w,
//                       right: 10.w,
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           prefixIcon: const Icon(Icons.search),
//                           suffixIcon: const Icon(Icons.close),
//                           hintText: 'Search...',
//                           filled: true,
//                           fillColor: Colors.grey[200],
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 160.h,
//                       left: 140.w,
//                       right: 140.w,
//                       child: Text(
//                         'Batches',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Positioned(
//                       top: 190.h,
//                       left: 20.w,
//                       right: 20.w,
//                       child: FirebaseAnimatedList(
//                           query: model.dbAddBatches,
//                           itemBuilder: (context, snapshot, animation, Index) =>
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Container(
//                                   height: 50.h,
//                                   width: 200.w,
//                                   decoration: BoxDecoration(
//                                     color: const Color.fromARGB(
//                                         255, 160, 218, 212),
//                                     borderRadius: BorderRadius.circular(35),
//                                   ),
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     snapshot
//                                         .child('batchNumber')
//                                         .value
//                                         .toString(),
//                                     style: TextStyle(
//                                         fontSize: 18.sp,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               )),
//                     ),
//                     Positioned(
//                       top: 620.h,
//                       left: 100.w,
//                       right: 100.w,
//                       child: InkWell(
//                         onTap: () {
//                           BottomSheetWidget(context, model);
//                         },
//                         child: CircleAvatar(
//                           radius: 30.r,
//                           backgroundColor: const Color(0xFF5AB7B7),
//                           child: Icon(
//                             Icons.add,
//                             color: Colors.white,
//                             size: 40.sp,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 607.h,
//                       right: 10.w,
//                       child: Image.asset(
//                         'assets/SplashScrren2.png',
//                         height: 80.h,
//                         width: 80.w,
//                       ),
//                     ),
//                     Positioned(
//                       top: 100.h,
//                       right: 5.w,
//                       child: AnimatedContainer(
//                         duration: const Duration(milliseconds: 300),
//                         curve: Curves.easeInOut,
//                         width:
//                             model.showMenu ? 150.w : 0, // Expand/collapse width
//                         height: model.showMenu
//                             ? 100.h
//                             : 0, // Expand/collapse height
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.black26,
//                               blurRadius: 10,
//                               spreadRadius: 1,
//                             ),
//                           ],
//                         ),
//                         child: model.showMenu
//                             ? Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   ListTile(
//                                     onTap: () {
//                                       setState(() {
//                                         model.showMenu = false;
//                                       });
//                                     },
//                                     leading: const Icon(Icons.settings),
//                                     title: const Text('Settings'),
//                                   ),
//                                   ListTile(
//                                     onTap: () {
//                                       setState(() {
//                                         model.showMenu = false;
//                                         model.isLouout();
//                                         Get.off(const LoginScreen());
//                                       });
//                                     },
//                                     leading: const Icon(Icons.logout),
//                                     title: const Text('Logout'),
//                                   ),
//                                 ],
//                               )
//                             : null,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:attendanceapp/UI/Auth/Login/login_screen.dart';
import 'package:attendanceapp/UI/Custom/bottom_sheet_widget.dart';
import 'package:attendanceapp/UI/Custom/button.dart';
import 'package:attendanceapp/UI/Custom/custom_text_form_field.dart';
import 'package:attendanceapp/UI/Custom/toast_popup.dart';
import 'package:attendanceapp/UI/Home/home_screen_provider.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenProvider(),
      child: Consumer<HomeScreenProvider>(
        builder: (context, model, child) => Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: -80.h,
                      left: -70.w,
                      child: Image.asset(
                        'assets/login.png',
                        height: 210.h,
                        width: 230.w,
                      ),
                    ),
                    Positioned(
                      top: 60.h,
                      right: 5.w,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            model.showMenu = !model.showMenu;
                          });
                        },
                        child: const Icon(
                          Icons.more_vert_outlined,
                          size: 45,
                          color: Color(0xFF5F6368),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100.h,
                      left: 90.w,
                      right: 10.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: const Icon(Icons.close),
                          hintText: 'Search...',
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 160.h,
                      left: 140.w,
                      right: 140.w,
                      child: Text(
                        'Batches',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      top: 190.h,
                      left: 20.w,
                      right: 20.w,
                      bottom: 100.h,
                      child: FirebaseAnimatedList(
                        query: model.dbAddBatches,
                        itemBuilder: (context, snapshot, animation, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50.h,
                              width: 200.w,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 160, 218, 212),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                snapshot.child('batchNumber').value.toString(),
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 620.h,
                      left: 100.w,
                      right: 100.w,
                      child: InkWell(
                        onTap: () {
                          // BottomSheetWidget(context, model);
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 500.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Enter Batch Details',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: CustomTextFormField(
                                        hitText: 'Enter Course Name',
                                        keyBoradType: TextInputType.name,
                                        obsText: false,
                                        controller: model.cousreName,
                                        vlaidationText: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please Enter Course Name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: CustomTextFormField(
                                        hitText: 'Enter Batch Number',
                                        keyBoradType: TextInputType.text,
                                        obsText: false,
                                        controller: model.batchNumber,
                                        vlaidationText: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please Enter Batch Number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Button(
                                      onPressed: () {
                                        model.isLoading = true;
                                        Get.back();
                                        String id = DateTime.now()
                                            .microsecondsSinceEpoch
                                            .toString();

                                        model.dbAddBatches.child(id).set({
                                          'courseName': model.cousreName
                                              .toString()
                                              .trim(),
                                          'batchNumber': model.batchNumber
                                              .toString()
                                              .trim(),
                                        }).then((v) {
                                          ToastPopup().toast('Data Added',
                                              Colors.green, Colors.white);
                                          model.cousreName.clear();
                                          model.batchNumber.clear();
                                        }).onError((Eror, v) {
                                          ToastPopup().toast(
                                              Error, Colors.red, Colors.white);
                                        });
                                      },
                                      text: 'Add Batch Number',
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: CircleAvatar(
                          radius: 30.r,
                          backgroundColor: const Color(0xFF5AB7B7),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 40.sp,
                          ),
                        ),
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
                    Positioned(
                      top: 100.h,
                      right: 5.w,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: model.showMenu ? 150.w : 0,
                        height: model.showMenu ? 100.h : 0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: model.showMenu
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    onTap: () {
                                      setState(() {
                                        model.showMenu = false;
                                      });
                                    },
                                    leading: const Icon(Icons.settings),
                                    title: const Text('Settings'),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      setState(() {
                                        model.showMenu = false;
                                        model.isLouout();
                                        Get.off(const LoginScreen());
                                      });
                                    },
                                    leading: const Icon(Icons.logout),
                                    title: const Text('Logout'),
                                  ),
                                ],
                              )
                            : null,
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
