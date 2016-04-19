extends Node2D

var chartboost

func _ready():
	if(Globals.has_singleton("MamauChartboost")):
		chartboost = Globals.get_singleton("MamauChartboost")
		chartboost.init(Globals.get("mamau_chartboost/app_id"), Globals.get("mamau_chartboost/app_signature"))

# Interstitial
func _on_chache_interstitial_pressed():
	if(chartboost != null):
		chartboost.cache_interstitial()

func _on_has_interstitial_pressed():
	if(chartboost != null):
		var result = chartboost.has_interstitial()
		get_node("HasInterstitial").set_text("Has Interstitial: " + str(result))
		
func _on_show_interstitial_pressed():
	if(chartboost != null):
		chartboost.show_interstitial()


# Reward video
func _on_cache_reward_video_pressed():
	if(chartboost != null):
		chartboost.cache_reward_video()


func _on_has_reward_video_pressed():
	if(chartboost != null):
		var result = chartboost.has_reward_video()
		get_node("HasRewardVideo").set_text("Has Reward Video: " + str(result))


func _on_show_reward_video_pressed():
	if(chartboost != null):
		chartboost.show_reward_video()


# More Apps
func _on_cache_more_apps_pressed():
	if(chartboost != null):
		chartboost.cache_more_apps()

func _on_has_more_apps_pressed():
	if(chartboost != null):
		var result = chartboost.has_more_apps()
		get_node("HasMoreApps").set_text("Has More Apps: " + str(result))

func _on_show_more_apps_pressed():
	if(chartboost != null):
		chartboost.show_more_apps()
