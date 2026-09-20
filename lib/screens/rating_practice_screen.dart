import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/rating_input.dart';

class RatingPracticeScreen extends StatefulWidget {
  const RatingPracticeScreen({super.key});

  @override
  State<RatingPracticeScreen> createState() => _RatingPracticeScreenState();
}

class _RatingPracticeScreenState extends State<RatingPracticeScreen> {
  double _rating = 0;

  void _saveRating() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('평점 ${_rating.toInt()}점 저장(임시)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: '평점'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: RatingInput(
                  rating: _rating,
                  onRatingUpdate: (value) {
                    setState(() {
                      _rating = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '선택한 평점: ${_rating.toInt()}',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _rating >= 1 ? _saveRating : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: AppColors.violet,
                  foregroundColor: AppColors.white,
                  disabledBackgroundColor: AppColors.gray.withValues(alpha: 0.3),
                  disabledForegroundColor: AppColors.gray,
                ),
                child: const Text('평점 저장'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
