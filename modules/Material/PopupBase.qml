/*
* QML Material - An application framework implementing Material Design.
* Copyright (C) 2015 Michael Spencer <sonrisesoftware@gmail.com>
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU Lesser General Public License as
* published by the Free Software Foundation, either version 2.1 of the
* License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*/
import QtQuick 2.0
import QtQuick.Window 2.2
import Material 0.1
import Material.Extras 0.1

FocusScope {
    id: popup

    property color overlayColor: "transparent"
    property string overlayLayer: "overlayLayer"
    property bool globalMouseAreaEnabled: true
    property bool dismissOnTap: true
    property bool showing: false
    property Item __lastFocusedItem

    signal opened

    function toggle(widget) {
        if (showing) {
            close()
        } else {
            open(widget)
        }
    }

    function open() {
        __lastFocusedItem = Window.activeFocusItem
        parent = Utils.findRootChild(popup, overlayLayer)
        showing = true
        forceActiveFocus()
        parent.currentOverlay = popup

        opened()
    }

    function close() {
        showing = false
        parent.currentOverlay = null
        if (__lastFocusedItem !== null) {
            __lastFocusedItem.forceActiveFocus()
        }
    }
}
