import 'package:edge_reward_wizard_cli/configs_handler.dart';

// Map configs = {};

void main(List<String> arguments) {
  getConfigs().then((configs) {
    configs.forEach((key, value) {
      print(value);
    });
  }).onError((error, stackTrace) {
    print(error);
  });
}
