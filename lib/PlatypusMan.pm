package PlatypusMan;

use strict;
use warnings;
use v5.10;
use Path::Class::File;
use Path::Class::Dir;
use File::ShareDir qw( dist_dir );

# ABSTRACT: Template based S5 Generation
# VERSION

=head1 BUNDLED FILES

=head2 s5

=head2 sh

=head2 themes

=head1 METHODS

=head2 Platypus::Man->share_dir

Returns the share directory for this dist in the form
of a L<Path::Class::Dir> object.

=cut

sub share_dir
{
  state $path;
  
  unless(defined $path)
  {
    if(defined $PlatypusMan::VERSION)
    {
      $path = Path::Class::Dir
        ->new(dist_dir('PlatypusMan'));
    }
    else
    {
      $path = Path::Class::File
        ->new($INC{'PlatypusMan.pm'})
        ->absolute
        ->dir
        ->parent
        ->subdir('share');
    }
  }
  
  $path;
}

1;
