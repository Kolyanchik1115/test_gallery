import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_simple/domain/entity/photos.dart';
import 'package:gallery_simple/ui/widgets/bloc/photo_bloc.dart';
import 'package:gallery_simple/ui/widgets/photo_card.dart';

class Gallery extends StatelessWidget {
  Gallery({super.key});

  final ScrollController scrollController = ScrollController();
  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context.read<PhotoBloc>().add(LoadEvent());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        List<Photo> photos = [];
        if (state is PhotoLoadedState) {
          photos = state.photos;
        }
        return GridView.builder(
          controller: scrollController,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 0,
            mainAxisSpacing: 50,
          ),
          itemCount: photos.length,
          itemBuilder: (context, index) {
            if (index < photos.length) {
              return PhotoCard(photos[index]);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
