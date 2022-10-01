import 'package:edge_reward_wizard_cli/configs_handler.dart';

Map appConfigs = {};

void main(List<String> arguments) {
  getConfigsFromJsonFile()
      .then((configs) {
        appConfigs = configs;
      })
      .catchError((err) {})
      .whenComplete(() {
        print(appConfigs);
      });
}
