# Continuous Integration and Deployment

This is a primer project for Comp 490.
It is mostly documentation on the simple continuous integration/deployment of a github project using [travis-ci](https://travis-ci.org/).
The backend is a cgi script that uses the [github markdown api](https://developer.github.com/v3/markdown/) to render markdown as html.
Adding a query string of [`"?raw=true"`](http://www.csun.edu/~see93462/primer_project/cgi-bin/index.cgi?raw=true) will return the raw markdown.
