
## 4.2.0
 September 04, 2024
- Introduce initAsync() and getInstance()

## 4.1.0+3
 July 17, 2023
- Up-to-date with plugin, SharedPreferences:
  static bool setPrefix(String prefix, {Set<String>? allowList}) {
- sdk: '>=2.18.0 <4.0.0'
- update LICENSE

## 4.0.0
 December 02, 2022
- static dynamic get(String? key) to static Object? get(String? key)
- sdk: '>=2.18.5 <3.0.0'

## 3.5.0
 March 28, 2022
- Return default value if _prefsInstance is null in production.
- initCalled() true if init() was called.
- ready() true if _prefsInstance is not null.

## 3.4.0+01
 January 22, 2022
- sdk: '>=2.15.1 <3.0.0'
- static Future<SharedPreferences> get INSTANCE
- key parameter can be null.
- Improved example app & integration testing
- include .pubignore

## 3.3.0  Null safety
 March 04, 2021
- Upgraded to Dart SDK 2.12.0
- Migrated the package to null safety thanks to Todd Krokowski

## 3.2.1
 June 04, 2020
- Corrected Apache Licence

## 3.2.0
 April 26, 2020
- Export SharedPreferences

## 3.1.0
 March 13, 2020
- Introduced Prefs.containsKey('key_string') method
- sdk: '>=2.6.0 <3.0.0'

## 3.0.1
 Feb. 03, 2020
- **Important Fix** Return 'default value' in 'Future' Preference calls. (i.e. Prefs.getStringF())

## 3.0.0
 Apr. 23, 2019
- **Breaking Change** Make variable, instance, private with _instance to prevent possible memory leak.

## 2.1.0
 Apr. 22, 2019
- static Future<SharedPreferences> get instance

## 2.0.0
 Apr. 22, 2019
- **New** getter, prefs, for await SharedPreferences.getInstance();
- getter allows for Hot Reload
- Upgrade to shared_preferences 0.5.2

## 1.0.4
 Mar. 16, 2019
- Update the homepage field from pubspec.yaml

## 1.0.3
 Mar. 15, 2019
- sdk: '>=2.1.0 <3.0.0'

## 1.0.2
 Feb. ‎28, 2019
- Flutter format  homepage: in pubspec.yaml

## 1.0.1 
 Feb. ‎28, 2019 
- Provide an example and a test 

## 1.0.0
 Feb. ‎27, 2019
- ‎Initial Library Package Release

## 0.2.0 
 Feb. ‎09, ‎2019
- static Future<SharedPreferences> init() async {

## 0.1.1 
 Dec. ‎24, ‎2018
- Update README.md

## 0.1.0 
 Nov. ‎24, ‎2018
- Update README.md 

## 0.0.1 
 June ‎2, ‎2018
- Initial Release
