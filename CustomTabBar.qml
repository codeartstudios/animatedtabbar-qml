import QtQuick

Rectangle {
    id: root
    color: "#000"

    // Initial dimensions
    implicitHeight: 50
    implicitWidth: 200

    property string textHighlightColor: "#fff"
    property string textColor: "#eee"
    property string highlightColor: "#444"

    // Expose these two properties for use outside implicitHeight:
    // the control
    property alias model: listView.model
    property alias currentIndex: listView.currentIndex

    // Display tab buttons
    ListView {
        id: listView
        anchors.fill: parent // fill parent widget
        spacing: 1
        anchors.margins: 1
        currentIndex: 0
        orientation: Qt.Horizontal
        highlightFollowsCurrentItem: false
        delegate: Item {
            id: listDelegate
            width: listView.width/listView.model.count
            height: listView.height

            property string label: model.text

            Text {
                text: parent.label
                anchors.centerIn: parent
                color: listView.currentIndex===index
                       ? textHighlightColor : textColor
                font.pixelSize: 14
                font.bold: index === listView.currentIndex
            }

            // Implement click functionality
            MouseArea {
                anchors.fill: parent
                onClicked: listView.currentIndex=index
            }
        }

        highlight: Item {
            width: listView.currentItem.width
            height: listView.currentItem.height
            x: listView.currentItem.x

            Behavior on x { NumberAnimation {} }

            Rectangle {
                anchors.fill: parent
                anchors.margins: 2
                color: highlightColor
            }
        }
    }
}
