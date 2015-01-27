Mia.Protocol.run.controller = function() {
  this.protocol_id = m.route.param('id') || false;
  this.protocol = Mia.Protocol.load(this.protocol_id);
  this.products = Mia.Protocol.products(this.protocol_id);
  this.run_id = m.route.param.bind(m.route.param, 'run');
  this.step_no = m.route.param.bind(m.route.param, 'step');
  return this;
}

Mia.Protocol.run.view = function(ctrl) {
  return m('h1', ctrl.run_id() + ' step: ' + ctrl.step_no());
};


