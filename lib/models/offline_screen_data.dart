
import 'package:neeraj_flutter_app/models/offline_category_model.dart';

enum OfflineGamePlayType{ONLINE, OFFLINE}

class OfflineScreenData{

  OfflineMainCategoryDetail model;
  OfflineGamePlayType type;

  OfflineScreenData(this.model, this.type);
}