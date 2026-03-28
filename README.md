# X4 Better Piracy — Updated for X4 8.00

_X4 Foundations mod to improve piracy_

This is a fork of [NomadicBits/x4-Better-piracy](https://github.com/NomadicBits/x4-Better-piracy), which is itself a fork of the original mod by [AlbertoRota](https://github.com/AlbertoRota/x4-Better-piracy). Published with permission from AlbertoRota.

## Compatibility

Compatible with X4 **8.00**. Savegame friendly (both adding and removal).

## What this fork adds

### Bug fixes for X4 8.00
- **`notifications.xml`** — Rewrote XPath selectors from index-based to named selectors, which broke silently in X4 8.00.
- **`conversations.xml`** — Switched from attribute replacement to element replacement for the Surrender dialog, more robust against X4 8.00 internal changes.

### Bug fixes (general)
- **Harass menu entry was indented** instead of left-aligned like all other entries. Fixed by correcting the section type and removing a stray icon field that caused an extra column offset.
- **Harass menu entry no longer appears in fleet selection context** — was showing up when multiple ships were selected via box-select, even though it couldn't be used there.
- **Null-check for `$target`** added in harass menu evaluation to prevent edge-case errors.
- **Raid mission guard restored** — Harass is hidden during active raid missions, preventing potential conflicts with other mods or scenarios that start with a capture mission.

### New config options
Two new options in the in-game settings menu:
- **Harass bailing pilots destroy cargo** (default: off) — Whether fleeing pilots destroy their cargo after a successful harass operation.
- **Combat bailing pilots destroy cargo** (default: off) — Same, but for ships that bail through regular combat.

### Marine KI fixes (from NomadicBits fork, restored)
- Marines no longer orbit the target ship endlessly before boarding.
- Collision response during approach no longer causes marines to get stuck.
- Travel drive is used reliably when approaching the target.

---

## Description

This mod addresses several piracy gameplay aspects in X4 that the original author disliked.

If you want to force some S/M ship to bail or soften an L/XL ship before boarding, right-click it, choose **Harass** and follow the mission steps.

You can configure the mod extensively using the in-game options menu.

## Major features

### Removed `Surrender!` dialog option
The `Surrender!` dialog option has been removed entirely.

### Added `Harass` contextual action
Right-click a ship and choose `Harass` to start a mission. Follow the steps and the ship is yours.

Note: Not all ships can be harassed. Mission ships, plot-critical ships, and other specially flagged ships cannot be captured and will not show the Harass option.

### Create your own pirate gang
Subordinates of the ship you are piloting will smartly participate in the harass operation, helping you while avoiding killing the target.

Tip: Use ships with a lot of shields and prefer high-shield/low-hull damage weapons for maximum effectiveness.

### Create your own pirate fleet
Assign the `Corsair` default order to an experienced pilot (3 stars or more) and they will autonomously harass ships in a sector.

Tip: The _Argon trading station_ in _Hatikvah's Choice I_ is usually full of HOP and ZIA traders — a good spot to start.

### Extensive configuration
More than 20 configuration options to tune the mod to your liking — shield thresholds, hull thresholds, bail chances, pressure timers, crew requirements, and more.

## Minor features

- **Removed ship type penalty** from bail calculations — you are no longer punished for flying a larger ship than your target.
- **Improved bail notification** — a notification in the lower-left corner shows when crew is bailing.
- **Piracy is a crime** — successful piracy now affects your reputation with the target's faction.
- **Stations won't protect fleeing ships** from attackers allied to them.

---

## Credits

- **AlbertoRota** — Original mod author ([x4-Better-piracy](https://github.com/AlbertoRota/x4-Better-piracy))
- **NomadicBits** — Fork with marine KI fixes ([NomadicBits/x4-Better-piracy](https://github.com/NomadicBits/x4-Better-piracy))
- **vx** — Author of `True Capture`, where a lot of inspiration was drawn
- **Kevrlet** — Author of `FixBailChance`, where a lot of inspiration was drawn
- **Gryzli100** — Author of `BetterCapture`, whose notification patching approach was used as a basis for the configurable bail logic
- **SirNukes** — Author of `SirNukes Mod Support APIs`
- **Smashicons** — Author of the image used as thumbnail

---

## Changelog

### 8.00.1 (MalibMods fork)
- Updated for X4 8.00 compatibility (notifications.xml, conversations.xml)
- Fixed Harass menu entry indentation
- Fixed Harass menu entry appearing in fleet selection context
- Restored raid mission guard
- Added null-check for target in menu evaluation
- Added config options for cargo destruction on bail
- Restored marine KI fixes from NomadicBits fork

### 0.12.0
- Updated to use the latest `SirNukes Mod Support APIs` features.
- Updated German texts. (Thank you @LeLeon)
- Ships that participate in a successful harass operation will gain experience.
### 0.11.0
- Created new default order `Corsair`.
- Improved Harass operation logic.
- Improved debug logging.
- Stations will not allow a fleeing ship to dock if the attacker is allied to them.
### 0.10.0
- Subordinates of the player ship will smartly participate in the harass operation.
### 0.9.0
- Improved logic to avoid having boarding pods orbiting ship when using marines to claim a ship.
### 0.8.0
- Travel drive used when marines approach target ship.
### 0.7.0
- Removed boarding pods orbiting ship when using marines to claim a ship.
- Added German translation.
- Added French translation.
### 0.6.0
- Added custom dialog lines during harass operation.
### 0.5.0
- Improved `Harass` vs capital ships.
- Added distance checks.
- Added config options.
### 0.4.0
- Reworked `RightClick -> Harass` code.
- Externalized texts to I18N files (English and Spanish).
### 0.3.0
- Removed `Surrender!` dialog, replaced by `RightClick -> Harass`.
- Added dependency on SirNukes Mod Support APIs.
### 0.2.0
- Forcing a pilot to bail now negatively impacts relations with their faction.
### 0.1.0
- Replaced bail notification with a discrete lower-right corner notification.
- Expanded hull% calculations from 20% to 75%.
### 0.0.0
- Initial release.
