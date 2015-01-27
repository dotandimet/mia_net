Mia.Protocol = {
// modules:
  list: {},
  show: {},
  edit: {},
  run: {}
};

Mia.Protocol.load = function(id) {
    if (!id) return Mia.Protocol.stub ;
    return m.request({method: "GET", url: "/Protocol/"+id+"/details"})
    .then(function(res){ return res.Protocol; });
};

Mia.Protocol.stub = function() {
  return {
      name : 'nada',
      description: '',
      version: 1,
      'status': 'draft',
      base_quantity: 0,
      base_units: 'ml',
      steps: []
   };
};

Mia.Protocol.products = function(id) {
    if (!id) return [];
    return m.request({method: "GET", url: "/Products/for/" + id});
};


