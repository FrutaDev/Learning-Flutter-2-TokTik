

import 'package:flutter/cupertino.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

import '../../infrastructure/models/local_video_model.dart';

class DiscoverProvider extends ChangeNotifier {

  bool initialLoading = true;
  List<VideoPost> videos = [];


  Future<void> loadNextPage() async {

    final List<VideoPost> newVideos = videoPosts.map((video) =>
        LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }

}