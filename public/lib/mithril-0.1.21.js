/*
Mithril v0.1.21
http://github.com/lhorie/mithril.js
(c) Leo Horie
License: MIT
*/
Mithril=m=new function a(b,c){function d(){for(var a,b=arguments,c=(!(null==b[1]||"[object Object]"!=D.call(b[1])||"tag"in b[1]||"subtree"in b[1])),d=c?b[1]:{},e=("class"in d?"class":"className"),f={tag:"div",attrs:{}},g=[];a=E.exec(b[0]);)if(""==a[1])f.tag=a[2];else if("#"==a[1])f.attrs.id=a[2];else if("."==a[1])g.push(a[2]);else if("["==a[3][0]){var h=F.exec(a[3]);f.attrs[h[1]]=h[3]||(h[2]?"":!0)}g.length>0&&(f.attrs[e]=g.join(" ")),f.children=c?b[2]:b[1];for(var i in d)f.attrs[i]=i==e?(f.attrs[i]||"")+" "+d[i]:d[i];return f}function e(a,d,h,k,l,m,n,o,p,q,r){if(null==l&&(l=""),"retain"===l.subtree)return m;var s=D.call(m),t=D.call(l);if(null==m||s!=t){if(null!=m)if(h&&h.nodes){var u=o-k,v=u+("[object Array]"==t?l:m.nodes).length;g(h.nodes.slice(u,v),h.slice(u,v))}else m.nodes&&g(m.nodes,m);m=new l.constructor,m.nodes=[]}if("[object Array]"==t){l=j(l);for(var w=[],x=m.length===l.length,y=0,z=1,A=2,B=3,C={},E=[],F=!1,H=0;H<m.length;H++)m[H]&&m[H].attrs&&null!=m[H].attrs.key&&(F=!0,C[m[H].attrs.key]={action:z,index:H});if(F){for(var H=0;H<l.length;H++)if(l[H]&&l[H].attrs)if(null!=l[H].attrs.key){var I=l[H].attrs.key;C[I]=C[I]?{action:B,index:H,from:C[I].index,element:a.childNodes[C[I].index]}:{action:A,index:H}}else E.push({index:H,element:a.childNodes[H]});for(var J,K=Object.keys(C).map(function(a){return C[a]}),L=K.sort(function(a,b){return a.action-b.action||a.index-b.index}),M=m.slice(),H=0;J=L[H];H++){if(J.action==z&&(g(m[J.index].nodes,m[J.index]),M.splice(J.index,1)),J.action==A){var N=b.document.createElement("div");N.key=l[J.index].attrs.key,a.insertBefore(N,a.childNodes[J.index]),M.splice(J.index,0,{attrs:{key:l[J.index].attrs.key},nodes:[N]})}J.action==B&&(a.childNodes[J.index]!==J.element&&null!==J.element&&a.insertBefore(J.element,a.childNodes[J.index]),M[J.index]=m[J.from])}for(var H=0;H<E.length;H++){var J=E[H];a.insertBefore(J.element,a.childNodes[J.index]),M[J.index]=m[J.index]}m=M,m.nodes=[];for(var O,H=0;O=a.childNodes[H];H++)m.nodes.push(O)}for(var H=0,P=0;H<l.length;H++){var Q=e(a,d,m,o,l[H],m[P],n,o+y||y,p,q,r);if(Q!==c){Q.nodes.intact||(x=!1);var R="[object Array]"==D.call(Q);y+=R?Q.length:1,m[P++]=Q}}if(!x){for(var H=0;H<l.length;H++)null!=m[H]&&(w=w.concat(m[H].nodes));for(var S,H=0;S=m.nodes[H];H++)null!=S.parentNode&&w.indexOf(S)<0&&g([S],[m[H]]);for(var S,H=m.nodes.length;S=w[H];H++)null==S.parentNode&&a.appendChild(S);l.length<m.length&&(m.length=l.length),m.nodes=w}}else if(null!=l&&"[object Object]"==t){if((l.tag!=m.tag||Object.keys(l.attrs).join()!=Object.keys(m.attrs).join()||l.attrs.id!=m.attrs.id)&&(g(m.nodes),m.configContext&&"function"==typeof m.configContext.onunload&&m.configContext.onunload()),"string"!=typeof l.tag)return;var S,T=0===m.nodes.length;l.attrs.xmlns?q=l.attrs.xmlns:"svg"===l.tag?q="http://www.w3.org/2000/svg":"math"===l.tag&&(q="http://www.w3.org/1998/Math/MathML"),T?(S=q===c?b.document.createElement(l.tag):b.document.createElementNS(q,l.tag),m={tag:l.tag,children:e(S,l.tag,c,c,l.children,m.children,!0,0,l.attrs.contenteditable?S:p,q,r),attrs:f(S,l.tag,l.attrs,{},q),nodes:[S]},a.insertBefore(S,a.childNodes[o]||null)):(S=m.nodes[0],f(S,l.tag,l.attrs,m.attrs,q),m.children=e(S,l.tag,c,c,l.children,m.children,!1,0,l.attrs.contenteditable?S:p,q,r),m.nodes.intact=!0,n===!0&&null!=S&&a.insertBefore(S,a.childNodes[o]||null)),"function"==typeof l.attrs.config&&r.push(l.attrs.config.bind(b,S,!T,m.configContext=m.configContext||{},m))}else if("function"!=typeof t){var w;0===m.nodes.length?(l.$trusted?w=i(a,o,l):(w=[b.document.createTextNode(l)],a.nodeName.match(G)||a.insertBefore(w[0],a.childNodes[o]||null)),m="string number boolean".indexOf(typeof l)>-1?new l.constructor(l):l,m.nodes=w):m.valueOf()!==l.valueOf()||n===!0?(w=m.nodes,p&&p===b.document.activeElement||(l.$trusted?(g(w,m),w=i(a,o,l)):"textarea"===d?a.value=l:p?p.innerHTML=l:((1==w[0].nodeType||w.length>1)&&(g(m.nodes,m),w=[b.document.createTextNode(l)]),a.insertBefore(w[0],a.childNodes[o]||null),w[0].nodeValue=l)),m=new l.constructor(l),m.nodes=w):m.nodes.intact=!0}return m}function f(a,c,d,e,f){for(var g in d){var h=d[g],i=e[g];if(!(g in e)||i!==h||a===b.document.activeElement){if(e[g]=h,"config"===g)continue;if("function"==typeof h&&0==g.indexOf("on"))a[g]=k(h,a);else if("style"===g&&"object"==typeof h){for(var j in h)(null==i||i[j]!==h[j])&&(a.style[j]=h[j]);for(var j in i)j in h||(a.style[j]="")}else null!=f?"href"===g?a.setAttributeNS("http://www.w3.org/1999/xlink","href",h):"className"===g?a.setAttribute("class",h):a.setAttribute(g,h):"value"===g&&"input"===c?a.value!==h&&(a.value=h):g in a&&"list"!=g&&"style"!=g?a[g]=h:a.setAttribute(g,h)}}return e}function g(a,b){for(var c=a.length-1;c>-1;c--)a[c]&&a[c].parentNode&&(a[c].parentNode.removeChild(a[c]),b=[].concat(b),b[c]&&h(b[c]));0!=a.length&&(a.length=0)}function h(a){if(a.configContext&&"function"==typeof a.configContext.onunload&&a.configContext.onunload(),a.children)if("[object Array]"==D.call(a.children))for(var b=0;b<a.children.length;b++)h(a.children[b]);else a.children.tag&&h(a.children)}function i(a,c,d){var e=a.childNodes[c];if(e){var f=1!=e.nodeType,g=b.document.createElement("span");f?(a.insertBefore(g,e),g.insertAdjacentHTML("beforebegin",d),a.removeChild(g)):e.insertAdjacentHTML("beforebegin",d)}else a.insertAdjacentHTML("beforeend",d);for(var h=[];a.childNodes[c]!==e;)h.push(a.childNodes[c]),c++;return h}function j(a){for(var b=[],c=0;c<a.length;c++){var d=a[c];"[object Array]"==D.call(d)?b.push.apply(b,j(d)):b.push(d)}return b}function k(a,b){return function(c){c=c||event,d.redraw.strategy("diff"),d.startComputation();try{return a.call(b,c)}finally{N||(N=-1),d.endComputation()}}}function l(a){var b=I.indexOf(a);return 0>b?I.push(a)-1:b}function m(a){var b=function(){return arguments.length&&(a=arguments[0]),a};return b.toJSON=function(){return a},b}function n(){for(var a=d.redraw.strategy(),b=0;b<K.length;b++)M[b]&&"none"!=a&&d.render(K[b],L[b].view(M[b]),"all"==a);O&&(O(),O=null),N=null,d.redraw.strategy("diff")}function o(a){return a.slice(R[d.route.mode].length)}function p(a,b,c){T={};var e=c.indexOf("?");-1!==e&&(T=t(c.substr(e+1,c.length)),c=c.substr(0,e));for(var f in b){if(f==c)return d.module(a,b[f]),!0;var g=new RegExp("^"+f.replace(/:[^\/]+?\.{3}/g,"(.*?)").replace(/:[^\/]+/g,"([^\\/]+)")+"/?$");if(g.test(c))return c.replace(g,function(){for(var c=f.match(/:[^\/]+/g)||[],e=[].slice.call(arguments,1,-2),g=0;g<c.length;g++)T[c[g].replace(/:|\./g,"")]=decodeURIComponent(e[g]);d.module(a,b[f])}),!0}}function q(a){a=a||event,a.ctrlKey||a.metaKey||2==a.which||(a.preventDefault(),d.route(a.currentTarget[d.route.mode].slice(R[d.route.mode].length)))}function r(){"hash"!=d.route.mode&&b.location.hash?b.location.hash=b.location.hash:b.scrollTo(0,0)}function s(a,b){var c=[];for(var d in a){var e=b?b+"["+d+"]":d,f=a[d];c.push("object"==typeof f?s(f,e):encodeURIComponent(e)+"="+encodeURIComponent(f))}return c.join("&")}function t(a){for(var b=a.split("&"),c={},d=0;d<b.length;d++){var e=b[d].split("=");c[u(e[0])]=e[1]?u(e[1]):1===e.length?!0:""}return c}function u(a){return decodeURIComponent(a.replace(/\+/g," "))}function v(a){var b=l(a);g(a.childNodes,J[b]),J[b]=c}function w(a,b){return a.then=function(){var a=d.prop();return w(a,b.then.apply(b,arguments).then(a))},a.promise=a,a.resolve=function(c){return a(c),b=b.resolve.apply(b,arguments),a},a.reject=function(){return b=b.reject.apply(b,arguments),a},a}function x(a,b){function c(a,b,c,d){if("object"!=typeof g&&"function"!=typeof g||"function"!=typeof a)d();else try{var e=0;a.call(g,function(a){e++||(g=a,b())},function(a){e++||(g=a,c())})}catch(f){g=f,c()}}function d(){var h;try{h=g&&g.then}catch(j){return g=j,f=2,d()}c(h,function(){f=1,d()},function(){f=2,d()},function(){try{1==f&&"function"==typeof a?g=a(g):2==f&&"function"==typeof b&&(g=b(g),f=1)}catch(d){return g=d,i()}g==e?(g=TypeError(),i()):c(h,function(){i(3)},i,function(){i(1==f&&3)})})}var e=this,f=0,g=0,h=[];e.promise=e,e.resolve=function(a){return f||(g=a,f=1,d()),this},e.reject=function(a){return f||(g=a,f=2,d()),this},e.then=function(a,b){var c=new x(a,b);return 3==f?c.resolve(g):4==f?c.reject(g):h.push(c),c};var i=function(a){f=a||4,h.map(function(a){3==f&&a.resolve(g)||a.reject(g)})}}function y(a){return a}function z(a){var c=new b.XMLHttpRequest;if(c.open(a.method,a.url,!0,a.user,a.password),c.onreadystatechange=function(){4===c.readyState&&(c.status>=200&&c.status<300?a.onload({type:"load",target:c}):a.onerror({type:"error",target:c}))},a.serialize==JSON.stringify&&"GET"!=a.method&&c.setRequestHeader("Content-Type","application/json; charset=utf-8"),"function"==typeof a.config){var d=a.config(c,a);null!=d&&(c=d)}return c.send("GET"==a.method?"":a.data),c}function A(a,b,c){return b&&Object.keys(b).length>0&&("GET"==a.method?a.url=a.url+(a.url.indexOf("?")<0?"?":"&")+s(b):a.data=c(b)),a}function B(a,b){var c=a.match(/:[a-z]\w+/gi);if(c&&b)for(var d=0;d<c.length;d++){var e=c[d].slice(1);a=a.replace(c[d],b[e]),delete b[e]}return a}var C,D={}.toString,E=/(?:(^|#|\.)([^#\.\[\]]+))|(\[.+?\])/g,F=/\[(.+?)(?:=("|'|)(.*?)\2)?\]/,G=/AREA|BASE|BR|COL|COMMAND|EMBED|HR|IMG|INPUT|KEYGEN|LINK|META|PARAM|SOURCE|TR‌​ACK|WBR/,H={insertAdjacentHTML:function(a,c){b.document.write(c),b.document.close()},appendChild:function(a){C===c&&(C=b.document.createElement("html")),"HTML"==a.nodeName?C=a:C.appendChild(a),b.document.documentElement&&b.document.documentElement!==C?b.document.replaceChild(C,b.document.documentElement):b.document.appendChild(C)},insertBefore:function(a){this.appendChild(a)},childNodes:[]},I=[],J={};d.render=function(a,d,f){var h=[];if(!a)throw new Error("Please ensure the DOM element exists before rendering a template into it.");var i=l(a),j=a==b.document||a==b.document.documentElement?H:a;J[i]===c&&g(j.childNodes),f===!0&&v(a),J[i]=e(j,null,c,c,d,J[i],!1,0,null,c,h);for(var k=0;k<h.length;k++)h[k]()},d.trust=function(a){return a=new String(a),a.$trusted=!0,a},d.prop=function(a){if(("object"==typeof a||"function"==typeof a)&&"function"==typeof a.then){var b=m();return w(b,a).then(b),b}return m(a)};var K=[],L=[],M=[],N=0,O=null;d.module=function(a,b){var c=K.indexOf(a);0>c&&(c=K.length);var e=!1;if(M[c]&&"function"==typeof M[c].onunload){var f={preventDefault:function(){e=!0}};M[c].onunload(f)}e||(d.redraw.strategy("all"),d.startComputation(),K[c]=a,L[c]=b,M[c]=new b.controller,d.endComputation())},d.redraw=function(a){var c=b.cancelAnimationFrame||b.clearTimeout,d=b.requestAnimationFrame||b.setTimeout;N&&a!==!0?(c(N),N=d(n,0)):(n(),N=d(function(){N=null},0))},d.redraw.strategy=d.prop();var P=0;d.startComputation=function(){P++},d.endComputation=function(){P=Math.max(P-1,0),0==P&&d.redraw()},d.withAttr=function(a,b){return function(c){c=c||event;var d=c.currentTarget||this;b(a in d?d[a]:d.getAttribute(a))}};var Q,R={pathname:"",hash:"#",search:"?"},S=function(){},T={};return d.route=function(){if(0===arguments.length)return Q;if(3===arguments.length&&"string"==typeof arguments[1]){var a=arguments[0],c=arguments[1],e=arguments[2];S=function(b){var f=Q=o(b);p(a,e,f)||d.route(c,!0)};var f="hash"==d.route.mode?"onhashchange":"onpopstate";b[f]=function(){Q!=o(b.location[d.route.mode])&&S(b.location[d.route.mode])},O=r,b[f]()}else if(arguments[0].addEventListener){var g=arguments[0],h=arguments[1];g.href.indexOf(R[d.route.mode])<0&&(g.href=b.location.pathname+R[d.route.mode]+g.pathname),h||(g.removeEventListener("click",q),g.addEventListener("click",q))}else if("string"==typeof arguments[0]){Q=arguments[0];var i="object"==typeof arguments[1]?s(arguments[1]):null;i&&(Q+=(-1===Q.indexOf("?")?"?":"&")+i);var j=(3==arguments.length?arguments[2]:arguments[1])===!0;b.history.pushState?(O=function(){b.history[j?"replaceState":"pushState"](null,b.document.title,R[d.route.mode]+Q),r()},S(R[d.route.mode]+Q)):b.location[d.route.mode]=Q}},d.route.param=function(a){return T[a]},d.route.mode="search",d.deferred=function(){return w(d.prop(),new x)},d.sync=function(a){function b(a,b){return function(d){return g[a]=d,b||(c="reject"),0==--f&&(e.promise(g),e[c](g)),d}}var c="resolve",e=d.deferred(),f=a.length,g=new Array(f);if(a.length>0)for(var h=0;h<a.length;h++)a[h].then(b(h,!0),b(h,!1));else e.resolve();return e.promise},d.request=function(a){a.background!==!0&&d.startComputation();var b=d.deferred(),c=a.serialize=a.serialize||JSON.stringify,e=a.deserialize=a.deserialize||JSON.parse,f=a.extract||function(a){return 0===a.responseText.length&&e===JSON.parse?null:a.responseText};return a.url=B(a.url,a.data),a=A(a,a.data,c),a.onload=a.onerror=function(c){try{c=c||event;var g=("load"==c.type?a.unwrapSuccess:a.unwrapError)||y,h=g(e(f(c.target,a)));if("load"==c.type)if("[object Array]"==D.call(h)&&a.type)for(var i=0;i<h.length;i++)h[i]=new a.type(h[i]);else a.type&&(h=new a.type(h));b["load"==c.type?"resolve":"reject"](h)}catch(c){if(c instanceof SyntaxError)throw new SyntaxError("Could not parse HTTP response. See http://lhorie.github.io/mithril/mithril.request.html#using-variable-data-formats");if("[object Error]"==D.call(c)&&c.constructor!==Error)throw c;b.reject(c)}a.background!==!0&&d.endComputation()},z(a),b.promise},d.deps=function(a){return b=a},d.deps.factory=a,d}("undefined"!=typeof window?window:{}),"undefined"!=typeof module&&null!==module&&(module.exports=m),"function"==typeof define&&define.amd&&define(function(){return m});
//# sourceMappingURL=mithril.min.map