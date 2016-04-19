#include "register_types.h"
#include "object_type_db.h"
#include "core/globals.h"
#include "ios/src/mamau_chartboost.h"

void register_mamau_chartboost_types() {
    Globals::get_singleton()->add_singleton(Globals::Singleton("MamauChartboost", memnew(MamauChartboost)));
}

void unregister_mamau_chartboost_types() {
}
