import 'package:appwrite/appwrite.dart';

import 'endpoints.dart';

class AppWriteClient{
  AppWriteClient._();

  static final instance = AppWriteClient._();

  Client client = Client()
      .setEndpoint(AppWriteEndpoints.endpoint)
      .setProject(AppWriteEndpoints.projectID);
}