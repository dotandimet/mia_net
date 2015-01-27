package MiaNet;
use Mojo::Base 'Mojolicious';
use MiaNet::Model::Schema;

# This method will run once at server start
sub startup {
  my $self = shift;

  $self->secrets(['hackathons are for losers']);

  $self->plugin('Config');
  $self->plugin('AssetPack');

  $self->helper(
    db => sub {
      my $self = shift;

      # Mojo::Loader->new()->load('MiaNet::Model::Schema') &&
      return MiaNet::Model::Schema->connect($self->config('db'));
    }
  );
  $self->helper(
    rs => sub {
      my $self = shift;
      return $self->db->resultset(@_);
    }
  );

  $self->asset(
    'app.css' => '/css/normalize.css', '/css/skeleton.css', '/css/mia.css'
  );

  $self->asset(
    'app.js' => '/lib/mithril-0.1.27.js', '/js/mia.helpers.js',
    '/js/mia.runs.js',
    '/js/mia.models.js',
    '/js/mia.login.js', '/js/mia.toolbar.js',
    '/js/mia.protocol.base.js',
    '/js/mia.protocol.list.js',
    '/js/mia.protocol.show.js',
    '/js/mia.protocol.edit.js',
    '/js/mia.protocol.start.js',
    '/js/mia.protocol.run.js', '/js/mia.routes.js'
  );

  # Router
  my $r = $self->routes;

  # Paths handled by the SPA served by UI#show:
  $r->get('/')->to(controller => 'UI', action => 'show')->name('ui');
  $r->get('/protocol/*step')->to(controller => 'UI', action => 'show')->name('ui_protocol');
  $r->get('/runs')->to(controller => 'UI', action => 'show')->name('ui');
  $r->get('/login')->to(controller => 'UI', action => 'show')->name('ui_login');

  $r->post('/login')->to(controller => 'UI', action => 'login')->name('check_password');


  # Paths for DB Lookup:
  $r->get('/Products/for/:protocol_id')
    ->to('controller' => 'Products', action => 'fetch_for_protocol');
  $r->get('/Protocol/:id/details')
    ->to('controller' => 'Protocol', action => 'details');
  $r->get('/:table/list')->to('controller' => 'CRUD', 'action' => 'list');
  $r->post('/:table/create')->to('controller' => 'CRUD', 'action' => 'create');
}

1;
