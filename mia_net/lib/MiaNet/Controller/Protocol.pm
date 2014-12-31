package MiaNet::Controller::Protocol;
use Mojo::Base 'Mojolicious::Controller';
use Mojo::JSON qw(decode_json);

sub details {
  my $self = shift;
  my $protocol_id = $self->stash('id');
  $self->app->log->debug("Got protocol id: $protocol_id");
  my $res = $self->rs('Protocol')->search( { 'me.id' => $protocol_id },
       { prefetch => { 'steps' => [ 'stage', 'ingredients', 'record_fields' ],
                       'ingredients' => ['product'] },
         result_class => 'DBIx::Class::ResultClass::HashRefInflator'
       } );
  $self->render(json => { 'Protocol' => $res->all });
};

1;
