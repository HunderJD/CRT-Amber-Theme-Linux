import QtQuick 2.0
import SddmComponents 2.0
import "SimpleControls" as Simple

Rectangle {
    
    width: 640
    height: 480
    
    LayoutMirroring.enabled: Qt.locale().textDirection === Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    TextConstants { id: textConstants }
    
    Connections {
        target: sddm
        onLoginSucceeded: {}
        onLoginFailed: {
            pw_entry.text = ""
            pw_entry.focus = true
            errorMessage.color = "#CC4C00"
            errorMessage.text = textConstants.loginFailed
        }
    }
    
    Background {
        anchors.fill: parent
        source: config.background
        fillMode: Image.PreserveAspectCrop
        onStatusChanged: {
            if (status === Image.Error && source !== config.defaultBackground) {
                source = config.defaultBackground
            }
        }
    }

    //le but est davoir :
    //le username et le password en haut a gauhce
    //lheure et le desktop au millieu au centre
    //et une image en bas a droite


   /* Rectangle {
        anchors.fill: parent
        color: "transparent"

        // Zone rouge
        Column {
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.margins: 30
            spacing: 20

            Row {
                spacing: 10
                Text {
                    text: "Username:"
                    color: "#FF8C00"
                    font.family: "reFixedsysMono"
                    font.pixelSize: 16
                }
                TextBox {
                    id: user_entry
                    radius: 3
                    width: 250
                    text: userModel.lastUser
                    font.pixelSize: 16
                    font.family: "reFixedsysMono"
                    color: Qt.rgba(0, 0, 0, 0.2)
                    borderColor: "transparent"
                    focusColor: Qt.rgba(0, 0, 0, 0.25)
                    hoverColor: Qt.rgba(0, 0, 0, 0.2)
                    textColor: "#FF8C00"

                    KeyNavigation.backtab: session; KeyNavigation.tab: pw_entry
                }
            }

            Row {
                spacing: 10
                Text {
                    text: "Password:"
                    color: "#FF8C00"
                    font.family: "reFixedsysMono"
                    font.pixelSize: 16
                }
                PasswordBox {
                    id: pw_entry
                    radius: 3
                    width: 250
                    font.pixelSize: 16
                    font.family: "reFixedsysMono"
                    color: Qt.rgba(0, 0, 0, 0.2)
                    borderColor: "transparent"
                    focusColor: Qt.rgba(0, 0, 0, 0.25)
                    hoverColor: Qt.rgba(0, 0, 0, 0.2)
                    textColor: "#FF8C00"
                    echoMode: PasswordBox.Password
                    focus: true

                    KeyNavigation.backtab: user_entry; KeyNavigation.tab: loginButton

                    Keys.onPressed: {
                        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                            sddm.login(user_entry.text, pw_entry.text, session.index)
                            event.accepted = true
                        }
                    }
                }
            }
        }

        // Zone verte
        Simple.SimpleComboBox {
            id: session
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 80
            width: 160
            color: Qt.rgba(0, 0, 0, 0.2)
            dropDownColor: Qt.rgba(0, 0, 0, 0.2)
            borderColor: "transparent"
            textColor: "#FF8C00"
            arrowIcon: "images/arrow-down.png"
            arrowColor: "transparent"
            model: sessionModel
            index: sessionModel.lastIndex

            font.pixelSize: 16
            font.family: "reFixedsysMono"
            KeyNavigation.backtab: shutdown; KeyNavigation.tab: user_entry
        }

        // Zone violette
        Timer {
            id: timetr
            interval: 100
            running: true
            repeat: true
            onTriggered: {
                timelb.text = Qt.formatDateTime(new Date(), "HH:mm");
            }
        }

        Rectangle {
            color: Qt.rgba(0, 0, 0, 0.2)
            anchors.verticalCenter: parent.verticalCenter
            width: 60
            height: session.height
            radius: 4

            Text {
                id: timelb
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: Qt.formatDateTime(new Date(), "HH:mm")
                color: "#FF8C00"
                font.pixelSize: 18
                font.family: "reFixedsysMono"
            }
        }

        // Zone bleue (image)
        Image {
            source: "images/vaultBoy.png"
            width: 200
            height: 200
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
        }
    }*/



    Rectangle {
        anchors.fill: parent
        color: "transparent"

        // Zone rouge
        Column {
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.margins: 30
            spacing: 20

            Row {
                spacing: 10
                Text {
                    text: "Username:"
                    color: "#FF8C00"
                    font.family: "reFixedsysMono"
                    font.pixelSize: 16
                }
                TextBox {
                    id: user_entry
                    radius: 3
                    width: 250
                    text: userModel.lastUser
                    font.pixelSize: 16
                    font.family: "reFixedsysMono"
                    color: Qt.rgba(0, 0, 0, 0.2)
                    borderColor: "transparent"
                    focusColor: Qt.rgba(0, 0, 0, 0.25)
                    hoverColor: Qt.rgba(0, 0, 0, 0.2)
                    textColor: "#FF8C00"

                    KeyNavigation.backtab: session; KeyNavigation.tab: pw_entry
                }
            }

            Row {
                spacing: 10
                Text {
                    text: "Password:"
                    color: "#FF8C00"
                    font.family: "reFixedsysMono"
                    font.pixelSize: 16
                }
                PasswordBox {
                    id: pw_entry
                    radius: 3
                    width: 250
                    font.pixelSize: 16
                    font.family: "reFixedsysMono"
                    color: Qt.rgba(0, 0, 0, 0.2)
                    borderColor: "transparent"
                    focusColor: Qt.rgba(0, 0, 0, 0.25)
                    hoverColor: Qt.rgba(0, 0, 0, 0.2)
                    textColor: "#FF8C00"
                    echoMode: PasswordBox.Password
                    focus: true

                    KeyNavigation.backtab: user_entry; KeyNavigation.tab: loginButton

                    Keys.onPressed: {
                        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                            sddm.login(user_entry.text, pw_entry.text, session.index)
                            event.accepted = true
                        }
                    }
                }
            }
        }

        // Zone verte
        Simple.SimpleComboBox {
            id: session
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 80
            width: 160
            color: Qt.rgba(0, 0, 0, 0.2)
            dropDownColor: Qt.rgba(0, 0, 0, 0.2)
            borderColor: "transparent"
            textColor: "#FF8C00"
            arrowIcon: "images/arrow-down.png"
            arrowColor: "transparent"
            model: sessionModel
            index: sessionModel.lastIndex

            font.pixelSize: 16
            font.family: "reFixedsysMono"
            KeyNavigation.backtab: shutdown; KeyNavigation.tab: user_entry
        }

        // Zone violette
        Timer {
            id: timetr
            interval: 100
            running: true
            repeat: true
            onTriggered: {
                timelb.text = Qt.formatDateTime(new Date(), "HH:mm");
            }
        }

        Rectangle {
            color: Qt.rgba(0, 0, 0, 0.2)
            anchors.verticalCenter: parent.verticalCenter
            width: 60
            height: session.height
            radius: 4

            Text {
                id: timelb
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: Qt.formatDateTime(new Date(), "HH:mm")
                color: "#FF8C00"
                font.pixelSize: 18
                font.family: "reFixedsysMono"
            }
        }

        // Zone bleue (image)
        Image {
            source: "images/vaultBoy.png"
            width: 200
            height: 200
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
        }
    }








    
    Component.onCompleted: {
        if (user_entry.text === "")
            user_entry.focus = true
        else
            pw_entry.focus = true
    }
}
