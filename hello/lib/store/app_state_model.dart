import 'package:scoped_model/scoped_model.dart';
import 'model/count_model.dart';

///主数据模型，需要全局使用的数据在这里添加模型
class AppStateModel extends Model with CountModel {
  AppStateModel() {}
}
