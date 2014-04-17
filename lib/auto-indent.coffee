  AutoIndentView = require './auto-indent-view'

  module.exports =
    activate: ->
      atom.workspaceView.command "auto-indent:apply", => @apply()

    apply: ->
      editor = atom.workspace.activePaneItem
      # We get the cursor and save is position
      cursor = editor.getCursor()
      savedPosition = cursor.getScreenPosition()
      # Now we select all the lines and auto-indent them according to the grammar
      editor.selectAll()
      editor.autoIndentSelectedRows()
      # And finally we put the cursor where it was
      cursor = editor.getCursor()
      cursor.setScreenPosition(savedPosition)
