import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/app_strings.dart';

class WarsModel extends DataModel {
  WarsModel(
      {required super.name, required super.image, required super.description});

  factory WarsModel.formJson(jsonData) {
    return WarsModel(
      name: jsonData[FirebaseStrings.name],
      image: jsonData[FirebaseStrings.image],
      description: jsonData[FirebaseStrings.description],
    );
  }
}
