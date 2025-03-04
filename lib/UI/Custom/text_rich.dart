import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextRich extends StatelessWidget {
  const TextRich({
    super.key,
    this.text1,
    this.text2,
  });
  final text1;
  final text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: text1,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: text2,
                  style: TextStyle(fontSize: 18.sp, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
