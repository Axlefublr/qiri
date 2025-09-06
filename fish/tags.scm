(function_definition
  name: (word) @definition.function
)

(command
  name: (word) @_command (#eq? @_command "alias")
  .
  argument: (word) @_flag (#any-of? @_flag "--save" "-s")
  .
  argument: (word) @definition.function
)

(command
  name: (word) @_command (#eq? @_command "alias")
  .
  argument: (word) @definition.function
  (#match? @definition.function "^[^-]")
)
