import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/const_data/app_color.dart';
import '../../../utli/them/app_text_style.dart';
import '../../../widgets/app_bar_icon.dart';
import '../../../widgets/product_card.dart';
import '../../bottom_navigation_bar/view/bottom_navigation_bar_Screen.dart';
import '../controller/search_controller.dart';
import '../widget/box_search.dart';
import '../widget/title_quick_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background_color,
      appBar: AppBar(
        centerTitle: true,
        leading: AppBarIcon(
          onPressed: () => Get.off(BottomNavigationBarScreen()),
          icon: Icon(Icons.arrow_back_ios_sharp,
              size: 15.sp, color: AppColor.blacktext),
        ),
        backgroundColor: AppColor.background_color,
        title: Text('Search', style: AppTextStyle.appStyle),
        actions: [
          SizedBox(width: 10),
          TextButton(
            onPressed: () {
              Get.find<Search_Controller>().clearSearch();
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                  color: AppColor.primarycolor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ),
        ],
      ),
      body: GetBuilder<Search_Controller>(
        init: Search_Controller(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                BoxSearch(
                  controller: controller.searchController,
                  onChanged: (value) => controller.hideQuickSearch(value),
                ),
                SizedBox(height: 15),
                // return search result
                if (controller.isSearchActive) ...[
                  if (controller.list_search.isEmpty)
                    Center(
                      child: Text(
                        'No products found',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )
                  else
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 250.h,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        itemCount: controller.list_search.length,
                        itemBuilder: (context, index) {
                          final product = controller.list_search[index];
                          return ProductCard(product: product);
                        },
                      ),
                    ),
                ] else ...[
                  // quick search
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shirt',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 15),
                      TitleQuickSearch('New T-Shirt', () {
                        controller.selectQuickSearch('New T-Shirt');
                      }),
                      TitleQuickSearch('Top T-Shirt', () {
                        controller.selectQuickSearch('Top T-Shirt');
                      }),
                      TitleQuickSearch('Programmer', () {
                        controller.selectQuickSearch('Programmer');
                      }),
                      TitleQuickSearch('Shirt', () {
                        controller.selectQuickSearch('Shirt');
                      }),
                      TitleQuickSearch(' Black Shirt', () {
                        controller.selectQuickSearch('Black Programmer');
                      }),
                      TitleQuickSearch(' White Shirt', () {
                        controller.selectQuickSearch('White Programmer');
                      }),
                    ],
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
