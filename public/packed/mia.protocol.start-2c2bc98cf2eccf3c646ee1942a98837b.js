Mia.Protocol.start = {};
Mia.Protocol.start.controller = function() {
  this.protocol_id = m.route.param('id') || false;
  this.protocol = Mia.Protocol.load(this.protocol_id);
  this.products = Mia.Protocol.products(this.protocol_id);
  this.user = Mia.common.user;
  this.start_time = m.prop(new Date);
  this.go = function() {
    if (!this.user.logged_in()) {
      alert('Please Login');
      return false;
    }
  }.bind(this);
  return this;
}

Mia.Protocol.start.view = function(ctrl) {
  var protocol = ctrl.protocol();
  return m('form', { onsubmit: ctrl.go },
            m('div.row', [
              m('div.columns.eight', [
          m('h2', protocol.name), m('h3', protocol.description),
          m('input[type=submit]', { value: 'Begin'} ),
      ] ), m('div.columns.two', [
            m('p', [ 'Version:', m('i', protocol.version) ]),
          m('p', [ 'Status:', m('b', protocol.status) ]),
            m('label', 'Date'), m('input',  { value: ctrl.start_time().toLocaleString() }),
            m('label', 'User'), m('input',  { value: ctrl.user().name() }),
            m('label', 'Quantity'), m('input',  { value: protocol.base_quantity }), m('span', protocol.units),
            m('input[type=hidden]', { name: 'start_time', value: ctrl.start_time().getTime() })
        ]) ]
  ) );
};


