Mia.Protocol.all = function() {
  return m.request({method: "GET", url: "/Protocol/list"})
          .then(function(res){ console.log(res); return res.Protocol; });
};

Mia.Protocol.list.controller = function() {
  this.list = Mia.Protocol.all();
  this.headers = function() {
    return [ "id", "Name", "version", "status", "Description", "Quantity", "Actions"];
  }.bind(this);
  this.rows = function() {
    return this.list().map(function(item) {
      return [ item.id, item.name,
               item.version, item.status,
               item.description,
               item.base_quantity + ' ' + item.base_units,
            m('a', { href: '/protocol/' + item.id + '/show', config: m.route }, 'more')
         ] ;
      });
    }.bind(this);
   return this;
};

Mia.Protocol.list.view = function(ctrl) {
  return [ m('a.button', { href: '/protocol/create', config:
  m.route }, 'create new protocol')
  , Mia.helpers.table(ctrl) ];
};


