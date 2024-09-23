import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:manchaha/utils/app_navigation.dart';
import 'package:manchaha/utils/app_route_names.dart';
import 'package:manchaha/utils/style/app_styles.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  SearchFieldState createState() => SearchFieldState();
}

class SearchFieldState extends State<SearchField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  final List<String> _suggestions = [
    "Men - Shirt",
    "Men - T-shirt",
    "Men - Jeans",
    "Men - Jacket",
    "Men - Sweater",
    "Men - Tank Top",
    "Men - Chinos",
    "Men - Cargo Pants",
    "Men - Bomber Jacket",
    "Men - Puffer Jacket",
    "Men - Henley Shirt",
    "Men - Flannel Shirt",
    "Men - Windbreaker",
    "Men - Peacoat",
    "Men - Camisole",
    "Men - Thermal Shirt",
    "Men - Linen Shirt",
    "Men - Casual Blazer",
    "Men - Graphic Tee",
    "Men - Athletic Shorts",
    "Men - Joggers",
    "Men - Rugby Shirt",
    "Men - Utility Jacket",
    "Men - Trench Coat",
    "Men - Tuxedo",
    "Men - Denim Vest",
    "Men - Sweatshirt",
    "Men - Parka",
    "Men - Button-Up Shirt",
    "Men - Field Jacket",
    "Men - Fleece Jacket",
    "Men - Plaid Shirt",
    "Men - Baseball Jacket",
    "Men - Cowl Neck Sweater",
    "Men - Bomber Vest",
  ];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 70.h,
          ),
          child: Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<String>.empty();
              }
              return _suggestions.where((String option) {
                return option
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase());
              });
            },
            fieldViewBuilder:
                (context, controller, focusNode, onEditingComplete) {
              _controller.value = controller.value;
              return TextFormField(
                controller: controller,
                focusNode: focusNode,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                  suffixIcon: _controller.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _controller.clear();
                            setState(
                                () {}); // Rebuild to show/hide the clear button
                          },
                        )
                      : null,
                  hintText: AppStrings.searchTripleDot,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: AppColors.greyD1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: AppColors.greyD1),
                  ),
                ),
                onChanged: (text) {
                  setState(() {});
                },
              );
            },
            onSelected: (String selection) {
              AppNavigation.pushNamed(context, AppRoutes.mesnCollection);
            },
            // suggestions
            optionsViewBuilder: (context, onSelected, options) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  color: AppColors.white,
                  elevation: 2,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width -
                        20.w, // Adjust width as needed
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        final String option = options.elementAt(index);
                        return InkWell(
                          onTap: () {
                            onSelected(option);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                              horizontal: 10.w,
                            ),
                            child: Text(
                              option,
                              style: AppStyles.font18.normal
                                  .colored(AppColors.black30),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
