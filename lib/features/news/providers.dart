import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/news/data/datasources/remote/news_remote_data_source.dart';
import 'package:sermanos/features/news/data/repositories/news_repository_impl.dart';
import 'package:sermanos/features/news/domain/repositories/news_repository.dart';

import '../../config/providers.dart';

part 'generated/providers.g.dart';

///
/// Data dependencies
///

@Riverpod(keepAlive: true)
NewsRemoteDataSource newsRemoteDataSource(
  NewsRemoteDataSourceRef ref,
) =>
    NewsRemoteDataSourceImpl(
      firebaseDatabaseClient: ref.watch(firebaseDatabaseProvider),
    );

@Riverpod(keepAlive: true)
NewsRepository newsRepository(NewsRepositoryRef ref) => NewsRepositoryImpl(
      newsRemoteDataSource: ref.watch(newsRemoteDataSourceProvider),
    );

///
/// Application dependencies
///
