Responsive Prototype
====================

This repository is for the development of the BYU-Idaho University Theme.

## Live Preview ##

A live preview of the more recent versions of this prototype can be viewed at: <http://byui-web.github.io/responsive-prototype>

## Goal ##

Build a framework for BYU-Idaho's website that is responsive, delivers all content without javascript or other enhancements, and provides easily usable functionality for campus authors.

Front-End Dependencies:
* Modernizr
* JQuery
* Bootstrap (minus glyphicons)

Repository Dependencies:
* Jekyll (ruby, ruby gems, etc)
* Grunt.js (Node, NPM, etc)

## Project Structure ##
This repository is supposed to be a static version of the BYU-Idaho website.  It's structure is meant to match the views that are written for Ingeniux.  There are three main concepts that Ingeniux views enforce:

1. Layouts
2. Page Types
3. Components

Jekyll allows us to accomplish the same structure, but statically.  So the layouts in the _layouts folder should match the layouts in Ingeniux. Pages in the pages directory should match the views for Page Types, and the components in the _includes directory should match the components in Ingeniux.
Each page and each component should be nested in their own directory with the same name of the component.  For example `/pages/content/content.html` or `/_includes/highlighted-links/highlighted-links.html`. By doing so we can keep all of the code that relates to a page type or component can stay close to all of the other code for that item. By creating your files in this convention, restart Grunt and it will automatically pick your new files.

The _less directory contains all of the bootstrap files as well as all of the truly global university styles.  You should only put styles there if they are truly global (don't apply directly to a component or pagetype).

The assets/js folder is for all the frameworks that the university style uses such as Angular, Bootstrap, etc...
## Standards and Workflow (DEVS READ THIS!) ##

If you are not familiar with GIT, please do so.

http://git-scm.com/book/en/v2/Getting-Started-Git-Basics

When making changes to this framework:

1. **Always** _sync the latest commits_ before making changes.
2. **Always** _commit and sync your changes_ daily (if not hourly).
3. **Always** _create a separate branch and test it_ before making major changes to the repository. Merge into master when stable.
4. **Never, ever, EVER** make changes to the framework that _take it out of sync with this repository_. This master branch should always match what is on the live version of the site.
5. Push stable versions of master to gh-pages branch. Not vital, but helpful to other stakeholders on campus who are curious about the framework and its direction.


## Getting Started ##

This repository is built with Jekyll and Grunt.  It would be useful to familiarize yourself with [Jekyll](http://jekyllrb.com/) and the basics of [Grunt](http://gruntjs.com)

You will need to install all dependencies in order to work in this repository. (Assuming you already have GIT installed)
* [Ruby](https://www.ruby-lang.org/en/installation/) (If your on a Mac you will already have Ruby installed)
* `gem install jekyll`
* [Node.js](http://nodejs.org/)
* `npm install -g grunt-cli`
* (From the repository directory) `npm install`

This project is using Grunt as a task runner.  These are all of the Grunt tasks you can run and what they do.

#### `grunt` ####
Consider this the task that will build production ready files.  It will compile all of the LESS files, autoprefix all of the css, run a jekyll build (Creates static html pages from your templates), combine all component javascript, minify all javascript, and minify css.

#### `grunt serve` ####
This task should be used in conjunction with the `grunt` task to test your changes in a pseudo live environment (all code minified/compiled etc...).  This task will perform a jekyll build and start a local webserver on port 4100.  It assumed that `grunt` has been run before this task.

#### `grunt dev` ####
This task should be used when developing. It will do everything that `grunt` does except minify your css. In addition to that it will start a local webserver on port 4100 and watch all of your files.

#### `grunt ghpages` ####
This task will deploy your code to the gh-pages branch on github.  It will overwrite whatever files are in there already and thus if someone else has pushed their code to gh-pages it will remove their code.

## A/B Testing ##

To see an example of how to mock up a variant of a component see the `_includes/highlighted-links` directory