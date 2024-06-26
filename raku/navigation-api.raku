class BrowserAPI {
    has @.entries = [];
    has $.index is rw = -1;

    method get-page($index = $.index) {
        return @.entries[$index];
    }
    
    method previous-page {
        $.index = max($.index - 1, 0);
    }

    method next-page {
        $.index = min($.index + 1, @.entries.elems - 1);
    }

    method get-ten-previous-pages {
        my @range = max(0, $.index - 10) .. min($.index, @.entries.elems - 1);
        @.entries[@range];
    }

    method navigate(Str $page-name) {
        @.entries.push: $page-name;
        $.index++;
    }
}

my $api = BrowserAPI.new;
$api.navigate("/$_") for 'a'..'z';
say $api.entries;
say $api.get-page;
$api.previous-page;
say $api.get-page;
.say for $api.get-ten-previous-pages;
