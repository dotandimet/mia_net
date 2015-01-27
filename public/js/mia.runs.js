//model
(function(m, Mia){
var PageList = function() {
    return m.request({method: "GET", url: "/Unit/list"})
    .then(function(res){ return res.Unit; });
};

//controller
var controller = function() {
    var pages = PageList();
    return {
        pages: pages,
        rotate: function() {
            pages().push(pages().shift());
        }
    }
};

//view
var view = function(ctrl) {
    return [
        ctrl.pages().map(function(page) {
            return m("a", {href: page.type}, page.name);
        }),
        m("button", {onclick: ctrl.rotate}, "Rotate links")
    ];
};
Mia.runs = { controller: controller, view: view };
})(m, Mia || {});

