use strict;

use lib  ('./blib','../blib', './lib', '../lib');

unless ($ENV{'TEST_POD_COVERAGE'}) {
    $|++;
    print "1..0 # Skipped: To enable POD coverage test set TEST_POD_COVERAGE=1\n";
    exit;
}
eval {
    require Test::More;
};
if ($@) {
    $|++;
    print "1..0 # Skipped: Test::More required for testing POD coverage\n";
    exit;
}
eval {
    require Test::Pod::Coverage;
};
if ($@ or (not defined $Test::Pod::Coverage::VERSION) or ($Test::Pod::Coverage::VERSION < 1.06)) {
    Test::More::plan (skip_all => "Test::Pod::Coverage 1.06 required for testing POD coverage");
    exit;
}

Test::More::plan (tests => 1);
Test::Pod::Coverage::pod_coverage_ok( 'CGI::Minimal', { also_private => ['DEBUG'] });
