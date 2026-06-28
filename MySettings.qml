import QtQuick
import qs.Common
import qs.Modules.Plugins

PluginSettings {
    id: root
    pluginId: "digitalClock"

    ToggleSetting {
        settingKey: "showSeconds"
        label: I18n.tr("Show Seconds")
        defaultValue: true
    }

    ToggleSetting {
        settingKey: "showDate"
        label: I18n.tr("Show Date")
        defaultValue: true
    }

    ToggleSetting{
        settingKey: "use24Hour"
        label: I18n.tr("24 Hour Clock")
        defaultValue: false
    }

    SliderSetting {
        settingKey: "backgroundOpacity"
        label: I18n.tr("Background Opacity")
        defaultValue: 50
        minimum: 0
        maximum: 100
        unit: "%"
    }

    SliderSetting {
        settingKey: "cornerRadius"
        label: I18n.tr("Corner Radius")
        defaultValue: 0
        minimum: 0
        maximum: 100
        unit: "%"
    }

    SliderSetting {
        settingKey: "borderWidth"
        label: I18n.tr("Border Width")
        defaultValue: 0
        minimum: 0
        maximum: 10
        unit: "%"
    }

    ColorSetting {
        settingKey: "customColor"
        label: "Custom Text Color"
        description: "Choose a custom color for the text"
    }

    ColorSetting {
        settingKey: "customColorBackground"
        label: "Custom Background Color"
        description: "Choose a custom color for the background"
    }

    ColorSetting {
        settingKey: "borderColor"
        label: "Border Color"
        description: "Choose a custom color for the border"
    }
}
