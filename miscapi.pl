use strict;
use warnings;

use Dancer2;

get "/v0/hello" => sub
{
  return "hello world from miscapi", 200;
};

dance;
