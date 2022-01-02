# | AutoHGFTimer | v.1.0.1 (Initial Release)
![Released January 2022](https://img.shields.io/badge/release%20date-January%202022-purple)
![1.0.1](https://raster.shields.io/badge/version-v1.0.1-blue)
![moonloader](https://img.shields.io/badge/lua-moonloader-orange)
![MIT License](https://img.shields.io/badge/license-MIT-green)
![Requires: sampfuncs, moonloader, inicfg](https://img.shields.io/badge/requires-sampfuncs%20|%20moonloader%20|%20inicfg-red)

<p align="center">
<img src="https://imgur.com/jT9bNVF.png">
</p>

**| AutoHGFTimer |** is a GTA:SA Moonloader modification that automatically alerts you when it is safe to heal after a gunfight. The timer length is defaulted to 11 seconds on first launch and can be changed and saved permanently by the user.

## Requirements
- inicfg
- Moonloader
- Sampfuncs
- **[/pagesize 14]** or higher for display of the **[/ahthelp]** menu
  - ***Note: Don't wanna do this? Fine! - Use*** **[/ahtmini]**

## Installation
Download AutoHGFTimer.lua from the [Latest Releases Page](https://github.com/morimotoindustries/AutoHGFTimer/releases/) and copy to the "moonloader" folder located in your GTA:SA Install Folder. The first time you launch GTA:SA a configuration directory and file will be created for the modification.

### Modification File & Folder Structure
```
AutoHGFTimer.lua
config
    -Masaharu's Config
        --AutoHGFTimer.ini
```

***Note: README.md is not required for the modification to work.***

## Usage
**| AutoHGFTimer |** is automatically enabled when initially installed. It can be disabled using **[/aht]**. You can set the timer length by using **[/ahtchange]**. All settings are permanently saved to a configuration file.

```
/aht - Enable/Disable | AutoHGFTimer |
/ahthelp - Show the help menu.
/ahtmini - Show the mini help menu.
/ahthealth - Set the length after a gunfight. E.g. [/ahtchange 11]
```

- **[/ahtchange]** - Allowed Timer Length - 10 seconds -> 20 seconds

## Contributing
Please contact [Masaharu Morimoto#2302](https://litelink.at/masaharu) through Discord if you would like to contribute to this project. Pull requests are also welcome however, cannot be guaranteed to be added to the official project.

### Bugs, Errors, Bounties
Please contact [Masaharu Morimoto#2302](https://litelink.at/masaharu) through Discord or on the HZRP forums if you encounter any bugs or errors. I am more than willing to check it out for you. Please provide screenshots of the console and your game with chat visible if possible. ***Press "`" to open the console***

If you find a critical bug, ***especially security related***, you will be paid a **minimum** sum of ***$20,000HZRP*** plus a bonus depending on severity.

## Author
- [Masaharu Morimoto](https://litelink.at/masaharu)

### Special Thanks
- [Brad Ringer](https://forums.hzgaming.net/member.php/34885-Brad-Ringer) - Consulting & Boilerplate Only - No Script Use/Design/Implementation/Legal Responsibility or Involvement

## License
[MIT](https://choosealicense.com/licenses/mit/)
