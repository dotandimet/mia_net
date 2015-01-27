  Mia.toolbar = {
      buttons : [ { path: '/protocol/list', title: 'Protocols' },
                  { path: '/runs', title: 'Runs' },
                  { path: '/login', title: 'Login' } ]
  };

  Mia.toolbar.controller = function() {
    this.buttons = Mia.toolbar.buttons;
    return this;
  };

  Mia.toolbar.view = function(ctrl) {
    var active = m.route();
    return ctrl.buttons.map(function(button) {
                return m('a.button', { config: m.route, href: button.path,
                style: 'margin-right: 10px',
                className: (( button.path === active ) ? 'button-primary' : '') }, button.title)
            });
  };


