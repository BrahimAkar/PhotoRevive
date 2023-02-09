import 'package:dartz/dartz.dart';
import 'package:photo_revive/data/network/failure.dart';
import 'package:photo_revive/domain/models/home_models.dart';
import 'package:photo_revive/domain/repositories/home_repository.dart';
import 'package:photo_revive/domain/use_cases/base_usecase.dart';

class HomeBaseCase extends BaseUseCase {
  final HomeRepository repository;

  HomeBaseCase(this.repository);

  @override
  Future<Either<Failure, HomeObject>> execute(void input) {
    return repository.getHomeData();
  }
}
