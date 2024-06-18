import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Animated TabBar Exaple")

    // Change model as desired
    property ListModel tabModel: ListModel {
        ListElement {
            text: "Home"
        }

        ListElement {
            text: "Create"
        }

        ListElement {
            text: "About"
        }

        ListElement {
            text: "Profile"
        }
    }

    Column {
        width: parent.width * 0.4
        spacing: 10
        anchors.centerIn: parent

        // Our custom tab bar
        CustomTabBar {
            id: _tab1
            width: parent.width
            height: 60
            model: tabModel
        }
        Text {
            text: _tab1.currentIndex
            font.pixelSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomTabBar {
            id: _tab2
            width: parent.width
            height: 60
            model: tabModel

            // Customise the colors as needed
            color: 'grey'
            highlightColor: 'green'
            textColor: '#444'
            textHighlightColor: "#fff"
        }

        Text {
            text: _tab2.currentIndex
            font.pixelSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
