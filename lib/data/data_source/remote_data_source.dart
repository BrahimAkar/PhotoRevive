import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:photo_revive/data/network/app_api.dart';
import 'package:photo_revive/data/network/error_handler.dart';
import 'package:photo_revive/data/network/failure.dart';
import 'package:photo_revive/data/network/network_info.dart';
import 'package:photo_revive/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, HomeResponse>> getHomeData();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient appServiceClient;
  final NetworkInfo networkInfo;

  RemoteDataSourceImpl(
    this.networkInfo,
    this.appServiceClient,
  );

  @override
  Future<Either<Failure, HomeResponse>> getHomeData() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.getHome();
        if (response.status == ApiInternalStatus.success) {
          return Right(response);
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
