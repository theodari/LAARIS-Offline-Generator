import QtQuick 2.9
import QtQuick.Window 2.12
//import QtQuick.VirtualKeyboard 2.2
import QtQuick.Controls 2.12
import com.ligen 1.0

Window {
    id: window
    visible: true
    width: 800
    height: 600
    color: "black"
    title: qsTr("LAARIS Offline License Generator")

    LicenseGenerator {
        id: ligen
        onGeneratedTextChanged: generatedLicenseText.text = ligen.generatedText
    }

//    InputPanel {
//        id: inputPanel
//        z: 99
//        x: 0
//        y: window.height
//        width: window.width

//        states: State {
//            name: "visible"
//            when: inputPanel.active
//            PropertyChanges {
//                target: inputPanel
//                y: window.height - inputPanel.height
//            }
//        }
//        transitions: Transition {
//            from: ""
//            to: "visible"
//            reversible: true
//            ParallelAnimation {
//                NumberAnimation {
//                    properties: "y"
//                    duration: 250
//                    easing.type: Easing.InOutQuad
//                }
//            }
//        }
//    } // input panel

    Flow {
        id: theFlow
        anchors.fill: parent
        padding: 8
        spacing: 8

        Text {
            id: nameText
            width: parent.width - 16
            height: 26
            color: "#00FFFF"
            text: qsTr("First & last name")
            font.pixelSize: 16
        }

        Rectangle {
            border.width: 1
            border.color: name.focus ? "#FFFFFF" : "#00FFFF"
            color: name.focus ? "#40FFFFFF" : "transparent"
            width: parent.width - 16
            height: 26
            TextInput {
                id: name
                anchors.fill: parent
                text: qsTr("")
                color: "#FFFFFF"
                font.pixelSize: 16
                cursorVisible: true
                onTextChanged: ligen.name = name.text
                selectByMouse: true
                KeyNavigation.tab: company
                focus: true
                padding: 6
            }
        }

        Text {
            id: companyText
            width: parent.width - 16
            height: 26
            color: "#00FFFF"
            text: qsTr("Company")
            font.pixelSize: 16
        }

        Rectangle {
            border.width: 1
            border.color: company.focus ? "#FFFFFF" : "#00FFFF"
            color: company.focus ? "#40FFFFFF" : "transparent"
            width: parent.width - 16
            height: 26

            TextInput {
                id: company
                anchors.fill: parent
                text: qsTr("")
                color: "#FFFFFF"
                font.pixelSize: 16
                cursorVisible: true
                onTextChanged: ligen.company = company.text
                selectByMouse: true
                KeyNavigation.tab: comboBox
                padding: 6
            }
        }

        Text {
            id: softwareText
            width: parent.width - 16
            height: 26
            color: "#00FFFF"
            text: qsTr("Software")
            font.pixelSize: 16
        }

        ComboBox {
            id: comboBox
            width: 300
            height: 26
            textRole: "key"
            model: ListModel {
                id: softwareItem
                ListElement { key: "LAARIS Games One";      value: "Laaris Games One" }
                ListElement { key: "Warp Show Player";      value: "Warp Show Player" }
                ListElement { key: "tSlice Frame Designer"; value: "tSlice Frame Designer" }
                ListElement { key: "tSlice Gizmo Tweak";    value: "tSlice Gizmo Tweak" }
                ListElement { key: "LAARIS Photo Tracker";  value: "LAARIS Photo Tracker" }
            }
            onCurrentIndexChanged: ligen.software = softwareItem.get(currentIndex).value
            KeyNavigation.tab: cameraType
        }

        Text {
            id: deviceText
            width: parent.width - 16
            height: 26
            color: "#00FFFF"
            text: qsTr("Device type")
            font.pixelSize: 16
        }

        ComboBox {
            id: cameraType
            width: 100
            height: 26
            textRole: "key"
            model: ListModel {
                id: sensorTypeItem
                ListElement { key: "Mako"; value: "MAKO" }
                ListElement { key: "uEye"; value: "UEYE" }
            }
            onCurrentIndexChanged: ligen.sensorType = sensorTypeItem.get(currentIndex).value
            KeyNavigation.tab: serial
        }

        Text {
            id: serialText
            width: parent.width - 16
            height: 26
            color: "#00FFFF"
            text: qsTr("Sensor serial number")
            font.pixelSize: 16
        }

        Rectangle {
            border.width: 1
            border.color: serial.focus ? "#FFFFFF" : "#00FFFF"
            color: serial.focus ? "#40FFFFFF" : "transparent"
            width: parent.width - 16
            height: 26

            TextInput {
                id: serial
                anchors.fill: parent
                text: qsTr("")
                color: "#FFFFFF"
                font.pixelSize: 16
                cursorVisible: true
                onTextChanged: ligen.serial = serial.text
                selectByMouse: true
                KeyNavigation.tab: button
                padding: 6
            }
        }

        Button {
            id: button
            text: qsTr("Generate")
            onPressed: ligen.generate()
            KeyNavigation.tab: generatedLicenseText
        }

    } // Flow


    Rectangle {
        id: svRect
        border.width: 1
        border.color: generatedLicenseText.focus ? "#FFFFFF" : "#00FFFF"
        color: "transparent"
        y: button.y + button.height + 8
        x: 8
        width: theFlow.width - 16
        height: window.height - y - 8

        ScrollView {
            id: view
            anchors.fill: parent

            TextArea {
                id: generatedLicenseText
                anchors.fill: parent
                text: qsTr("")
                color: "#FFFFFF"
                font.pixelSize: 16
                selectByMouse: true
                readOnly : true
                KeyNavigation.tab: name
                onFocusChanged: {
                if(focus)
                    generatedLicenseText.selectAll()
                }
            }
        }
    } // Rectangle

} // Window
