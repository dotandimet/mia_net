// m.module(document.body, Mia.app);
m.module(document.getElementById('toolbar'), Mia.toolbar);

m.route(document.getElementById('workarea'), '/login',
  {
    '/login': Mia.login,
    '/protocol/list' : Mia.Protocol.list,
    '/protocol/:id/show' : Mia.Protocol.show,
    '/protocol/:id/show/ingredients' : Mia.Protocol.show,
    '/protocol/:id/show/steps' : Mia.Protocol.show,
    '/protocol/:id/edit' : Mia.Protocol.edit,
    '/protocol/:id/run' : Mia.Protocol.start,
    '/protocol/:id/run/:run' : Mia.Protocol.run,
    '/protocol/:id/run/:run/step/:step' : Mia.Protocol.run,
    '/protocol/create' : Mia.Protocol.edit,
    '/runs': Mia.runs
   });


