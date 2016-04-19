#include "mamau_chartboost.h"
#import <Chartboost/Chartboost.h>

MamauChartboost* MamauChartboost::instance = NULL;

@interface ChartboostDelegateBridge : NSObject<ChartboostDelegate>
@end

static ChartboostDelegateBridge* s_pDelegateBridge = nil;

void MamauChartboost::init(String app_id, String app_signature)
{
    if(!initialized)
    {
        NSString *nsAppId = [NSString stringWithCString:app_id.utf8().get_data() encoding:NSUTF8StringEncoding];
        NSString *nsAppSignature = [NSString stringWithCString:app_signature.utf8().get_data() encoding:NSUTF8StringEncoding];
        s_pDelegateBridge = [[ChartboostDelegateBridge alloc] init];
        [Chartboost startWithAppId:nsAppId
                    appSignature:nsAppSignature
                    delegate:s_pDelegateBridge];
        initialized = true;
    }
};

void MamauChartboost::cacheInterstitial()
{
    if(initialized)
    {
        [Chartboost cacheInterstitial:CBLocationDefault];
    }
};

bool MamauChartboost::hasInterstitial()
{
    bool result = false;
    if (initialized)
    {
        result = [Chartboost hasInterstitial:CBLocationDefault];
    }
    return result;
};

void MamauChartboost::showInterstitial()
{
    if(initialized)
    {
        [Chartboost showInterstitial:CBLocationDefault];
    }
};

void MamauChartboost::cacheMoreApps()
{
    if(initialized)
    {
        NSLog(@"Cache interstitial");
        [Chartboost cacheMoreApps:CBLocationDefault];
    }
};

bool MamauChartboost::hasMoreApps()
{
    bool result = false;
    if (initialized)
    {
        result = [Chartboost hasMoreApps:CBLocationDefault];
    }
    return result;
};

void MamauChartboost::showMoreApps()
{
    if(initialized)
    {
        [Chartboost showMoreApps:CBLocationDefault];
    }
};

void MamauChartboost::cacheRewardVideo()
{
    if(initialized)
    {
        [Chartboost cacheRewardedVideo:CBLocationDefault];
    }
};

bool MamauChartboost::hasRewardVideo()
{
    bool result = false;
    if (initialized)
    {
        result = [Chartboost hasRewardedVideo:CBLocationDefault];
    }
    return result;
};

void MamauChartboost::showRewardVideo()
{
    if(initialized)
    {
        [Chartboost showRewardedVideo:CBLocationDefault];
    }
};

void MamauChartboost::_bind_methods()
{
    ObjectTypeDB::bind_method(_MD("init"),                  &MamauChartboost::init);
    ObjectTypeDB::bind_method(_MD("cache_interstitial"),    &MamauChartboost::cacheInterstitial);
    ObjectTypeDB::bind_method(_MD("has_interstitial"),      &MamauChartboost::hasInterstitial);
    ObjectTypeDB::bind_method(_MD("show_interstitial"),     &MamauChartboost::showInterstitial);
    ObjectTypeDB::bind_method(_MD("cache_more_apps"),       &MamauChartboost::cacheMoreApps);
    ObjectTypeDB::bind_method(_MD("has_more_apps"),         &MamauChartboost::hasMoreApps);
    ObjectTypeDB::bind_method(_MD("show_more_apps"),        &MamauChartboost::showMoreApps);
    ObjectTypeDB::bind_method(_MD("cache_reward_video"),    &MamauChartboost::cacheRewardVideo);
    ObjectTypeDB::bind_method(_MD("has_reward_video"),      &MamauChartboost::hasRewardVideo);
    ObjectTypeDB::bind_method(_MD("show_reward_video"),     &MamauChartboost::showRewardVideo);
};

MamauChartboost::MamauChartboost()
{
    ERR_FAIL_COND(instance != NULL);
    instance = this;
    initialized = false;
};

MamauChartboost::~MamauChartboost()
{
};

@implementation ChartboostDelegateBridge
@end
