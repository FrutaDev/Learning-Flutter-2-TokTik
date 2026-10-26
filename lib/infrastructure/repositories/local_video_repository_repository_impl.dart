

import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';

import '../../domain/repositories/video_posts_repository.dart';

class LocalVideoRepositoryRepositoryImpl implements VideoPostsRepository {

  final VideoPostsDatasource videoPostsDatasource;

  LocalVideoRepositoryRepositoryImpl({
    required this.videoPostsDatasource
  });

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoPostsDatasource.getTrendingVideosByPage(page);
  }
}