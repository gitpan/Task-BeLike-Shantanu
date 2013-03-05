
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "All my default Modules in a perl installation",
  "AUTHOR" => "Shantanu Bhadoria <shantanu\@cpan.org>",
  "BUILD_REQUIRES" => {
    "File::Find" => 0,
    "File::Spec::Functions" => 0,
    "File::Temp" => 0,
    "List::Util" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Task-BeLike-Shantanu",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Task::BeLike::Shantanu",
  "PREREQ_PM" => {
    "Acme::CPANAuthors::India" => 0,
    "App::cpanminus" => 0,
    "App::cpanoutdated" => 0,
    "Catalyst" => "5.90000",
    "DBIx::Class" => 0,
    "Data::Dumper" => "2.14",
    "Device::SerialPort" => 0,
    "Digest::MD5" => 0,
    "Dist::Zilla" => "4.300000",
    "Dist::Zilla::PluginBundle::SHANTANU" => 0,
    "ExtUtils::MakeMaker" => "6.60",
    "ExtUtils::ParseXS" => "3.10",
    "File::ChangeNotify" => "0.23",
    "File::Copy" => "2.20",
    "File::Find::Rule" => "0.33",
    "File::HomeDir" => "1.00",
    "File::Spec" => "3.40",
    "File::UStore" => 0,
    "IO::Handle" => 0,
    "IO::Socket" => 0,
    "JSON::XS" => 0,
    "Log::Log4perl" => "1.40",
    "Moose" => "2.06",
    "Net::IP" => 0,
    "Perl::Critic" => 0,
    "Perl::Tidy" => 0,
    "Pod::Weaver::PluginBundle::SHANTANU" => 0,
    "Printer::Thermal" => 0,
    "Starman" => "0.30",
    "YAML" => "0.84",
    "YAML::XS" => "0.38",
    "autodie" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.05",
  "test" => {
    "TESTS" => "t/*.t"
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



