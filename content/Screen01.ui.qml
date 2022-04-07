

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import Serial_port_arduino
import QtQuick.Controls.Material 2.12
import QtQuick3D 6.2
import QtQuick.Timeline 1.0

Rectangle {
    id: rectangle1
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor
    property alias comboBox: comboBox
    property alias comboBox1: comboBox1
    property alias okbutton: okbutton
    property alias text1: text1
    Rectangle {
        id: rectangle
        y: 198
        color: "#ffffff"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
        anchors.topMargin: 20

        Column {
            id: column
            width: 201
            height: 400
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 20
            anchors.topMargin: 20

            ComboBox {
                id: comboBox
                width: column.width
                currentIndex: 0
                model: ["S", "M", "L"]
            }
            ComboBox {
                id: comboBox1
                x: 0
                width: column.width
                anchors.top: comboBox.bottom
                anchors.topMargin: 50
                z: 0
            }
        }

        Button {
            id: okbutton
            y: 585
            width: 364
            height: 71
            text: qsTr("ok")
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 24
        }

        Text {
            id: text1
            y: 332
            text: qsTr("Text")
            font.pixelSize: 32
            anchors.horizontalCenter: parent.horizontalCenter
        }

        View3D {
            id: view3D
            x: 20
            y: 256
            width: 400
            height: 400
            SceneEnvironment {
                id: sceneEnvironment
                antialiasingMode: SceneEnvironment.MSAA
                antialiasingQuality: SceneEnvironment.High
            }

            Node {
                id: scene
                DirectionalLight {
                    id: directionalLight
                }

                PerspectiveCamera {
                    id: sceneCamera
                    y: 41
                    z: 360
                }

                Model {
                    id: cubeModel
                    source: "#Cube"
                    eulerRotation.x: 30
                    eulerRotation.y: 45
                    materials: cubeMaterial
                    DefaultMaterial {
                        id: cubeMaterial
                        diffuseColor: "#4aee45"

                        Effect {
                            id: effect
                            passes: renderPass
                            Pass {
                                id: renderPass
                                shaders: [fragShader]
                            }

                            Shader {
                                id: fragShader
                                stage: Shader.Fragment
                                shader: "effect_default_shader.frag"
                            }
                        }
                    }
                }
            }
            environment: sceneEnvironment
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

        KeyframeGroup {
            target: directionalLight
            property: "brightness"
            Keyframe {
                value: 0.5
                frame: 0
            }

            Keyframe {
                value: 1
                frame: 1000
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}D{i:10}D{i:11}D{i:12}D{i:17}
}
##^##*/

