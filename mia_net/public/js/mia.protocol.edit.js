Mia.Protocol.edit.controller = Mia.Protocol.show.controller;
Mia.Protocol.edit.view = function(ctrl) {
  var protocol = ctrl.protocol();
  return m('form',
            m('div.row', [
              m('div.columns.eight', [
        m('label', 'Name'),
        m('input.u-full-width', { name: 'name', value: protocol.name }),
        m('label', 'Description'),
        m('input.u-full-width', { name: 'description', value: protocol.description })
      ] ), m('div.columns.two', [
            m('label', 'Version'), m('input', { value: protocol.version }),
            m('label', 'Status'), m('input',  { value: protocol.status }),
            m('label', 'Quantity'), m('input',  { value: protocol.base_quantity }),
            m('label', 'units'), m('select', ['ml', 'gr'].map(function(u) { return m('option', u) }))
        ]) ]
  ) );
};


