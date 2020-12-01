use strict;
use warnings;

package miscapi;
use Dancer2;
use Dancer2::Core::Error;

set 'logger' => 'console';
# when set to console, logs go to same place as starman
set 'show_error' => 1;

sub _log_dancer_errors
{
  my $error = shift;
  error "type:".$error->type;
  error "title:".$error->title;
  error "status:".$error->status;
  error "msg:".$error->message;
}

sub _dump_dancer_errors
{
  my $error = shift;
  error $error->dumper;
}


hook init_error => sub { _log_dancer_errors(shift); };
hook before_error => sub { _log_dancer_errors(shift); };
hook on_route_exception => sub {
  my ($app, $error) = @_;
  _log_dancer_errors($error);
};

get "/v0/hello" => sub
{
  info "/v0/hello";
  return "hello world from miscapi\n";
};

post "/v0/passphrase" => sub
{
  info "/v0/passphrase";
  debug "req tostring: @{[ request->to_string ]}";
  debug "req content: @{[ request->content ]}";
#  debug "is get: @{[ request->is_get ]}";
#  debug "is post: @{[ request->is_post ]}";
  #see man Dancer2::Core::Request

  my $passphrase = 'mustang';

  if(body_parameters->get('phrase') eq $passphrase)
  {
    info "retval: miscapi received correct passphrase";
    return "miscapi received correct passphrase\n";
  }
  else
  {
    info "retval: bad passphrase sent to miscapi";
    return "bad passphrase sent to miscapi\n";
  }
};

1;
