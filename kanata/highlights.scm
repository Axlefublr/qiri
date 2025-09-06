["(" ")" "[" "]" "{" "}"] @punctuation.bracket

(symbol) @variable
(number) @constant.numeric

(list
  (symbol) @_defcfg
  (#eq? @_defcfg "defcfg")
  (
    (symbol) @_boolean
    (#any-of? @_boolean "false" "true" "yes" "no")
  ) @constant.builtin.boolean
)

(
  (symbol) @constant
  (#match? @constant "^\\$")
)

(
  (symbol) @function.macro
  (#match? @function.macro "^@")
)

(list
  .
  (symbol) @function)

(list
  (symbol) @function
  (#eq? @function "defvar")
  .
  (symbol) @constant
)

(list
  (symbol) @function
  (#eq? @function "defalias")
  .
  (symbol) @function.macro
)

(list
  (symbol) @function
  (#any-of? @function "on↓" "on↑")
  .
  (symbol)
  .
  (symbol) @function.macro
)

(list
  .
  (symbol) @operator
  (#eq? @operator "not")
)

(list
  .
  (symbol) @keyword.control.conditional
  (#eq? @keyword.control.conditional "switch")
  (symbol) @keyword.control.repeat
  (#any-of? @keyword.control.repeat "fallthrough" "break")
)

(list
  .
  (symbol) @operator
  (#eq? @operator "layer")
  (symbol) @type
)

(list
  (symbol) @function
  (#any-of? @function "layer-while-held" "layer-switch" "layer-toggle" "release-layer" "layer↑")
  .
  (symbol) @type
)

(list
  (symbol) @function
  (#eq? @function "deflayermap")
  .
  (list
    (symbol) @type
  )
)

(string) @string
(escape_sequence) @escape

(
  (symbol) @operator.special
  (#any-of? @operator.special "XX" "_" "__" "___")
)

[
  (comment)
  (block_comment)
  (directive)
] @comment
