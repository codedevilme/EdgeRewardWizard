import "dart:io";
import 'dart:convert';

Future<Map> getConfigsFromJsonFile() async {
  String configFilePath = "${Directory.current.path}/Configs.json";
  var configsAsString = await File(configFilePath).readAsString();
  var configsAsMap = jsonDecode(configsAsString);
  return configsAsMap;
}

Future<Map> getConfigs() async {
  Map appConfigs = {};
  await getConfigsFromJsonFile().then((configsFromJsonFile) {
    appConfigs = configsFromJsonFile;
  }).catchError((err) {
    print(err);
  });
  return appConfigs;
}
