

import 'package:flutter/cupertino.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';
import 'package:toktik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

import '../../infrastructure/models/local_video_model.dart';

class DiscoverProvider extends ChangeNotifier {

  final VideoPostsRepository videoPostsRepository;
  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videoPostsRepository
  });


  Future<void> loadNextPage() async {

    final List<VideoPost> newVideos =
      await videoPostsRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }

}