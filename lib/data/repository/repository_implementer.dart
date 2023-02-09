import 'package:photo_revive/data/data_source/remote_data_source.dart';
import 'package:photo_revive/data/mappers/mapper.dart';
import 'package:photo_revive/data/network/error_handler.dart';
import 'package:photo_revive/data/network/network_info.dart';
import 'package:photo_revive/domain/models/home_models.dart';
import 'package:photo_revive/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:photo_revive/domain/repositories/repository.dart';

class RepositoryImplementer implements Repository {
  final NetworkInfo networkInfo;
  final RemoteDataSource remoteDataSource;

  RepositoryImplementer(this.networkInfo, this.remoteDataSource);

  @override
  Future<Either<Failure, HomeObject>> getHomeData() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getHomeData();
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.defaultError));
        }
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
          ErrorHandler.handle(DataSource.noInternetConnection.getFailure())
              .failure);
    }
  }
}
