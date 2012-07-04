
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "All my default Modules in a perl installation",
  "AUTHOR" => "Shantanu Bhadoria <shantanu\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Task-BeLike-Shantanu",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Task::BeLike::Shantanu",
  "PREREQ_PM" => {
    "Catalyst" => "5.90015",
    "Dist::Zilla" => "4.300020",
    "Dist::Zilla::Plugin::Git::CommitBuild" => "1.121820",
    "Dist::Zilla::Plugin::Git::NextVersion" => "1.121820",
    "Dist::Zilla::Plugin::InstallGuide" => "1.200000",
    "Dist::Zilla::Plugin::LatestPrereqs" => "0.4",
    "Dist::Zilla::Plugin::MetaConfig" => "4.300020",
    "Dist::Zilla::Plugin::MetaJSON" => "4.300020",
    "Dist::Zilla::Plugin::MetaResources" => "4.300020",
    "Dist::Zilla::Plugin::NextRelease" => "4.300020",
    "Dist::Zilla::Plugin::PkgVersion" => "4.300020",
    "Dist::Zilla::Plugin::Prereqs" => "4.300020",
    "Dist::Zilla::PluginBundle::Basic" => "4.300020",
    "Dist::Zilla::PluginBundle::Git" => "1.121820",
    "Starman" => "0.3001",
    "YAML" => "0.81",
    "YAML::XS" => "0.38"
  },
  "VERSION" => "0.003",
  "test" => {
    "TESTS" => ""
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



