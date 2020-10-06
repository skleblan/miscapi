use strict;
use warnings;

package miscapi;
use Dancer2;

get "/v0/hello" => sub
{
  return "hello world from miscapi\n";
};

1;
