

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.12
import QtQuick.Controls 2.12
import Serial_port_arduino
import QtQuick.Controls.Material 2.12
import QtQuick3D 6.2
import QtQuick.Timeline 1.0

Rectangle {
    id: rectangle1
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor
    radius: 0
    property alias mode: mode
    property alias off_time: off_time
    property alias on_time: on_time
    property alias timer_text: timer_text
    property alias disconnect: disconnect
    property alias dial: dial
    property alias text4: text4
    property alias connect: connect
    property alias relay_18: relay_18
    property alias relay_17: relay_17
    property alias relay_16: relay_16
    property alias relay_15: relay_15
    property alias relay_14: relay_14
    property alias relay_13: relay_13
    property alias relay_12: relay_12
    property alias relay_11: relay_11
    property alias relay_10: relay_10
    property alias relay_9: relay_9
    property alias relay_8: relay_8
    property alias relay_7: relay_7
    property alias relay_6: relay_6
    property alias relay_5: relay_5
    property alias relay_4: relay_4
    property alias relay_3: relay_3
    property alias relay_2: relay_2
    property alias relay_1: relay_1
    property alias comboBox: comboBox
    property alias comboBox1: comboBox1
    property alias text1: text1
    Rectangle {
        id: rectangle
        y: 198
        color: "#676767"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
        anchors.topMargin: 20

        Pane {
            id: pane
            x: 8
            y: 8
            width: 352
            height: 664
        }

        Column {
            id: column
            width: 127
            height: 144
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 188
            anchors.topMargin: 59

            ComboBox {
                id: comboBox
                width: column.width
                currentIndex: 0
                model: [""]
            }
            ComboBox {
                id: comboBox1
                x: 0
                width: column.width
                anchors.top: comboBox.bottom
                anchors.topMargin: 50
                z: 0
                model: ["9600", "115200"]
            }
        }

        Button {
            id: connect
            y: 223
            width: 102
            height: 71
            text: qsTr("Connect")
            anchors.bottom: parent.bottom
            anchors.horizontalCenterOffset: -542
            flat: false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 386
        }

        Text {
            id: text1
            y: 59
            text: qsTr("Serial Port")
            font.pixelSize: 32
            anchors.horizontalCenterOffset: -521
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: text2
            y: 160
            text: qsTr("Baud Rate")
            font.pixelSize: 32
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -521
        }

        Button {
            id: disconnect
            y: 223
            width: 113
            height: 71
            text: qsTr("Disconnect")
            anchors.left: connect.right
            anchors.leftMargin: 73
            enabled: false
        }

        Pane {
            id: pane1
            x: 366
            y: 8
            width: 866
            height: 664

            Dial {
                id: dial
                width: 300
                height: 300
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                wrap: false
                value: 50
                anchors.leftMargin: 49
                enabled: true
                inputMode: Dial.Circular
                stepSize: 0.1

                Text {
                    id: timer_text
                    color: "#ffffff"
                    text: qsTr("00")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 48
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "Verdana"
                }
                to: 100
            }

            Grid {
                id: grid
                x: 408
                width: 400
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 19
                anchors.bottomMargin: 34
                anchors.rightMargin: 34

                Rectangle {
                    id: relay_1
                    width: 75
                    height: 75
                    color: "#4c4c4c"
                    radius: 5
                    border.color: "#ed000000"
                    border.width: 5
                    anchors.left: parent.left
                    focus: false
                    anchors.leftMargin: 10

                    Text {
                        id: text3
                        text: qsTr("Relay 1")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: relay_2
                    width: 75
                    height: 75
                    color: "#4c4c4c"
                    radius: 5
                    border.color: "#ed000000"
                    border.width: 5
                    focus: false
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        id: text5
                        text: qsTr("Relay 2")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: relay_3
                    x: 164
                    width: 75
                    height: 75
                    color: "#4c4c4c"
                    radius: 5
                    border.color: "#ed000000"
                    border.width: 5
                    anchors.right: parent.right
                    focus: false
                    anchors.rightMargin: 10

                    Text {
                        id: text6
                        text: qsTr("Relay 3")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: relay_4
                    width: 75
                    height: 75
                    color: "#4c4c4c"
                    radius: 5
                    border.color: "#ed000000"
                    border.width: 5
                    anchors.left: parent.left
                    anchors.top: parent.top
                    focus: false
                    anchors.topMargin: 100
                    anchors.leftMargin: 10

                    Text {
                        id: text7
                        text: qsTr("Relay 4")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: relay_5
                    width: 75
                    height: 75
                    color: "#4c4c4c"
                    radius: 5
                    border.color: "#ed000000"
                    border.width: 5
                    anchors.top: parent.top
                    focus: false
                    anchors.topMargin: 100
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        id: text8
                        text: qsTr("Relay 5")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: relay_6
                    x: 164
                    width: 75
                    height: 75
                    color: "#4c4c4c"
                    radius: 5
                    border.color: "#ed000000"
                    border.width: 5
                    anchors.right: parent.right
                    anchors.top: parent.top
                    focus: false
                    anchors.topMargin: 100
                    anchors.rightMargin: 10

                    Text {
                        id: text9
                        text: qsTr("Relay 6")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: relay_7
                    width: 75
                    height: 75
                    color: "#4c4c4c"
                    radius: 5
                    border.color: "#ed000000"
                    border.width: 5
                    anchors.left: parent.left
                    anchors.top: parent.top
                    focus: false
                    anchors.topMargin: 200
                    anchors.leftMargin: 10

                    Text {
                        id: text10
                        text: qsTr("Relay 7")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: relay_8
                    width: 75
                    height: 75
                    color: "#4c4c4c"
                    radius: 5
                    border.color: "#ed000000"
                    border.width: 5
                    anchors.top: parent.top
                    focus: false
                    anchors.topMargin: 200
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        id: text11
                        text: qsTr("Relay 8")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: relay_9
                    x: 164
                    width: 75
                    height: 75
                    color: "#4c4c4c"
                    radius: 5
                    border.color: "#ed000000"
                    border.width: 5
                    anchors.right: parent.right
                    anchors.top: parent.top
                    focus: false
                    anchors.topMargin: 200
                    anchors.rightMargin: 10

                    Text {
                        id: text12
                        text: qsTr("Relay 9")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: relay_10
                    width: 75
                    height: 75
                    color: "#4c4c4c"
                    radius: 5
                    border.color: "#ed000000"
                    border.width: 5
                    anchors.left: parent.left
                    anchors.top: parent.top
                    focus: false
                    anchors.topMargin: 300
                    anchors.leftMargin: 10

                    Text {
                        id: text13
                        text: qsTr("Relay 10")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: relay_11
                    width: 75
                    height: 75
                    color: "#4c4c4c"
                    radius: 5
                    border.color: "#ed000000"
                    border.width: 5
                    anchors.top: parent.top
                    focus: false
                    anchors.topMargin: 300
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        id: text14
                        text: qsTr("Relay 11")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: relay_12
                    x: 164
                    width: 75
                    height: 75
                    color: "#4c4c4c"
                    radius: 5
                    border.color: "#ed000000"
                    border.width: 5
                    anchors.right: parent.right
                    anchors.top: parent.top
                    focus: false
                    anchors.topMargin: 300
                    anchors.rightMargin: 10

                    Text {
                        id: text15
                        text: qsTr("Relay 12")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: relay_13
                    width: 75
                    height: 75
                    color: "#4c4c4c"
                    radius: 5
                    border.color: "#ed000000"
                    border.width: 5
                    anchors.left: parent.left
                    anchors.top: parent.top
                    focus: false
                    anchors.topMargin: 400
                    anchors.leftMargin: 10

                    Text {
                        id: text16
                        text: qsTr("Relay 13")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: relay_14
                    width: 75
                    height: 75
                    color: "#4c4c4c"
                    radius: 5
                    border.color: "#ed000000"
                    border.width: 5
                    anchors.top: parent.top
                    focus: false
                    anchors.topMargin: 400
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        id: text17
                        text: qsTr("Relay 14")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: relay_15
                    x: 164
                    width: 75
                    height: 75
                    color: "#4c4c4c"
                    radius: 5
                    border.color: "#ed000000"
                    border.width: 5
                    anchors.right: parent.right
                    anchors.top: parent.top
                    focus: false
                    anchors.topMargin: 400
                    anchors.rightMargin: 10

                    Text {
                        id: text18
                        text: qsTr("Relay 15")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: relay_16
                    width: 75
                    height: 75
                    color: "#4c4c4c"
                    radius: 5
                    border.color: "#ed000000"
                    border.width: 5
                    anchors.left: parent.left
                    anchors.top: parent.top
                    focus: false
                    anchors.topMargin: 500
                    anchors.leftMargin: 10

                    Text {
                        id: text19
                        text: qsTr("Relay 16")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: relay_17
                    width: 75
                    height: 75
                    color: "#4c4c4c"
                    radius: 5
                    border.color: "#ed000000"
                    border.width: 5
                    anchors.top: parent.top
                    focus: false
                    anchors.topMargin: 500
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        id: text20
                        text: qsTr("Relay 17")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: relay_18
                    x: 164
                    width: 75
                    height: 75
                    color: "#4c4c4c"
                    radius: 5
                    border.color: "#ed000000"
                    border.width: 5
                    anchors.right: parent.right
                    anchors.top: parent.top
                    focus: false
                    anchors.topMargin: 500
                    anchors.rightMargin: 10

                    Text {
                        id: text21
                        text: qsTr("Relay 18")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }

            Text {
                id: text4
                x: 24
                y: 508
                text: qsTr("On Time:")
                font.pixelSize: 48
                font.family: "Segoe UI"
            }

            Text {
                id: on_time
                x: 243
                y: 508
                text: qsTr("00")
                font.pixelSize: 48
            }

            Text {
                id: text23
                x: 24
                y: 568
                text: qsTr("Off Time:")
                font.pixelSize: 48
                font.family: "Segoe UI"
            }

            Text {
                id: off_time
                x: 243
                y: 568
                text: qsTr("00")
                font.pixelSize: 48
            }

            Text {
                id: text24
                x: 24
                y: 19
                text: qsTr("Mode:")
                font.pixelSize: 48
                font.family: "Segoe UI"
            }

            Text {
                id: mode
                x: 164
                y: 19
                text: qsTr("Stopped")
                font.pixelSize: 48
            }
        }
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                loops: -1
                running: true
                duration: 1000
                to: 1000
                from: 0
            }
        ]
        enabled: true
        startFrame: 0
        endFrame: 1000
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}D{i:52}D{i:54}
}
##^##*/

