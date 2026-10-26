import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

import 'domain/repositories/video_posts_repository.dart';
import 'infrastructure/datasources/local_video_datasource_impl.dart';
import 'infrastructure/repositories/local_video_repository_repository_impl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final VideoPostsRepository videoPostRepositoryImpl = LocalVideoRepositoryRepositoryImpl(videoPostsDatasource: LocalVideoDatasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) => DiscoverProvider(videoPostsRepository: videoPostRepositoryImpl)..loadNextPage()
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TokTik',
        theme: AppTheme().getTheme(),
        home: DiscoverScreen(),
      ),
    );
  }
}
