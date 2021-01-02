cpsc411-interrogator
=======
This collection defines the interrogator for the UBC's Computer Science
411 (CPSC 411), "Introduction to Compiler Construction".
This code is meant to be run on the course server to give students the ability
to interrogate the reference solution.
The reference solution must be install on the server as well.

## Usage
The interrogator can be run either as a CGI script on a running web server, or
run as a stand-alone web server via Racket's `web-server` package.

To run as a stand-alone, run `racket -l cpsc411/interrogator`, which will start
the interrogator on port `8080`.
Access the interrogator using `http://localhost:8080/servlets/standalone.rkt`.

You can point students to a specific assignment solution using the `an` GET
variable.
For example, `http://localhost:8080/servlets/standalone.rkt?an=a10` loads the sandbox
for `a10`.

To run as a CGI script, make the following script executable on your web server:
```
#!/bin/bash

exec racket -l cpsc411/interrogator/interrogator-cgi
```
Point students to that script's path on your server.
It has the same interface as the standalone interrogator.
