import 'package:edge_reward_wizard_cli/configs_handler.dart';
import 'dart:async';
import 'dart:io';

Map appConfigs = {};
List<String> urls = [];

void main(List<String> arguments) {
  showWelcomeMessage();
  getConfigs().then((configs) {
    appConfigs = configs;
    appConfigs['urls'].forEach((urlLabel, url) {
      urls.add(url);
    });
    queue();
  }).onError((error, stackTrace) {
    print(error);
  });
}

queue() async {
  for (String url in urls) {
    print('Waiting ${appConfigs['waiting_time']} seconds to open the browser tab...');
    sleep(Duration(seconds: appConfigs['waiting_time']));
    await openURL(url);
  }
  print('Total of ${urls.length} tabs are opened successfully.');
}

Future openURL(url) async {
  print('>> Opening "$url" in new browser tab.');
  await Process.run(appConfigs['browser_path'], [url], runInShell: true);
  print('>> "$url" is opened.\n');
}

showWelcomeMessage() {
  print('|--------------------------------------------------------------------|');
  print('|-------- Edge Reward Wizard By Code Devil <me@codedevil.me> --------|');
  print('|--------------------------------------------------------------------|');
  print('|-------- CLI Version 1.0.0 -----------------------------------------|');
  print('|--------------------------------------------------------------------|\n');
}
