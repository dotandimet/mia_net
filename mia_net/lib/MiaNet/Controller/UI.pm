package MiaNet::Controller::UI;
use Mojo::Base 'Mojolicious::Controller';

sub show {
  my $c = shift;
#  $c->reply->static('index.html');
  $c->render(template => 'UI/show');
}

sub login {
  my $c = shift;
  my $data = ($c->req->headers->content_type =~ /json/) ? $c->req->json : $c->req->params->to_hash;

  my $name = $data->{'name'};
  my $password = $data->{'password'};
  my $user = $c->rs('User')->search({ name => $name, password => $password })->single;
  if ($user) {
    my %hash = ( id => $user->id, name => $user->name );
    $c->render(json => \%hash);
  }
  else {
    $c->render(json => { invalid => Mojo::JSON->true, name => $name, password => $password });
  }
}

1;
