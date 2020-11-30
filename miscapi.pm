use strict;
use warnings;

package miscapi;
use Dancer2;

get "/v0/hello" => sub
{
  return "hello world from miscapi\n";
};

post "/v0/passphrase" => sub
{
  my $passphrase = 'mustang';

  if(body_parameters->get('phrase') eq $passphrase)
  {
    return "miscapi received correct passphrase\n";
  }
  else
  {
    return "bad passphrase sent to miscapi\n";
  }
};

1;
