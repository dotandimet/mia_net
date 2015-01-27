var Mia = {};
  Mia.helpers = {};
  Mia.helpers.values = function(obj) {
    var vals = [];
    for (var i in obj) {
      vals.push(obj[i]);
    }
    return vals;
  };
  Mia.helpers.table = function(ctrl) {
      return m('table', [
            m('thead',
              m('tr',
                ctrl.headers().map( function(head) {
                  return m('th', head);
                })
              )
            ),
          m('tbody',
            ctrl.rows().map(function(row) {
              return m('tr',
                row.map(function(cell) {
                  return m('td', cell)
                }) )
            } )
          ) ]);
  };


