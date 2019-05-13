# MamauChartboost

This is an implementation of the Chartboost Api for the Godot Engine (https://github.com/godotengine/godot)

The module works for both Android and iOS and has been tested with Godot 2.0.2.

Example project can be found in the *mamau_chartboost_example* folder.

## General Setup
1. Add the folder mamau_chartboost to the modules folder.
2. Download and expand the SDK for the platform you would like to use.

## Android
1. From the Android SDK Manager, make sure you have the following installed:
  1. Android Support Repository
  2. Android Suppport Library
  3. Google Repository
2. Add the file chartboost.jar from the SDK to the *android/lib* folder
3. Add the module in the engine.cfg
```
[android]
modules="org/godotengine/godot/MamauChartboost"
```
3. See chartboost.com for required and optional permissions

## iOS
1. Add the Chartboost.Framework from the SDK to the *ios/lib* folder

### Simplify appID and appSignature (Optional)
If using the module on both platforms, it is possible to let Godot take care of
getting the correct appId and appSignature. This can be done by specifying them
in engine.cfg like this:
```
[mamau_chartboost.Android]
app_id="xxxxxxxxxxxxxxxxxxxxxxxx"
app_signature="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

[mamau_chartboost.iOS]
app_id="xxxxxxxxxxxxxxxxxxxxxxxx"
app_signature="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

Then you can initialize Chartboost like this:
```GDScript
var chartboost

if(Globals.has_singleton("MamauChartboost")):
		chartboost = Globals.get_singleton("MamauChartboost")
		chartboost.init(Globals.get("mamau_chartboost/app_id"), Globals.get("mamau_chartboost/app_signature"))
```

### API Reference
```GDScript
void init(String appId, String appSignature) #Always start by calling init

void cache_interstitial()
bool has_interstitial()
void show_interstitial()

void cache_reward_video()
bool has_reward_video()
void show_reward_video()

void cache_more_apps()
bool has_more_apps()
void show_more_apps()

bool get_auto_cache_ads()
void set_auto_cache_ads(bool auto_cache_ads)

void set_should_request_interstitials_in_first_session(bool should_request)
```
