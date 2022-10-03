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

void queue() async {
  print("A total of ${urls.length} URL's are scheduled to open.");
  print("$urls \n");

  for (String url in urls) {
    print('Waiting ${appConfigs['waiting_time']} seconds to open the browser tab...');
    sleep(Duration(seconds: appConfigs['waiting_time']));
    await openURL(url).then((process) {
      print('>> "$url" is opened.\n');
    });
  }
  print('Total of ${urls.length} tabs are opened successfully.');
  print('Hit "Enter" key to exit..');
  stdin.readLineSync();
}

Future openURL(url) async {
  print('>> Opening "$url" in new browser tab.');
  return await Process.run(appConfigs['browser_path'], [url], runInShell: true);
}

void showWelcomeMessage() {
  print('|--------------------------------------------------------------------|');
  print('|------------------------ Edge Reward Wizard ------------------------|');
  print('|--------------------------------------------------------------------|');
  print('|     Edge Reward Wizard will automatically visit ten URLs daily     |');
  print('|                to collect Microsoft Reward points.                 |');
  print('|--------------------------------------------------------------------|');
  print('| Author       : Code Devil <me@codedevil.me>                        |');
  print('| CLI Version  : 1.0.0                                               |');
  print('| License      : MIT                                                 |');
  print('|--------------------------------------------------------------------|\n');
}
