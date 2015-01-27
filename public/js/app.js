Mia.common.run = {

};
Mia.Protocol.run.controller = function() {
  this.protocol_id = m.prop(m.route.param('id') || false);
  this.protocol = m.prop(Mia.Protocol.load(this.protocol_id));
  this.products = m.prop(Mia.Protocol.products(this.protocol_id));
  this.run_id = m.prop(m.route.param('run'));
  console.log('
  if (this.run_id() === undefined) this.run_id("foo");
  this.step_no = m.prop(m.route.param('step'));
  if (this.step_no() === undefined) this.step_no("foo");
  return this;
}

Mia.Protocol.run.view = function(ctrl) {
  return m('h1', ctrl.run_id() + ' step: ' + ctrl.step_no());
};


