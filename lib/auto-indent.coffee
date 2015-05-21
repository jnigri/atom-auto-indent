module.exports =
    activate: ->
        atom.commands.add "atom-text-editor", "auto-indent:apply", => @apply()

    apply: ->
        editor = atom.workspace.getActivePaneItem()
        # We get the cursor and save is position
        cursor = editor.getLastCursor()
        savedPosition = cursor.getScreenPosition()
        # Now we select all the lines and auto-indent them according to the grammar
        editor.selectAll()
        editor.autoIndentSelectedRows()
        # And finally we put the cursor where it was
        cursor = editor.getLastCursor()
        cursor.setScreenPosition(savedPosition)
