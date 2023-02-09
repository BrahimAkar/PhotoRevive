import 'package:dartz/dartz.dart';
import 'package:photo_revive/data/network/failure.dart';

import 'package:photo_revive/domain/models/home_models.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeObject>> getHomeData();
}
