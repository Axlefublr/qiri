(list
  (symbol) @_action
  (#eq? @_action "cmd")
  .
  (symbol) @_executable
  (#eq? @_executable "bash")
  .
  (symbol) @_flag
  (#eq? @_flag "-c")
  .
  (string) @injection.content
  (#set! injection.language "bash")
)

(list
  (symbol) @_action
  (#eq? @_action "cmd")
  .
  (symbol) @_executable
  (#eq? @_executable "fish")
  .
  (symbol) @_flag
  (#eq? @_flag "-c")
  .
  (string) @injection.content
  (#set! injection.language "fish")
)
