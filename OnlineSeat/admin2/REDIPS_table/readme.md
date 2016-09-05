REDIPS.table 1.1.0
============

## What's REDIPS.table?

REDIPS.table is a JavaScript library which enables dynamically merging and splitting table cells.
It is possible to activate onmousedown event listeners on TD element to interactively mark cells with mouse button.

## Features

* merge / split table cells
* add / remove table row
* add / remove table column
* enable / disable marking not empty table cells

## Public methods

* REDIPS.table.onmousedown() - activate onmousedown event listener on table cells
* REDIPS.table.mark() - select / deselect table cell
* REDIPS.table.merge() - merge horizontally / vertically marked table cells in a sequence
* REDIPS.table.split() - split horizontally / vertically marked table cells (only cells with colspan / rowspan greater then 1)
* REDIPS.table.row() - add / remove table row
* REDIPS.table.column() - add / remove table column
* REDIPS.table.cell_index() - display cell index (useful for demo / debugging)
* REDIPS.table.cell_ignore() - remove onmousedown even listener from table cell in case of active REDIPS.table.onmousedown mode 

## Documentation

A reference documentation with a list of public properties and methods contained in REDIPS.table library.

* [http://www.redips.net/javascript/redips-table-documentation/](http://www.redips.net/javascript/redips-table-documentation/)

## Demo

Live demo shows REDIPS.table library in action: 

* [http://www.redips.net/javascript/table-td-merge-split/](http://www.redips.net/javascript/table-td-merge-split/)

