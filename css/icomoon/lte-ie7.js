/* Load this script using conditional IE comments if you need to support IE 7 and IE 6. */

window.onload = function() {
	function addIcon(el, entity) {
		var html = el.innerHTML;
		el.innerHTML = '<span style="font-family: \'icomoon\'">' + entity + '</span>' + html;
	}
	var icons = {
			'icon-list' : '&#xe004;',
			'icon-location' : '&#xe000;',
			'icon-search' : '&#xe003;',
			'icon-popup' : '&#xe005;',
			'icon-arrow-left' : '&#xe006;',
			'icon-arrow-right' : '&#xe007;',
			'icon-arrow-left-2' : '&#xe001;',
			'icon-arrow-right-2' : '&#xe002;',
			'icon-checkmark' : '&#xe009;',
			'icon-cross' : '&#xe00a;',
			'icon-quotes-left' : '&#xe008;',
			'icon-cd' : '&#xe00b;',
			'icon-byui-logo' : '&#xe00c;',
			'icon-arrow-down' : '&#xe00d;',
			'icon-arrow-up' : '&#xe00e;',
			'icon-lds-church' : '&#xe00f;'
		},
		els = document.getElementsByTagName('*'),
		i, attr, c, el;
	for (i = 0; ; i += 1) {
		el = els[i];
		if(!el) {
			break;
		}
		attr = el.getAttribute('data-icon');
		if (attr) {
			addIcon(el, attr);
		}
		c = el.className;
		c = c.match(/icon-[^\s'"]+/);
		if (c && icons[c[0]]) {
			addIcon(el, icons[c[0]]);
		}
	}
};