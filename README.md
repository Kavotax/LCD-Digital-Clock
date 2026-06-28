# Digital Clock Widget for Dank Material Shell

A retro-styled digital clock widget featuring accurate LCD 7-segment and 14-segment simulation layouts. Built natively for **Dank Material Shell** using Quickshell and tailored for modern Wayland compositors like Niri.

![Digital Clock Widget Layout](https://raw.githubusercontent.com/your-github-username/your-clock-repo/main/screenshot.png)

## Features

* ⏱️ **12/24 Hour Smart Layout**: Easily toggle between standard military time and a true 12-hour digital experience.
* 🎨 **Dual-Layer Custom Colors**: Complete freedom to change the text color and background panel color independently to perfectly match your wallpaper or desktop aesthetic.
* 📐 **Dynamic Corner Radius Slider**: Smoothly morph your widget container between razor-sharp rectangular borders ($0px$) and ultra-smooth modern round panels.
* 🎚️ **Background Opacity**: Set custom transparency matching your preferred workspace density seamlessly.
* 🔲 **Industrial Frame Border**: Optional feature to enable an outer container border. Adjust both the frame thickness and its boundary color right from the settings.

## Installation

### Prerequisites

* **Dank Material Shell** installed and active.
* **DSEG Typography Family** (Included local fallbacks available, or can be installed via system package manager such as `ttf-dseg` on Arch Linux or `fonts-dseg` on Debian/Ubuntu).

### 1. Manual Setup

Clone this repository directly into your local Dank Material Shell user plugins directory:

```bash
cd ~/.config/DankMaterialShell/plugins/
git clone https://github.com/Kavotax/LCD-Digital-Clock.git

```
If the font is not the correct one restart the shell with `dms restart`
