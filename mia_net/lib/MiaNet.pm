package MiaNet;
use Mojo::Base 'Mojolicious';
use MiaNet::Model::Schema;

# This method will run once at server start
sub startup {
  my $self = shift;

  $self->plugin('Config');

  $self->helper( db => sub {
        my $self = shift;
        # Mojo::Loader->new()->load('MiaNet::Model::Schema') &&
          return MiaNet::Model::Schema->connect($self->config('db'));
  });
  $self->helper( rs => sub {
                my $self = shift;
                return $self->db->resultset(@_);
  });


  # Router
  my $r = $self->routes;
  $r->get('/Products/for/:protocol_id')->to('controller' => 'Products', action => 'fetch_for_protocol');
  $r->get('/Protocol/:id/details')->to('controller' => 'Protocol', action => 'details');
  $r->get('/:table/list')->to('controller' => 'CRUD', 'action' => 'list');
  $r->post('/:table/create')->to('controller' => 'CRUD', 'action' => 'create');
}

1;
