package MiaNet::Controller::Products;
use Mojo::Base 'Mojolicious::Controller';

sub fetch_for_protocol {
  my ($self) = shift;
  my $rs = $self->rs('Product')->search( { 'ingredients.protocol_id' => $self->stash('protocol_id') },
         { join => 'ingredients',
         result_class => 'DBIx::Class::ResultClass::HashRefInflator'
          });
  my %lookup = map { $_->{id} => $_ } $rs->all;
  $self->render(json => \%lookup );
}
1;

