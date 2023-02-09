import 'package:dio/dio.dart';
import 'package:photo_revive/app/constants.dart';
import 'package:photo_revive/data/responses/responses.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("/home")
  Future<HomeResponse> getHome();
}
