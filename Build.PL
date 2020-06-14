use Module::Build;
my $build = Module::Build->new
      ( module_name    => 'CGI::Minimal',
        dist_author    => 'Jerilyn Franz <cpan@jerilyn.info>',
        dist_abstract  => 'A lightweight CGI form processing package',
        license        => 'mit',
        requires       => {
            'Carp' => 0,
            'perl' => '5.004',
        },
        build_requires => { },
      )->create_build_script;
