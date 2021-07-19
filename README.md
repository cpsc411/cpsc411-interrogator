cpsc411-interrogator
=======
<p align="left">
  <a href="https://github.com/cpsc411/cpsc411-interrogator/actions?query=workflow%3A%22CI%22"><img alt="GitHub Actions status" src="https://github.com/cpsc411/cpsc411-interrogator/workflows/CI/badge.svg"></a>
</p>

This collection defines the interrogator for the UBC's Computer Science
411 (CPSC 411), "Introduction to Compiler Construction".
This code is meant to be run on the course server to give students the ability
to interrogate the reference solution.
The reference solution must be installed on the server as well.

There are two tools: the compiler interrogator, and the language differ.

## Security Notes:
Racket v8.2 is considered REQUIRED due a severe vulnerability in the sandbox mechanism affecting prior versions of Racket, enabling arbitrary code execution by students using the interrogator.

If you have other security and sandboxing measures in place, you can manually override this version requirement and the interrogator should work back to version v7.4.

## Compiler Interrogator Usage
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

## Language Differ Usage
The language differ has a similar interface.

To run as a stand-alone, run `racket -l cpsc411/lang-differ`, which will start
the interrogator on port `8081`.
Access the interrogator using `http://localhost:8081/servlets/standalone.rkt`.

To run as a CGI script, make the following script executable on your web server:
```
#!/bin/bash

exec racket -l cpsc411/interrogator/lang-differ-cgi
```

The CGI script must be run in a directory with `bettergrammar.css` and the style
files (CSS and JS) for the Scribble Manual style.
These are generate by the CPSC 411 book in its build directory.
