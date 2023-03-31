# work_manager

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

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