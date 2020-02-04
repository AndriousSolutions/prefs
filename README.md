# Store and Read Your App’s Preferences
###### A Flutter Example
[![Medium](https://img.shields.io/badge/Medium-Read-green?logo=Medium)](https://medium.com/@greg.perry/a-flutter-class-for-app-preferences-a256166ecc63) [![Pub.dev](https://img.shields.io/pub/v/prefs.svg?logo=data:image/png;base64,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)](https://pub.dev/packages/prefs) [![GitHub stars](https://img.shields.io/github/stars/AndriousSolutions/prefs.svg?style=social&amp;logo=github)](https://github.com/AndriousSolutions/prefs/stargazers)


## What’s Your Preference?
The plugin, [shared_preferences](https://pub.dartlang.org/packages/shared_preferences), is offered to Flutter developers to store and read their app’s 
preferences in both the Android and the iOS platform. It wraps the NSUserDefaults (on iOS) and 
the SharedPreferences (on Android), providing persistent storage. Note, as of this writing, 
the plugin does not guarantee its writes to disk and suggests it not be used for storing 
critical data. As it is, it’s worked for me so far. So much so, I’ve adapted it fully for my apps.

![Prefs Logo](https://user-images.githubusercontent.com/32497443/48974550-90986800-f02a-11e8-921e-4687c666e1a6.png)

## Installing
I don't always like the version number suggested in the '[Installing](https://pub.dev/packages/prefs#-installing-tab-)' page.
Instead, always go up to the '**major**' semantic version number when installing my library packages. This means always entering a version number trailing with two zero, '**.0.0**'. This allows you to take in any '**minor**' versions introducing new features as well as any '**patch**' versions that involves bugfixes. Semantic version numbers are always in this format: **major.minor.patch**. 

1. **patch** - I've made bugfixes
2. **minor** - I've introduced new features
3. **major** - I've essentially made a new app. It's broken backwards-compatibility and has a completely new user experience. You won't get this version until you increment the **major** number in the pubspec.yaml file.

And so, in this case, add this to your package's pubspec.yaml file instead:
```javascript
dependencies:
  prefs:^3.0.0
```
For more information on this topic, read the article, [The importance of semantic versioning](https://medium.com/@xabaras/the-importance-of-semantic-versioning-9b78e8e59bba).

## There’s a Class for That
There’s an example provided by the plugin website demonstrating how the plugin is implemented. 
In my opinion, not the most realistic example as it just promptly displays an integer demonstrating
 the success of its persistent storage. Regardless, I will use this same example now in this 
 article to further demonstrate the use of a class library called, prefs.dart, that I freely 
 offer to other developers to quickly and easily implement stored preferences in their app’s. 
 Here you go, copy the last three lines listed below and place them in your own pubspec.yaml file.
  You’re then on your way to storing preferences in your Flutter app.
  
![pubspec.yaml](https://user-images.githubusercontent.com/32497443/48974510-a0fc1300-f029-11e8-9f36-07ef38249fb3.png)
[pubspec.yaml](https://gist.github.com/Andrious/452d230c0a2cbd1cd058a0fc3ab6d788)
  
Better still, download the file, perfs.dart, as there’s no guarantee that repo.
, perfs.git, will last forever.

This Dart library is under the APACHE license. It’s free! Take it, make it better and then share.

## Take Five
Below is the main.dart file that is very much like the example found in the plugin website. 
However, this file instead uses the class library, prefs.dart, to do much of the ‘heavy lifting’
behind the scenes when it comes to using the plugin. As a result, there are five lines 
in all required to implement and to demonstrate the app’s preferences storage and 
retrieval capabilities.
 
![Take Five](https://user-images.githubusercontent.com/32497443/48974551-9130fe80-f02a-11e8-8774-2f8b29c67960.png) 

## What’s Going On Here
After looking over the code above, there are a few things you will have noticed regarding
 the implementation of the class library. It’s all static function calls for one. 
 Nothing is instantiated. You’d guess right, if you then deduced this is a static class. 
 You won’t find any instance variables or instance methods in this class library. 
 This allows you to more easily implement your app’s preferences anywhere in your app.
  Preferences are an important concern for your app, and so you should be able to reference
   them any time and any where in your app.
   
The only real requirements is that you first initialize the class library in 
the State object’s initState() function, and that you then clean up things 
in the State object’s dispose() function. After that, you are then free to 
call up preferences any time; any where they’re needed in your app.

Therefore, in this example, you see a call to static class function, 
Prefs.init(), to initialize, as it happens, a reference to the plugin, 
shared_preferences, in the State object’s initState() function. 
Correspondingly, you see a call to static class function, Prefs.dispose(), 
in the State object’s dispose() function to then clean things up when the 
app is terminated. Pretty straight forward. You don’t need to be concerned 
with what goes on this those functions — of course, being a free class library,
 you can readily go take a peek.
 
## The Future is Now…or Not
Like the original example in the plugin’s website, 
this example uses a Future object of type Future<int> in a ‘library-private’
 variable called, _counter. Like the original example, this ‘counter’ is 
 assigned a value in the State object’s initState() function. 
 However, you’ll find that, in the original, the code is a little more verbose:
 
![Prefs Logo](https://user-images.githubusercontent.com/32497443/48974552-9130fe80-f02a-11e8-8e48-d817e2097fdd.png) 
 
In our example, the code does the very same thing, but it’s little cleaner:

![Prefs Logo](https://user-images.githubusercontent.com/32497443/48974553-9130fe80-f02a-11e8-8551-ddac578ccdd1.png)  

It too returns a ‘Future’ object of type integer — a value of zero if the ‘counter’
key returns null. Returning null means there is no preference value with that
key as of yet. Above, in the original code, you can determine a Future object
is involved seeing that the callback function, then(), is being utilized. 
In our code, it’s the capital ‘F’ appended on the end of the function’s name 
that gives us the hint. Lastly, like the original code, the function, 
getIntF(), returns a non-null value of zero using the operator, ??, 
but you don’t readily need to know that. 
There’s more encapsulation involved here — keeping some of the operations 
behind the scenes.

In the original example, it takes two lines of code to increment the counter.
A Future object of type integer can not be incremented like a numeric, 
and so we have ‘to wait’ for a ‘SharedPreferences’ object to be instantiated, 
then retrieve a value if any by the key, ‘counter’, and then increment the value by one: 
   
![incrementCounter](https://user-images.githubusercontent.com/32497443/48974554-91c99500-f02a-11e8-8326-b6f053e065c4.png)     
   
In our example, we’ve got it down to one short line of code:

![new increment](https://user-images.githubusercontent.com/32497443/48974555-91c99500-f02a-11e8-9aeb-fba4a5335d37.png) 

Retrieving integer values from your app’s preferences is going to be a common operation.
Best to write a function that repeatedly takes care of the details and, 
like the original code, supplies a value of zero if the provided key returns a null.
You see the function doesn’t return a Future object but an integer.
You can readily tell that by the declaration of the variable, counter,
 as well as by the missing capital ‘F.’
 
## The State of the Counter
Further on in the original example, the setState() function is called
 to ‘update’ the counter on the app’s screen:    
 
![original setState](https://user-images.githubusercontent.com/32497443/48974556-91c99500-f02a-11e8-8812-4ad45fe7fcf3.png)  
 
In our example, you see the code does the very same thing, but this code doesn’t 
require the parent function, _incrementCounter(), to use the async keyword. 
There’s no await command being used. Nor does it reveal that it’s 
‘SharedPerferences’ that’s the means for the persistent storage. 
Instead, you’re allowed to call this function any time; any where. 
Much cleaner and much easier to use.

![new setState](https://user-images.githubusercontent.com/32497443/48974557-91c99500-f02a-11e8-8724-595905c04e2f.png)  

As an aside, note the use of the ‘return’ statement allows you to assign, in this case,
 an integer value to the Future object, _counter. 
 As you see, you can’t assign the integer value directly to a variable,
  _counter, of type Future<int>. 
  
![Future Error](https://user-images.githubusercontent.com/32497443/48974558-91c99500-f02a-11e8-8c0a-14b59c03ec72.png)    
  
## You Get Ten
You can see below all the ‘get’ functions available to the developer when using this class
 library. The first five returns the data type implied in each of the function’s names, 
 while each then has their ‘Future’ counterpart in the remaining five functions.  
 
![Ten Gets](https://user-images.githubusercontent.com/32497443/48974559-91c99500-f02a-11e8-995d-41534678c544.png) 
 
## Here’s the Keys
You’ve access to all the keys that can be found in your preferences.
Like the ‘get’ functions, you have the option to return a ‘Future’ type 
of the set of Strings as well. 

![Get Keys](https://user-images.githubusercontent.com/32497443/48974560-92622b80-f02a-11e8-84dd-9ce2da031bf7.png) 

## Let’s Get Dynamic
If you like, you don’t have to be concerned with the ‘data type’ of the preference 
value and simply call the ‘get’ functions. Again, a ‘Future’ version is available.

![Get Dynamic](https://user-images.githubusercontent.com/32497443/48974561-92622b80-f02a-11e8-8e2c-8c5654592788.png) 

## It’s All Set Up
Along with the first five ‘get’ functions there is a corresponding ‘set’ function.
Each writes a particular data type to persistent storage. 
With a successful write, a Future data type of ‘bool’ is returned.

![Set Functions](https://user-images.githubusercontent.com/32497443/48974562-92622b80-f02a-11e8-898d-ac51886835b1.png) 

## Remove and Clear
You have a means to remove a specific preference and or clear out all the 
preferences with one command. They too return a Future of type, ‘bool.’

![Remove Function](https://user-images.githubusercontent.com/32497443/48974563-92622b80-f02a-11e8-9400-0d9e46b24fea.png) 

## Conclusion
There you have it. Take this class library, and use it for your app’s preferences.
An extensive walkthrough the library package can be found in the Medium article, 
[A Flutter Class for Your App’s Preferences.](https://medium.com/@greg.perry/a-flutter-class-for-app-preferences-a256166ecc63)

##### Other Dart Packages
[![packages](https://user-images.githubusercontent.com/32497443/64993716-5c818280-d89c-11e9-87b5-f35aee3e22f4.jpg)](https://pub.dev/publishers/andrioussolutions.com/packages)
Other Dart packages from the author can also be found at [Pub.dev](https://pub.dev/publishers/andrioussolutions.com/packages)