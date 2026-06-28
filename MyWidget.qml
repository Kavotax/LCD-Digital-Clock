pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import qs.Common
import qs.Modules.Plugins

DesktopPluginComponent {
    id: root

    minWidth: 120
    minHeight: 120

    property bool showSeconds: pluginData.showSeconds ?? true
    property bool showDate: pluginData.showDate ?? true
    property real backgroundOpacity: (pluginData.backgroundOpacity ?? 50) / 100
    property color customColor: pluginData.customColor ? pluginData.customColor : Theme.primary
    property color customColorBackground: pluginData.customColorBackground ? pluginData.customColorBackground : Theme.primary
    property real cornerRadius: pluginData.cornerRadius ? pluginData.cornerRadius : 0
    property bool use24Hour: pluginData.use24Hour ?? false
    property int borderWidth: pluginData.borderWidth ?? 0 
    property color borderColor: pluginData.borderColor ?? Theme.outline 

    SystemClock {
        id: systemClock
        precision: root.showSeconds ? SystemClock.Seconds : SystemClock.Minutes
    }

    Rectangle {
        id: background
        anchors.fill: parent
        radius: root.cornerRadius
        color: root.customColorBackground
        opacity: root.backgroundOpacity
        border.width: root.borderWidth
        border.color: root.borderColor
    }

    Loader {
        anchors.fill: parent
        anchors.margins: Theme.spacingM
        sourceComponent: digitalClock
    }

    Component {
        id: digitalClock

        Item {
            id: digitalRoot

            property real timeFontSize: Math.min(width * 0.16, height * (root.showDate ? 0.4 : 0.5))
            property real dateFontSize: Math.max(Theme.fontSizeSmall, timeFontSize * 0.35)

            Row {
                id: timeRow
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: root.showDate ? -digitalRoot.dateFontSize * 0.8 : 0
                spacing: Theme.spacingXS

                Item {
                    width: timeText.implicitWidth
                    height: timeText.implicitHeight

                    Text {
                        anchors.fill: parent
                        text: root.showSeconds ? "88:88:88" : "88:88"
                        font: timeText.font
                        color: root.customColor
                        opacity: 0.15 
                    }

                    Text {
                        id: timeText
                        text: {
                            if (!systemClock.date)
                                return "";
                            let format = root.showSeconds ? "hh:mm:ss" : "hh:mm";
                            if (!root.use24Hour) {
                                let hours = systemClock.date.getHours() % 12;
                                hours = hours ? hours : 12;
                                let mins = systemClock.date.getMinutes().toString().padStart(2, '0');
                                let secs = systemClock.date.getSeconds().toString().padStart(2, '0');
                                return root.showSeconds ? `${hours.toString().padStart(2, '0')}:${mins}:${secs}` : `${hours.toString().padStart(2, '0')}:${mins}`;
                            }
                            return systemClock.date.toLocaleTimeString(Qt.locale(), format);
                        }
                        font.pixelSize: digitalRoot.timeFontSize
                        font.weight: Font.Bold
                        font.family: "DSEG7 Classic"
                        color: root.customColor
                    }
                }

                Item {
                    visible: !root.use24Hour
                    width: amPmText.implicitWidth
                    height: amPmText.implicitHeight
                    anchors.top: parent.top
                    anchors.topMargin: digitalRoot.timeFontSize * 0.1

                    Text {
                        anchors.fill: parent
                        text: "88"
                        font: amPmText.font
                        color: root.customColor
                        opacity: 0.05
                    }

                    Text {
                        id: amPmText
                        text: systemClock.date && systemClock.date.getHours() >= 12 ? "PM" : "AM"
                        font.pixelSize: digitalRoot.timeFontSize * 0.40
                        font.family: "DSEG14 Classic"
                        color: root.customColor
                        verticalAlignment: Text.AlignTop
                    }
                }
            }

            Text {
                id: dateText
                visible: root.showDate
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: timeRow.bottom
                anchors.topMargin: Theme.spacingXS
                text: systemClock.date?.toLocaleDateString(I18n.locale(), "ddd, MMM d") ?? ""
                font.pixelSize: digitalRoot.dateFontSize
                font.family: "DSEG14 Classic"
                color: root.customColor
            }
        }
    }
}
