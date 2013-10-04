Responsive Prototype
====================

## Goal ##

Build a framework for BYU-Idaho's website that is responsive, delivers all content without javascript or other enhancements, and provides easily usable functionality for campus authors.

Front-End Dependencies:
* Modernizr
* JQuery
* Bootstrap (minus glyphicons)

Repository Dependencies:
* Grunt.js (Node, NPM, etc)

## Getting Started ##

To locally view the framework, install [Jekyll](http://jekyllrb.com/), cd to the directory in your shell terminal, and use the following commands:
```
$ jekyll build
$ jekyll watch
```
    
To develop locally, install [Node](http://nodejs.org/download/) and [Grunt](http://gruntjs.com/getting-started), cd to the directory and run the following commands to download the grunt plugins and run the automated tasks.
```
$ npm install
$ grunt
```

This task will run LESS to compile and concatenate less files, run jekyll to generate the site in a sibling folder, and run a local server. After running grunt, you can preview the site in your browser at: [http://localhost:4000/generated-prototype/]

## Live Preview ##

A live preview of the more recent versions of this prototype can be viewed at: [http://byui-web.github.io/generated-prototype]