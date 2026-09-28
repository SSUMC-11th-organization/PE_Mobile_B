import 'package:flutter/material.dart';
import 'package:jay/theme/app_colors.dart';
import 'package:jay/widgets/mock_movie.dart';

class GenreFilterSheet extends StatefulWidget {
  const GenreFilterSheet({
    super.key,
    required this.scrollController,
    required this.initialGenres,
  });

  final ScrollController scrollController;
  final Set<String> initialGenres;

  @override
  State<GenreFilterSheet> createState() => _GenreFilterSheetState();
}

class _GenreFilterSheetState extends State<GenreFilterSheet> {
  late Set<String> checkedGenre;
  final genreList = genres.skip(1).toList();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkedGenre = {...widget.initialGenres};
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            controller: widget.scrollController,
            itemCount: genreList.length,
            itemBuilder: (context, index) {
              final genre = genreList[index];
              return CheckboxListTile(
                title: Text(genre),
                value: checkedGenre.contains(genre),
                onChanged: (checked) {
                  setState(() {
                    if (checked == true) {
                      checkedGenre.add(genre);
                    } else {
                      checkedGenre.remove(genre);
                    }
                  });
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.violet,
                foregroundColor: AppColors.white,
              ),
              onPressed: () => Navigator.pop(context, checkedGenre),
              child: const Text('확인'),
            ),
          ),
        ),
      ],
    );
  }
}
