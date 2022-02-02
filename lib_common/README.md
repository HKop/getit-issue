A simple project that reproduces the issue with getIt. 

Project structure: 
1. getIt_issue main project.
2. **lib_common** library in getIt_issue folder that has components used in the main project.

Note: Issue is only present on **web** in **release** or **profile** mode. 

1. To generate getIt files - "flutter packages pub run build_runner build" in the root getIt_issue folder;
2. Then to run the app on web in profile mode - "flutter run --profile -d chrome --dart-define=Dart2jsOptimization=O0"

