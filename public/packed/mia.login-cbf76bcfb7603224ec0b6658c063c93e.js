  Mia.common = {}; // persist
  Mia.login = {};
  Mia.common.user = m.prop(new Mia.User());
  Mia.login.controller = function() {
    var c = this;
    c.user = Mia.common.user; // singleton?
    c.logout = function() {
       console.log(c.user().id());
       c.user().logout(); // set to new, empty user
       console.log(" After logout: " + c.user().id());
       return false;
    };
    c.doLogin = function() {
       m.request({method: 'POST', url: '/login', data: c.user })
        .then( function(res) {
              if (res.invalid) {
                alert('Invalid User/Password');
              }
              else {
                c.user( new Mia.User(res) );
                m.route('/protocol/list');
              }
            }, function(e) { alert(e); } );
       return false;
    };
   return this;
  };
  Mia.login.view = function(ctrl) {
    if (ctrl.user().logged_in()) {
      return [ m('h4', 'logged in as ' + ctrl.user().name()), m('a.button-primary.button', { onclick: ctrl.logout }, 'Log Out' ) ]
    }
    else {
      return m('form', { style: 'margin-top: 5%', onsubmit: ctrl.doLogin }, [
            m('label', 'User'),
            m('input[type=text][name=name]', { value: ctrl.user().name(), onchange: m.withAttr('value', ctrl.user().name) } ),
            m('label', 'Password'),
            m('input[type=password][name=password]', { value: ctrl.user().password(), onchange: m.withAttr('value', ctrl.user().password) }),
            m('div', m('input', { type: 'submit', value: 'Login', className: 'button-primary' }))
          ]);
    }
  };


