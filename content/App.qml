/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Studio Components.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick
import QtQuick.Window
import Serial_port_arduino

Window {
    flags: Qt.FramelessWindowHint
    // Material.theme: Material.Dark
    // Material.accent: Material.BlueGrey
    width: mainScreen.width
    height: mainScreen.height

    visible: true
    title: "Serial_port_arduino"
    
    Screen01 {
        id: mainScreen
        quit_button.onClicked: {
            Qt.quit()
}
        disconnect.onClicked: {
            disconnect.enabled = false
            mainScreen.connect.enabled = true
            backend.disconnect_port()

}
        connect.onClicked: {
            backend.connect_port(comboBox.displayText, comboBox1.displayText)
            connect.enabled = false
            mainScreen.disconnect.enabled = true
}
    }
    Connections{
                target: backend
                function onListofserialportsReceived(list_of_serial_ports) {
                    mainScreen.comboBox.model = list_of_serial_ports
                }
                function onClickAck(list_receive){
                    mainScreen.text1.text = "ack"
                    mainScreen.comboBox.model = list_receive
                }
                function onCommandArd(serialString){
                    mainScreen.textArea.text = serialString
                }
                function onRelaySig(serialString){
                    
                    if(serialString == "Relay: 22 ON")
                    {   
                        mainScreen.relay_1.color = "green";
                        console.log ("relay 1 green");
                    }
                    else if(serialString == "Relay: 22 OFF")
                    {   
                        mainScreen.relay_1.color = "red";
                        console.log ("relay 1 red");
                    }
                    else if(serialString == "Relay: 23 ON")
                    {
                        mainScreen.relay_2.color = "green";
                    }
                    else if(serialString == "Relay: 23 OFF")
                    {
                        mainScreen.relay_2.color = "red";
                    }
                    else if(serialString == "Relay: 24 ON")
                    {
                        mainScreen.relay_3.color = "green";
                    }
                    else if(serialString == "Relay: 24 OFF")
                    {
                        mainScreen.relay_3.color = "red";
                    }
                    else if(serialString == "Relay: 25 ON")
                    {
                        mainScreen.relay_4.color = "green";
                    }
                    else if(serialString == "Relay: 25 OFF")
                    {
                        mainScreen.relay_4.color = "red";
                    }
                    else if(serialString == "Relay: 26 ON")
                    {
                        mainScreen.relay_5.color = "green";
                    }
                    else if(serialString == "Relay: 26 OFF")
                    {
                        mainScreen.relay_5.color = "red";
                    }
                    else if(serialString == "Relay: 27 ON")
                    {
                        mainScreen.relay_6.color = "green";
                    }
                    else if(serialString == "Relay: 27 OFF")
                    {
                        mainScreen.relay_6.color = "red";
                    }
                    else if(serialString == "Relay: 28 ON")
                    {
                        mainScreen.relay_7.color = "green";
                    }
                    else if(serialString == "Relay: 28 OFF")
                    {
                        mainScreen.relay_7.color = "red";
                    }
                    else if(serialString == "Relay: 29 ON")
                    {
                        mainScreen.relay_8.color = "green";
                    }
                    else if(serialString == "Relay: 29 OFF")
                    {
                        mainScreen.relay_8.color = "red";
                    }
                    else if(serialString == "Relay: 30 ON")
                    {
                        mainScreen.relay_9.color = "green";
                    }
                    else if(serialString == "Relay: 30 OFF")
                    {
                        mainScreen.relay_9.color = "red";
                    }
                    else if(serialString == "Relay: 31 ON")
                    {
                        mainScreen.relay_10.color = "green";
                    }
                    else if(serialString == "Relay: 31 OFF")
                    {
                        mainScreen.relay_10.color = "red";
                    }
                    else if(serialString == "Relay: 32 ON")
                    {
                        mainScreen.relay_11.color = "green";
                    }
                    else if(serialString == "Relay: 32 OFF")
                    {
                        mainScreen.relay_11.color = "red";
                    }
                    else if(serialString == "Relay: 33 ON")
                    {
                        mainScreen.relay_12.color = "green";
                    }
                    else if(serialString == "Relay: 33 OFF")
                    {
                        mainScreen.relay_12.color = "red";
                    }
                    else if(serialString == "Relay: 34 ON")
                    {
                        mainScreen.relay_13.color = "green";
                    }
                    else if(serialString == "Relay: 34 OFF")
                    {
                        mainScreen.relay_13.color = "red";
                    }
                    else if(serialString == "Relay: 35 ON")
                    {
                        mainScreen.relay_14.color = "green";
                    }
                    else if(serialString == "Relay: 35 OFF")
                    {
                        mainScreen.relay_14.color = "red";
                    }
                    else if(serialString == "Relay: 36 ON")
                    {
                        mainScreen.relay_15.color = "green";
                    }
                    else if(serialString == "Relay: 36 OFF")
                    {
                        mainScreen.relay_15.color = "red";
                    }
                    else if(serialString == "Relay: 37 ON")
                    {
                        mainScreen.relay_16.color = "green";
                    }
                    else if(serialString == "Relay: 37 OFF")
                    {
                        mainScreen.relay_16.color = "red";
                    }
                    else if(serialString == "Relay: 38 ON")
                    {
                        mainScreen.relay_17.color = "green";
                    }
                    else if(serialString == "Relay: 38 OFF")
                    {
                        mainScreen.relay_17.color = "red";
                    }
                    else if(serialString == "Relay: 39 ON")
                    {
                        mainScreen.relay_18.color = "green";
                    }
                    else if(serialString == "Relay: 39 OFF")
                    {
                        mainScreen.relay_18.color = "red";
                    }
                    else{
                        mainScreen.text4.text = serialString;
                    }
                }
                function onProgressSig(numProgress){
                        
                        mainScreen.dial.value = numProgress
                        mainScreen.timer_text.text = parseInt(numProgress)
                    }
                function onTimeSig(time){
                        mainScreen.on_time.text = time
                    }
                function onGaptimeSig(time2){
                        mainScreen.off_time.text = time2
                    }
                function onPlaystatusSig(status){
                        if(status == "Running"){
                            mainScreen.mode.text = "Running"
                        }
                        else if(status == "Stopped"){
                            mainScreen.mode.text = "Stopped"
                        }
                    }
                }
}
