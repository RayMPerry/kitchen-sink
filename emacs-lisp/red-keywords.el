;; red-keywords.el

(setq red-keywords
      '("%"
        "*"
        "**"
        "+"
        "-"
        "/"
        "//"
        "<"
        "<<"
        "<="
        "<>"
        "="
        "=="
        "=?"
        ">"
        ">="
        ">>"
        ">>>"
        "?"
        "??"
        "NaN"
        "NaN?"
        "a-an"
        "about"
        "absolute"
        "acos"
        "action!"
        "action?"
        "add"
        "all"
        "all-word!"
        "all-word?"
        "also"
        "alter"
        "and"
        "and~"
        "any"
        "any-block?"
        "any-function?"
        "any-list!"
        "any-list?"
        "any-object!"
        "any-object?"
        "any-path!"
        "any-path?"
        "any-string!"
        "any-string?"
        "any-word!"
        "any-word?"
        "append"
        "arccosine"
        "arcsine"
        "arctangent"
        "arctangent2"
        "as-color"
        "as-ipv4"
        "as-pair"
        "as-rgba"
        "asin"
        "ask"
        "at"
        "atan"
        "atan2"
        "attempt"
        "back"
        "binary!"
        "binary?"
        "bind"
        "bitset!"
        "bitset?"
        "block!"
        "block?"
        "body-of"
        "break"
        "browse"
        "call"
        "case"
        "catch"
        "cause-error"
        "cd"
        "change"
        "change-dir"
        "char!"
        "char?"
        "charset"
        "checksum"
        "clean-path"
        "clear"
        "clear-reactions"
        "collect"
        "comment"
        "complement"
        "complement?"
        "compose"
        "construct"
        "context"
        "context?"
        "continue"
        "copy"
        "cos"
        "cosine"
        "create-dir"
        "datatype!"
        "datatype?"
        "date!"
        "debase"
        "default-input-completer"
        "dehex"
        "delete"
        "difference"
        "dir"
        "dir?"
        "dirize"
        "divide"
        "do"
        "do-actor"
        "do-events"
        "do-file"
        "do-safe"
        "does"
        "dump-reactions"
        "either"
        "email!"
        "email?"
        "empty?"
        "enbase"
        "equal?"
        "error!"
        "error?"
        "eval-set-path"
        "even?"
        "event!"
        "exclude"
        "exists?"
        "exit"
        "exp"
        "extend"
        "extract"
        "extract-boot-args"
        "false"
        "fifth"
        "file!"
        "file?"
        "find"
        "first"
        "flip-exe-flag"
        "float!"
        "float?"
        "forall"
        "foreach"
        "forever"
        "form"
        "fourth"
        "func"
        "function!"
        "function"
        "function?"
        "get"
        "get-current-dir"
        "get-env"
        "get-path!"
        "get-path?"
        "get-word!"
        "get-word?"
        "greater-or-equal?"
        "greater?"
        "halt"
        "has"
        "hash!"
        "hash?"
        "head"
        "head?"
        "help"
        "if"
        "image!"
        "image?"
        "in"
        "index?"
        "input"
        "insert"
        "integer!"
        "integer?"
        "intersect"
        "is"
        "issue!"
        "issue?"
        "keys-of"
        "last"
        "last-lf?"
        "layout"
        "length?"
        "lesser-or-equal?"
        "lesser?"
        "list-dir"
        "list-env"
        "lit-path!"
        "lit-path?"
        "lit-word!"
        "lit-word?"
        "ll"
        "load"
        "log-10"
        "log-2"
        "log-e"
        "logic!"
        "logic?"
        "loop"
        "lowercase"
        "ls"
        "make"
        "make-dir"
        "map!"
        "map?"
        "math"
        "max"
        "min"
        "modify"
        "modulo"
        "mold"
        "move"
        "multiply"
        "native!"
        "native?"
        "negate"
        "negative?"
        "new-line"
        "new-line?"
        "next"
        "no"
        "none!"
        "none"
        "none?"
        "normalize-dir"
        "not"
        "not-equal?"
        "now"
        "number!"
        "object!"
        "object"
        "object?"
        "odd?"
        "off"
        "on"
        "op!"
        "op?"
        "or"
        "or~"
        "pad"
        "pair!"
        "pair?"
        "paren!"
        "paren?"
        "parse"
        "parse-trace"
        "path!"
        "path?"
        "percent!"
        "percent?"
        "pi"
        "pick"
        "point!"
        "point"
        "poke"
        "positive?"
        "power"
        "prin"
        "print"
        "probe"
        "put"
        "pwd"
        "q"
        "quit"
        "quit-return"
        "quote"
        "random"
        "react?"
        "read"
        "red-complete-file"
        "red-complete-path"
        "reduce"
        "refinement!"
        "refinement?"
        "reflect"
        "rejoin"
        "remainder"
        "remove"
        "remove-each"
        "repeat"
        "repend"
        "replace"
        "request-dir"
        "request-file"
        "request-font"
        "return"
        "reverse"
        "round"
        "routine!"
        "routine"
        "routine?"
        "same?"
        "save"
        "scalar!"
        "scalar?"
        "second"
        "select"
        "series!"
        "series?"
        "set"
        "set-current-dir"
        "set-env"
        "set-path!"
        "set-path?"
        "set-quiet"
        "set-word!"
        "set-word?"
        "shift"
        "shift-left"
        "shift-logical"
        "shift-right"
        "sin"
        "sine"
        "size?"
        "skip"
        "sort"
        "source"
        "space"
        "spec-of"
        "split"
        "split-path"
        "square-root"
        "stats"
        "strict-equal?"
        "string!"
        "string?"
        "subtract"
        "suffix?"
        "swap"
        "switch"
        "tag!"
        "tag?"
        "tail"
        "tail?"
        "take"
        "tan"
        "tangent"
        "third"
        "throw"
        "time!"
        "time?"
        "to"
        "to-email"
        "to-hex"
        "to-image"
        "to-local-file"
        "to-red-file"
        "to-tag"
        "to-time"
        "trim"
        "true"
        "try"
        "tuple!"
        "tuple?"
        "type?"
        "typeset!"
        "typeset?"
        "union"
        "unique"
        "unless"
        "unset!"
        "unset"
        "unset?"
        "until"
        "unview"
        "uppercase"
        "url!"
        "url?"
        "value?"
        "values-of"
        "vector!"
        "vector?"
        "view"
        "wait"
        "what"
        "what-dir"
        "while"
        "within?"
        "word!"
        "word?"
        "words-of"
        "write"
        "xor"
        "xor~"
        "yes"
        "zero?"))