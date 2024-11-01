import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/const_data/app_image.dart';

class BoxSearch extends StatelessWidget {
final  TextEditingController? controller;
 final void Function(String)? onChanged;
  const BoxSearch({super.key, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return    Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(children: [
                      SvgPicture.asset(AppImage.search),
                      SizedBox(width: 5),
                      Expanded(
                        child: TextFormField(
                          controller: controller,
                          onChanged: onChanged,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Search Your Shirt',
                            hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        height: 25,
                        child: VerticalDivider(
                          thickness: 1,
                          color: Color(0xFF707B81).withOpacity(0.5),
                        ),
                      ),
                      SizedBox(width: 5),
                      SvgPicture.asset(AppImage.voice),
                    ]),
                  ),
                );
  }
}