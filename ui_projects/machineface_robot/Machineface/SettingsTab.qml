import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import Machinekit.Controls 1.0
import Machinekit.Application.Controls 1.0

Tab {
    title: qsTr("Settings")

    Rectangle{
        color: colorLightGrey
        ScrollView {
        id: scrollView
        anchors.fill: parent
        anchors.margins: Screen.pixelDensity
        horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
        contentItem:

        ColumnLayout {
            id: column1
            width: scrollView.width - Screen.pixelDensity * 4
            spacing: Screen.pixelDensity

            Label {
                text: qsTr("Digital Read Out")
                font.bold: true
            }

            ToggleSettingCheck {
                groupName: "dro"
                valueName: "showOffsets"
                text: qsTr("Show offsets")
            }

            ToggleSettingCheck {
                id: showVelocityAction
                groupName: "dro"
                valueName: "showVelocity"
                text: qsTr("Show velocity")
            }

            ToggleSettingCheck {
                id: showDistanceToGoAction
                groupName: "dro"
                valueName: "showDistanceToGo"
                text: qsTr("Show distance to go")
            }

            Label {
                text: qsTr("Other")
                font.bold: true
            }

            // temporarily disable preview until it is working in a better way
            ToggleSettingCheck {
                id: enablePreviewAction
                groupName: "preview"
                valueName: "enable"
                text: qsTr("Enable preview")
                visible: checked  // in case preview was accidentally enabled show this check box
            }

            CheckBox {
                id: teleopCheck
                Layout.fillWidth: true
                checked: teleopAction.checked
                text: teleopAction.text
                enabled: teleopAction.enabled
                onClicked: teleopAction.trigger()

                TeleopAction {
                    id: teleopAction
                }
            }

            CheckBox {
                id: overrideLimitsCheck
                Layout.fillWidth: true
                checked: overrideLimitsAction.checked
                text: overrideLimitsAction.text
                onClicked: overrideLimitsAction.trigger()

                OverrideLimitsAction {
                    id: overrideLimitsAction
                }
            }

            MaximumVelocitySlider {
                id: maximumVelocitySlider
            }


        }
    }
}

}



/*##^## Designer {
    D{i:0;autoSize:true;height:702;width:427}
}
 ##^##*/
