import "dart:io";
import 'dart:convert';

Future<Map> getConfigsFromJsonFile() async {
  String configFilePath = "${Directory.current.path}/Configs.json";
  var configsAsString = await File(configFilePath).readAsString();
  var configsAsMap = jsonDecode(configsAsString);
  return configsAsMap;
}
