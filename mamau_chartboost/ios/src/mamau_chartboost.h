#ifndef MAMAUCHARTBOOST_H
#define MAMAUCHARTBOOST_H

#include "reference.h"

class MamauChartboost : public Reference {
    OBJ_TYPE(MamauChartboost,Reference);

    static void _bind_methods();
    static MamauChartboost* instance;

    bool initialized;

public:
    void init(String app_id, String app_signature);

    void cacheInterstitial();
    bool hasInterstitial();
    void showInterstitial();
    void cacheMoreApps();
    bool hasMoreApps();
    void showMoreApps();
    void cacheRewardVideo();
    bool hasRewardVideo();
    void showRewardVideo();

    MamauChartboost();
    ~MamauChartboost();
};

#endif
