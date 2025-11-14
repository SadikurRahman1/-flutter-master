import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/master.dart';
import 'core/network/global_network_controller.dart';
import 'core/network/network_client.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // GetStorage initialize
  await GetStorage.init();

  // Global dependencies
  // Get.put(GlobalNetworkController(client: NetworkClient()));


  runApp(const Master());
}