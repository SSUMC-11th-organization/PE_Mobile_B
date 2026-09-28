import 'package:flutter/material.dart';

import 'rating.dart';

class RatingDialog extends StatefulWidget {
  const RatingDialog({super.key});

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '영화는 어떠셨나요?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 24),
            MovieRatingInput(
              rating: rating,
              onChanged: (value) {
                setState(() {
                  rating = value;
                });
              },
            ),
            const SizedBox(height: 8),
            Text(rating == 0 ? '별을 눌러 평점을 선택하세요' : '$rating점'),
            const SizedBox(height: 24),
            ElevatedButton(
              // 별점을 고르기 전에는 확인 버튼 비활성화
              onPressed: rating == 0
                  ? null
                  : () => Navigator.pop(context, rating),
              child: const Text('확인'),
            ),
          ],
        ),
      ),
    );
  }
}
