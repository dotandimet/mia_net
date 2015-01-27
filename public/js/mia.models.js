Mia.Model = function(defaults, config) {
  var obj = {}; // this? who this?
  config = config || {};
  for(var p in defaults) {
    var val = (config[p] === undefined) ? defaults[p] : config[p];
    obj[p] = m.prop(val);
  }
  return obj;
};

// TODO: Incorporate request caching as shown here: 
// http://lhorie.github.io/mithril-blog/piggybacking-requests-in-a-widgety-world.html
Mia.Store = function(url, ctor) {
  var cache = []; // assuming keys are ids - numbers, not strings
  var load = function(id) {
    return m.request({method: 'GET', url: url + '/' + id, type: ctor})
            .then(function(res) { return cache[id] = res; });
  };
  this.get = function(id) {
    return ((cache[id]) ? cache[id] : load(id) );
  };
  return this;
};

Mia.User = function(config) {
  var obj = new Mia.Model({
      name: '',
      password: '',
      id: false
  }, config);
  obj.logged_in = function() {
    return (obj.id()) ? true : false
  };
  obj.logout = function() {
    obj.id(false);
  };
  return obj;
}
