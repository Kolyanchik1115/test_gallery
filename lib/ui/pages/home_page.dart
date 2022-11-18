import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_simple/ui/pages/gallery_page.dart';
import 'package:gallery_simple/ui/widgets/bloc/photo_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhotoBloc>(
      create: (context) => PhotoBloc()..add(LoadEvent()),
      child: const MaterialApp(
        home: GalleryPage(),
      ),
    );
  }
}
