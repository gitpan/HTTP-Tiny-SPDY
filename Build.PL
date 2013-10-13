
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "A subclass of HTTP::Tiny with SPDY support",
  "dist_author" => [
    "Michal Wojciechowski <odyniec\@cpan.org>"
  ],
  "dist_name" => "HTTP-Tiny-SPDY",
  "dist_version" => "0.010",
  "license" => "perl",
  "module_name" => "HTTP::Tiny::SPDY",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "HTTP::Tiny" => 0,
    "IO::Socket" => 0,
    "IO::Socket::SSL" => "1.42",
    "Net::SPDY::Session" => 0,
    "Net::SSLeay" => "1.49",
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => [],
  "test_requires" => {
    "Data::Dumper" => 0,
    "Exporter" => 0,
    "File::Basename" => 0,
    "File::Spec" => 0,
    "File::Temp" => 0,
    "IO::Dir" => 0,
    "IO::File" => 0,
    "IO::Socket::INET" => 0,
    "IO::Socket::SSL" => "1.56",
    "IPC::Cmd" => 0,
    "Mozilla::CA" => 0,
    "Test::More" => "0.96",
    "open" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
