import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../theme/app_colors.dart';
import '../widgets/common_app_bar.dart';

/// 미니 실습: flutter_rating_bar로 평점 입력 상태 다루기.
class RatingPracticeScreen extends StatefulWidget {
  const RatingPracticeScreen({super.key});

  @override
  State<RatingPracticeScreen> createState() => _RatingPracticeScreenState();
}

class _RatingPracticeScreenState extends State<RatingPracticeScreen> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: '평점 입력', centerTitle: true),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RatingBar.builder(
                initialRating: _rating,
                minRating: 0,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: AppColors.violet),
                onRatingUpdate: (value) => setState(() => _rating = value),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _rating > 0
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('$_rating점으로 저장했어요')),
                        );
                      }
                    : null,
                child: const Text('평점 저장'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
