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
    //flags: Qt.FramelessWindowHint
    // Material.theme: Material.Dark
    // Material.accent: Material.BlueGrey
    width: mainScreen.width
    height: mainScreen.height

    visible: true
    title: "Serial_port_arduino"
    
    Screen01 {
        id: mainScreen
        connect.onClicked: {
            backend.connect_port(comboBox.displayText, comboBox1.displayText)
            mainScreen.comboBox.model = [""]
            connect.enabled = false
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
            }
}
