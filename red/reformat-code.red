This will output itself with all `kebab-case` and `snake_case` words changed to `camelCase`.

Red []

letters: charset [#"a" - #"z"]
capitals: charset [#"A" - #"Z"]
digits: charset [#"0" - #"9"]
no-capitals: [letters | digits]
alphanumeric: [letters | capitals | digits]
kebab-case-separator: "-"
snake-case-separator: "_"

generate-rule: function [characters separators] [
    compose/deep [
        some (characters)
        some [(separators) some (characters)]
    ]
]

kebab-case-rule: generate-rule alphanumeric kebab-case-separator
snake-case-rule: generate-rule alphanumeric snake-case-separator
camel-case-rule: generate-rule no-capitals capitals

to-camel-case: [
    some [
        to [kebab-case-separator | snake-case-separator]
        point:
        (if all [point/2 <> space point/2 <> dbl-quote]
            [remove point uppercase/part point 1])
    ]
]

test-case: read %reformat-code.red
parse test-case [
    some [to [kebab-case-rule | snake-case-rule] to-camel-case]
]

print test-case