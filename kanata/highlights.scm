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

; (list
;   .
;   (symbol) @function)

(list
  .
  (symbol) @function
  (#any-of? @function
    "arbitrary-code" "caps-word" "caps-word-custom" "caps-word-custom-toggle" "caps-word-toggle" "clipboard-cmd-set" "clipboard-restore" "clipboard-save" "clipboard-save-cmd-set" "clipboard-save-swap" "clipboard-set" "cmd" "cmd-log" "cmd-output-keys" "concat" "defalias" "defaliasenvcond" "defcfg" "defchords" "defchordsv2" "deflayer" "deflayermap" "deflocalkeys-linux" "deflocalkeys-macos" "deflocalkeys-win" "deflocalkeys-winiov2" "deflocalkeys-wintercept" "defoverrides" "defseq" "defsrc" "deftemplate" "defvar" "defvirtualkeys" "defzippy" "dynamic-macro-play" "dynamic-macro-record" "dynamic-macro-record-stop" "dynamic-macro-record-stop-truncate" "environment" "fork" "hold-for-duration" "if-equal" "if-in-list" "if-not-equal" "if-not-in-list" "include" "layer-switch" "layer-toggle" "layer-while-held" "macro" "macro-cancel-on-press" "macro-release-cancel" "macro-release-cancel-and-cancel-on-press" "macro-repeat" "macro-repeat-" "macro-repeat-cancel-on-press" "macro-repeat-release-cancel" "macro-repeat-release-cancel-and-cancel-on-press" "movemouse-accel-down" "movemouse-accel-left" "movemouse-accel-right" "movemouse-accel-up" "movemouse-down" "movemouse-left" "movemouse-right" "movemouse-speed" "movemouse-up" "multi" "mwheel-down" "mwheel-left" "mwheel-right" "mwheel-up" "on-idle" "on-physical-idle" "on-press" "on-release" "one-shot" "one-shot-pause-processing" "one-shot-press" "one-shot-press-pcancel" "one-shot-release" "one-shot-release-pcancel" "platform" "release-key" "release-layer" "sequence" "sequence-noerase" "setmouse" "t!" "tap-dance" "tap-dance-eager" "tap-hold" "tap-hold-except-keys" "tap-hold-press" "tap-hold-press-timeout" "tap-hold-release" "tap-hold-release-keys" "tap-hold-release-timeout" "template-expand" "unicode" "unmod"
    "switch" "or" "and" "not" "key-history" "key-timing" "input" "input-history" "layer" "base-layer" ;; this should ideally be in its own query, so that the switch special checks are not highlighted as builtins elsewhere
  )
)

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
  (#any-of? @function "layer-while-held" "layer-switch")
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
