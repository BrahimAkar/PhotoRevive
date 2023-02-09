// class HomeData {
//   List<Service> services;
//   List<BannerAd> banners;
//   List<Store> stores;

//   HomeData(this.services, this.banners, this.stores);
// }

// class HomeObject {
//   HomeData data;

//   HomeObject(this.data);
// }

import 'package:photo_revive/domain/models/ai_model.dart';

class HomeObject {
  final HomeData data;

  HomeObject(this.data);
}

class HomeData {
  final List<AiModel> aiModels;

  HomeData(this.aiModels);
}
