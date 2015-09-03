# Individual Primer Project
    - Due Date: Sept 7, 2015
    - Submission Subject: Primer

## Test on CSUN Servers
```
ssh ssh.csun.edu -l <username>
cd web_drive/public_html
mkdir cgi-bin
chmod a+rx cgi-bin
```

## General Submission Criteria
    - All laboratory assignments of must be submitted using git. In addition to the submission of the assignment, the following criteria must be meet for all assignments.
    - Your laboratory software project must be stored within a publically accessible git repository.  Given a URL, a pull request can be made.
    - This git repository must have been updated via a series of “commit”s and “push”es.
    - You must have a README file associated with your software project, and it must provide a log/journal of the activities you performed on your project and it must provide a summary of your project status.
    - An email is sent with the appropriate subject to steve@my.csun.edu that
      - announces that the assignment is complete and ready to be graded,
      - contains a copy of your README document, and
      - includes the git URL for download and testing.
    - Your submission must include everything to deploy your project within a “public_html” directory.
    - I will be testing your application on Campus web environment: http://www.csun.edu/~steve/

## Overview
In this project, you are to create a simple web application.  This web application can be written in any programming language of your choice.  However, you must use the simple CGI interface.  I.e., you can’t use the vendor supplied libraries to read access the HTTP Header information.

The functionality of your web application is to be defined by you.  There is a minimal number of features that are required, you are free to add additional features.

## Features
Your web application must have the following features:
    - It must respond to the GET verb.
    - It must have a different response given the URI provided to the application.
    - It must return HTML and appropriate links to any associated CCS sheets or Javascript (I.e., do not inline style or dynamic behavior within your structure).
    - It must have least one style sheet.
    - It must consume information information from the file system.
    - It must consume information from a remote web-server (i.e., you are acting like a proxy server.).


Conditions:
You may use any programming language, but you must follow the CGI conventions
(mkdir public_html/cgi-bin, chmod … )
You must obtain all information about the request directly from environment variables
(See simple.cgi program)
You must handle all URIs within your namespace.
(See Mod Rewrite Rules)
You must emit both the HTTP header and body
