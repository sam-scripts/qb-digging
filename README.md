# QB-Core Digging Script

This scripts allows players to dig in the designated area to find configurable items in the config! This script is open source so please change to your liking.

If you have an inqueries or have encountered any issues please message me on discord :) sam7870
## Dependencies

[QB Core]([https://github.com/qbcore-framework/qb-target](https://github.com/qbcore-framework/qb-core)

## Config
```
-- Time To Dig
Config.DigTime = 15000 -- In milliseconds

-- Rewards
Config.Rewards = {
    "steel", 
    "rubber",
    "plastic",
    "metalscrap",
    "iron",
    "aluminum"
}
```

# QB Core Item
Place this inside your QB Core shared file to add the shovel to the server!

```shovel                  = { name = 'shovel', label = 'Shovel', weight = 0, type = 'item', image = 'shovel.png', unique = false, useable = true, shouldClose = true, description = 'Shovel for digging' },```


