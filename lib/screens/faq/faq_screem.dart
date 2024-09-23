import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/style/app_styles.dart';
import '../commons/appbar/paymensts_appbar.dart';
import 'widgets/faq questions/faq_questions.dart';
import 'widgets/searchbar/searchbar_widget.dart';

class FactAndQuestions extends StatefulWidget {
  const FactAndQuestions({super.key});

  @override
  State<FactAndQuestions> createState() => _FactAndQuestionsState();
}

class _FactAndQuestionsState extends State<FactAndQuestions> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PaymentsAppBar(
        title: Text(
          AppStrings.faq,
          style: AppStyles.font24.medium.colored(AppColors.black1F),
        ),
        bgColor: AppColors.white,
        centerTitle: false,
        showBackButton: true,
        elevation: 3,
        shadowColor: AppColors.black0,
        automaticallyImplyLeading: true,
        leadingIconColor: AppColors.black0,
        actions: [
          // Padding(padding: EdgeInsets.symmetric(horizontal: 20.w)),
          Image.asset(
            AppImages.ubell,
            color: AppColors.black1F,
            height: 20.h,
            width: 19.w,
          ),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            const SearchbarWidget(),
            //  FactAndQuestions()
            const FAQWidget(
              question: "What is your return policy?",
              answer:
                  "You can return any product within 30 days of purchase with the original receipt.",
            ),
            SizedBox(height: 20.h,),
            const FAQWidget(
              question: "What is your return policy?",
              answer:
                  "You can return any product within 30 days of purchase with the original receipt.",
            ),
            SizedBox(height: 20.h,),
            const FAQWidget(
              question: "What is your return policy?",
              answer:
                  "You can return any product within 30 days of purchase with the original receipt.",
            ),
            SizedBox(height: 20.h,),
            const FAQWidget(
              question: "What is your return policy?",
              answer:
                  "You can return any product within 30 days of purchase with the original receipt.",
            ),
          ],
        ),
      ),
    );

    //   ],
    // ));
  }
}
