package MiaNet::Controller::CRUD;
use Mojo::Base 'Mojolicious::Controller';
use Mojo::JSON qw(decode_json);

sub list {
  my $self = shift;
  my $table = $self->stash('table');
  $self->app->log->debug("Got table name: $table");
  my $rs = $self->rs($table);
  if (!$rs) {
    $self->render(json => { error => "table $table doesn't seem to exist" });
  }
  else {
    my $res = $rs->search( {}, { result_class => 'DBIx::Class::ResultClass::HashRefInflator' } );
    $self->render(json => { $table => [ $res->all ] });
  }
};

sub create {
  my $self = shift;
  my $table = $self->stash('table');
  $self->app->log->debug("Got table name: $table");
  my $rs = $self->rs($table);
  if (!$rs) {
    $self->render(json => { error => "table $table doesn't seem to exist" });
  }
  else {
  my $data = ($self->req->headers->content_type =~ /json/) ? $self->req->json : json_decode $self->param('data');
  my $result = $rs->create($data);
  $self->render(json => ($result) ? { success => \1, $table => $result } : { error => 'failed to create object' } );
}
}

sub fetch {
  my $self = shift;
  my $table = $self->stash('table');
  $self->app->log->debug("Got table name: $table");
  my $rs = $self->rs($table);
  if (!$rs) {
    $self->render(json => { error => "table $table doesn't seem to exist" });
  }
  else {
  my $data = ($self->req->headers->content_type =~ /json/) ? $self->req->json : json_decode $self->param('data');
  my $result = $rs->create($data);
  $self->render(json => ($result) ? { success => \1, $table => $result } : { error => 'failed to create object' } );
}
}

1;

