import QtQuick 2.0

Item {
    id: root

    signal changeStateRequested(string newState)

    signal activate(string prevState)

    signal activated()

    signal deactivate()

    onDeactivate: {
        visible = false
    }

    onActivate: {
        handleActivate(prevState)
    }

    function handleActivate(prevState) {
        visible = true
        activated()
    }
}
