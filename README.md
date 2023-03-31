# work_manager

Project structure
___________________
- Collections folder (holds the Product collection)
    - product.dart
    - product.g.dart
- constants.dart (holds the constants in the project)
- func.dart (holds two functions. apitoisar() imports data to the Isar database. isartoapi() exports data from the Isar database)
- httpServer.dart (holds the http request logic)
- isarProvider.dart (the provider class for the project)
- main.dart (the entry point. Holds the main logic to the Work Manager implementation)

Links
________
https://pub.dev/packages/workmanager
https://medium.com/vrt-digital-studio/flutter-workmanager-81e0cfbd6f6e

Integration to iOS platform requires additional implementation. Looking at sources like:
https://github.com/fluttercommunity/flutter_workmanager/blob/main/IOS_SETUP.md