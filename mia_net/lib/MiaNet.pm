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

  $r->get('/:table/list')->to('controller' => 'CRUD', 'action' => 'list');
  $r->post('/:table/create')->to('controller' => 'CRUD', 'action' => 'create');
}

1;
