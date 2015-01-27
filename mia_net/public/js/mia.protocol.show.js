(function(m, mp) {
mp.show = {};
mp.show.controller = function() {
  this.id = m.route.param('id') || false;
  this.protocol = mp.load(this.id);
  this.products = mp.products(this.id);
  return this;
}

mp.show.steps = function(ctrl) {
 var protocol = ctrl.protocol();
 var products = ctrl.products();
 var stage;
 return protocol.steps.sort(function(a,b) {
      return ( a.step < b.step) ? -1 : (a.step > b.step ) ? 1 : 0;
  }).map(function(step) {
      var els = [];
      if (!stage || step.stage.id !== stage) {
        els.push(m('h4', step.stage.title + '. ' + step.stage.description));
        stage = step.stage.id;
      }
      els.push( m('h5', { style: 'margin-left: 10px' }, step.step + '. ' + step.text ) );
      step.ingredients.forEach(function(ing){
          var product = products[ing.product_id];
          els.push( m('p', ing.quantity + ' ' + ing.units + ' of ' + product.name + ' [ ' + product.product_catalog + ' ]') );
      });
        return els;
  });
};

mp.show.ingredients = function(ctrl) {
  var protocol = ctrl.protocol();
  var products = ctrl.products();
  var headers = ['Name', 'Product Catalog', 'Quantity', 'Units'];
  var rows = [];
  protocol.steps.forEach(function(step) {
    step.ingredients.forEach(function(ing){
      var product = products[ing.product_id];
      rows.push( [ product.name, product.product_catalog, ing.quantity,  ing.units ] );
   })
  });
  return Mia.helpers.table({ rows: m.prop(rows), headers: m.prop(headers) });
};

mp.show.view = function(ctrl) {
  var protocol = ctrl.protocol();
  return m('div.row', [
      m('div.columns.eight', [
          m('h2', protocol.name), m('h3', protocol.description),
      ( ( m.route().match(/ingredients$/) ) ? mp.show.ingredients(ctrl) : mp.show.steps(ctrl) )
       ]),
      m('div.columns.two',
        [ m('p', [ 'Version:', m('i', protocol.version) ]),
          m('p', [ 'Status:', m('b', protocol.status) ]),
          m('p', [ 'Quantity:', m('b', protocol.base_quantity + ' ' + protocol.base_units) ]),
          m('p', m('a', { href: '/protocol/' + protocol.id + '/show/ingredients', config: m.route }, 'Ingredients') ),
          m('p', m('a', { href: '/protocol/' + protocol.id + '/show/steps', config: m.route }, 'Steps') ),
          m('a.button', { href: '/protocol/' + protocol.id + '/edit', config: m.route }, 'Edit Protocol'),
          m('a.button', { href: '/protocol/' + protocol.id + '/run', config: m.route }, 'Run!')
         ])
  ])
}
})(m, Mia.Protocol);


