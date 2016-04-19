package org.godotengine.godot;

import android.app.Activity;
import android.util.Log;

import com.chartboost.sdk.CBLocation;
import com.chartboost.sdk.Chartboost;
import com.chartboost.sdk.ChartboostDelegate;
import com.chartboost.sdk.Libraries.CBLogging.Level;

public class MamauChartboost extends Godot.SingletonBase {
    private Activity activity;
    private boolean initialized;

    private static final String TAG = "MamauChartboost";

    public void init(String appID, String appSignature) {
        if(!initialized) {
            final String id = appID;
            final String signature = appSignature;
            activity.runOnUiThread(new Runnable() {
    			public void run() {
                    initOnUiThread(id, signature);
    			}
    		});
        }
    }

    public void cache_interstitial() {
        if(initialized) {
            Chartboost.cacheInterstitial(CBLocation.LOCATION_DEFAULT);
        }
    }

    public boolean has_interstitial() {
        boolean hasInterstitial = false;
        if(initialized) {
            hasInterstitial = Chartboost.hasInterstitial(CBLocation.LOCATION_DEFAULT);
        }
        return hasInterstitial;
    }

    public void show_interstitial() {
        if(initialized) {
            Chartboost.showInterstitial(CBLocation.LOCATION_DEFAULT);
        }
    }

    public void cache_more_apps() {
        if(initialized) {
            Chartboost.cacheMoreApps(CBLocation.LOCATION_DEFAULT);
        }
    }

    public boolean has_more_apps() {
        boolean hasApps = false;
        if(initialized) {
            hasApps = Chartboost.hasMoreApps(CBLocation.LOCATION_DEFAULT);
        }
        return hasApps;
    }

    public void show_more_apps() {
        if(initialized) {
            Chartboost.showMoreApps(CBLocation.LOCATION_DEFAULT);
        }
    }

    public void cache_reward_video() {
        if(initialized) {
            Chartboost.cacheRewardedVideo(CBLocation.LOCATION_DEFAULT);
        }
    }

    public boolean has_reward_video() {
        boolean hasVideo = false;
        if(initialized) {
            hasVideo = Chartboost.hasRewardedVideo(CBLocation.LOCATION_DEFAULT);
        }
        return hasVideo;
    }

    public void show_reward_video() {
        if(initialized) {
            Chartboost.showRewardedVideo(CBLocation.LOCATION_DEFAULT);
        }
    }

    @Override
    protected void onMainPause() {
        if(initialized) {
            Chartboost.onPause(activity);
        }
    }

    @Override
    protected void onMainResume() {
        if(initialized) {
            Chartboost.onResume(activity);
        }
    }

    @Override
    protected void onMainDestroy() {
        if(initialized) {
            Chartboost.onDestroy(activity);
        }
    }

    static public Godot.SingletonBase initialize(Activity p_activity) {
        return new MamauChartboost(p_activity);
    }

    public void initOnUiThread(String appID, String appSignature) {
        Chartboost.startWithAppId(activity, appID, appSignature);
        Chartboost.setLoggingLevel(Level.ALL);
        Chartboost.onCreate(activity);
        Chartboost.onStart(activity);
        initialized = true;
    }

    public MamauChartboost(Activity activity) {
        registerClass("MamauChartboost", new String[] {
                                                    "init",
                                                    "cache_interstitial",
                                                    "has_interstitial",
                                                    "show_interstitial",
                                                    "cache_more_apps",
                                                    "has_more_apps",
                                                    "show_more_apps",
                                                    "cache_reward_video",
                                                    "has_reward_video",
                                                    "show_reward_video" });
        this.activity = activity;
	}
}
