import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import SortFilterProxyModel 0.2

import PageEnum 1.0
import ProtocolEnum 1.0
import ContainerProps 1.0
import ContainersModelFilters 1.0

import "./"
import "../Controls2"
import "../Controls2/TextTypes"
import "../Config"
import "../Components"

PageType {
    id: root

    property var installedProtocolsCount

    FlickableType {
        id: fl
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        contentHeight: content.implicitHeight

        Column {
            id: content

            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            SettingsContainersListView {
                id: settingsContainersListView
                Connections {
                    target: ServersModel

                    function onCurrentlyProcessedServerIndexChanged() {
                        settingsContainersListView.updateContainersModelFilters()
                    }
                }

                function updateContainersModelFilters() {
                    if (ServersModel.isCurrentlyProcessedServerHasWriteAccess()) {
                        proxyContainersModel.filters = ContainersModelFilters.getWriteAccessProtocolsListFilters()
                    } else {
                        proxyContainersModel.filters = ContainersModelFilters.getReadAccessProtocolsListFilters()
                    }
                    root.installedProtocolsCount = proxyContainersModel.count
                }

                model: SortFilterProxyModel {
                    id: proxyContainersModel
                    sourceModel: ContainersModel
                }

                Component.onCompleted: updateContainersModelFilters()
            }
        }
    }
}
