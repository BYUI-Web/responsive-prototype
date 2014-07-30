Responsive Prototype
====================

## Standards and Workflow (READ THIS!) ##
When making changes to this framework:

1. **Always** _sync the latest commits_ before making changes.
2. **Always** _commit and sync your changes_ daily (if not hourly).
3. **Always** _create a separate branch and test it_ before making major changes to the repository. Merge into master when stable.
4. **Never, ever, EVER** make changes to the framework that _take it out of sync with this repository_. This master branch should always match what is on the live version of the site.

## Goal ##

Build a framework for BYU-Idaho's website that is responsive, delivers all content without javascript or other enhancements, and provides easily usable functionality for campus authors.

Front-End Dependencies:
* Modernizr
* JQuery
* Bootstrap (minus glyphicons)

Repository Dependencies:
* Jekyll (ruby, ruby gems, etc)
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

This task will run LESS to compile and concatenate less files, run jekyll to generate the site in a sibling folder, and run a local server. After running grunt, you can preview the site in your browser at: <http://localhost:4100/generated-prototype/>

## Live Preview ##

A live preview of the more recent versions of this prototype can be viewed at: <http://byui-web.github.io/generated-prototype>
