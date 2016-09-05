
/* enable strict mode */
"use strict";

var redips = {};


// REDIPS.table initialization
redips.init = function () {
	var rt = REDIPS.table;
	rt.onmousedown('mainTable', true);
	rt.cell_index(true);
	rt.color.cell = '#9BA3DA';
};


// function merges table cells
redips.merge = function () {
	var rt= REDIPS.table;
	rt.merge('h', false);
	rt.merge('v');
	rt.color.cell='#9BA3DA';
};


// mode is 'h' or 'v' (cells should be marked before)
redips.split = function (mode) {
    var rt=REDIPS.table;
	rt.split(mode);
};



redips.row = function (type) {
	var rt=REDIPS.table;
	rt.row('mainTable', type);
};



redips.column = function (type) {
	REDIPS.table.column('mainTable', type);
};



if (window.addEventListener) {
	window.addEventListener('load', redips.init, false);
}
else if (window.attachEvent) {
	window.attachEvent('onload', redips.init);
}