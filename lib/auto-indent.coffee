module.exports =
    activate: ->
        atom.commands.add "atom-text-editor", "auto-indent:apply", => @apply()

    apply: ->
        editor = atom.workspace.getActivePaneItem()
        # We get the cursor and save is position
        cursor = editor.getLastCursor()
        savedPosition = cursor.getScreenPosition()
        # If no text is selected, we select all the lines and auto-indent them according to the grammar
        if editor.getSelectedText().length == 0
            editor.selectAll()
        editor.autoIndentSelectedRows()
        # And finally we put the cursor where it was
        cursor = editor.getLastCursor()
        cursor.setScreenPosition(savedPosition)
