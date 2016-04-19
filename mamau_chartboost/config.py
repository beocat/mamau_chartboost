def can_build(plat):
  return plat == "iphone" or plat == "android"

def configure(env):
  if env['platform'] == "android":
    env.android_add_java_dir("android/src")
    env.android_add_to_manifest("android/AndroidManifestChunk.xml")
    env.android_add_dependency("compile files('../../../modules/mamau_chartboost/android/lib//chartboost.jar')")
    env.android_add_dependency("compile 'com.google.android.gms:play-services:4.4.+'")
    env.disable_module()
  elif env['platform'] == "iphone":
    env.Append(FRAMEWORKPATH=['modules/mamau_chartboost/ios/lib'])
    env.Append(LINKFLAGS=['-ObjC', '-framework', 'Chartboost', '-framework', 'AdSupport'])
