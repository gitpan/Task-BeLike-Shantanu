#!perl

use strict;
use warnings;

use Test::More tests => 1;

use ExtUtils::MakeMaker;
use File::Spec::Functions;
use List::Util qw/max/;

my @modules = qw(
    Acme::CPANAuthors::India
  App::cpanminus
  App::cpanoutdated
  Catalyst
  DBIx::Class
  Data::Dumper
  Device::SerialPort
  Digest::MD5
  Dist::Zilla
  Dist::Zilla::PluginBundle::SHANTANU
  ExtUtils::MakeMaker
  ExtUtils::ParseXS
  File::ChangeNotify
  File::Copy
  File::Find
  File::Find::Rule
  File::HomeDir
  File::Spec
  File::Spec::Functions
  File::Temp
  File::UStore
  IO::Handle
  IO::Socket
  JSON::XS
  List::Util
  Log::Log4perl
  Moose
  Net::IP
  Net::SSLeay
  Perl::Critic
  Perl::Tidy
  Pod::Weaver::PluginBundle::SHANTANU
  Printer::Thermal
  Starman
  Test::More
  YAML
  YAML::XS
  autodie
  perl
  strict
  warnings
);

# replace modules with dynamic results from MYMETA.json if we can
# (hide CPAN::Meta from prereq scanner)
my $cpan_meta = "CPAN::Meta";
if ( -f "MYMETA.json" && eval "require $cpan_meta" ) {    ## no critic
    if ( my $meta = eval { CPAN::Meta->load_file("MYMETA.json") } ) {
        my $prereqs = $meta->prereqs;
        delete $prereqs->{develop};
        my %uniq =
          map { $_ => 1 } map { keys %$_ } map { values %$_ } values %$prereqs;
        $uniq{$_} = 1 for @modules;    # don't lose any static ones
        @modules = sort keys %uniq;
    }
}

my @reports = [qw/Version Module/];

for my $mod (@modules) {
    next if $mod eq 'perl';
    my $file = $mod;
    $file =~ s{::}{/}g;
    $file .= ".pm";
    my ($prefix) = grep { -e catfile( $_, $file ) } @INC;
    if ($prefix) {
        my $ver = MM->parse_version( catfile( $prefix, $file ) );
        $ver = "undef" unless defined $ver;    # Newer MM should do this anyway
        push @reports, [ $ver, $mod ];
    }
    else {
        push @reports, [ "missing", $mod ];
    }
}

if (@reports) {
    my $vl = max map { length $_->[0] } @reports;
    my $ml = max map { length $_->[1] } @reports;
    splice @reports, 1, 0, [ "-" x $vl, "-" x $ml ];
    diag "Prerequisite Report:\n",
      map { sprintf( "  %*s %*s\n", $vl, $_->[0], -$ml, $_->[1] ) } @reports;
}

pass;

# vim: ts=2 sts=2 sw=2 et:
