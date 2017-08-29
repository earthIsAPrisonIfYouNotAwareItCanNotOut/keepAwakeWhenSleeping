## if statement

if ($debug_level > 0) {
    # Something has gone wrong. Tell the user.
    say "Debug: Danger, Will Robinson, danger!";
    say "Debug: Answer was '54', expected '42'.";
}

## elsif statement

if ($city eq "New York") {
    say "New York is northeast of Washington, D.C.";
}
elsif ($city eq "Chicago") {
    say "Chicago is northwest of Washington, D.C.";
}
elsif ($city eq "Miami") {
    say "Miami is south of Washington, D.C. And much warmer!";
}
else {
    say "I don't know where $city is, sorry.";
}

## unless statement

unless ($destination eq $home) {
    say "I'm not going home.";
}
