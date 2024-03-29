grammar BrainFuck::Grammar {
    rule TOP { ^^ <program> $$ }
    rule program { <expression>+ }
    
    proto rule expression { * }
    rule expression:sym<increment> { "+" }
    rule expression:sym<decrement> { "-" }
    rule expression:sym<next-cell> { ">" }
    rule expression:sym<previous-cell> { "<" }
    rule expression:sym<print-ascii-value> { "." }
    rule expression:sym<read-char-to-cell> { "," }
    rule expression:sym<loop-body> { "[" ~ "]" <program> }
}

class BrainFuck::Actions {
    my byte @cells[5000] = 0 xx 5000;
    my $data-pointer = 0;
    my $parse-counter = 0;

    method expression:sym<increment>($/) { @cells[$data-pointer] += 1; }
    method expression:sym<decrement>($/) { @cells[$data-pointer] -= 1; }
    method expression:sym<next-cell>($/) { $data-pointer += 1; }
    method expression:sym<previous-cell>($/) { $data-pointer -= 1; }
    method expression:sym<print-ascii-value>($/) { say @cells[$data-pointer].chr; }
    method expression:sym<read-char-to-cell>($/) { @cells[$data-pointer] = $*IN.getc.ord; }
    method expression:sym<loop-body>($/) {
        say ~$/.substr(1, *-1);
        make ~$/.trim.substr(1, *-1);
    }
}

sub interpret-bf(Str $program) {
    BrainFuck::Grammar.parse($program.comb(/<[+\-><.,\[\]]>/).join, actions => BrainFuck::Actions);
}

interpret-bf("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.");
interpret-bf("++++++ [ > ++++++++++ < - ] > +++++ .");
