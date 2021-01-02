a4: ../mine/a4-franken-solution.rkt ../mine/nd-match.rkt ../mine/share/a4-graph-lib.rkt ../mine/share/a4-compiler-lib.rkt
	rsync -L -v ../mine/nd-match.rkt .
	rsync -L -v ../mine/a4-franken-solution.rkt ./a4-solution.rkt
	rsync -L -v  ../mine/share/a4-graph-lib.rkt ../mine/share/a4-compiler-lib.rkt share/

a6: ../mine/a6-solution.rkt ../mine/nd-match.rkt ../mine/share/a6-compiler-lib.rkt ../mine/share/a6-graph-lib.rkt
	rsync -L -v ../mine/a6-solution.rkt  ../mine/nd-match.rkt .
	rsync -L -v ../mine/share/a6-graph-lib.rkt ../mine/share/a6-compiler-lib.rkt share/

a7: ../mine/a7-solution.rkt ../mine/nd-match.rkt ../mine/share/a7-compiler-lib.rkt ../mine/share/a7-graph-lib.rkt
	rsync -L -v ../mine/a7-solution.rkt  ../mine/nd-match.rkt .
	rsync -L -v ../mine/share/a7-graph-lib.rkt ../mine/share/a7-compiler-lib.rkt share/

a8: ../mine/a8-solution.rkt ../mine/nd-match.rkt ../mine/share/a8-compiler-lib.rkt ../mine/share/a8-graph-lib.rkt
	rsync -L -v ../mine/a8-solution.rkt  ../mine/nd-match.rkt .
	rsync -L -v ../mine/share/a8-graph-lib.rkt ../mine/share/a8-compiler-lib.rkt share/

a9: ../mine/a9-solution.rkt ../mine/nd-match.rkt ../mine/share/a9-compiler-lib.rkt ../mine/share/a9-graph-lib.rkt
	rsync -L -v ../mine/a9-solution.rkt  ../mine/nd-match.rkt .
	rsync -L -v ../mine/share/a9-graph-lib.rkt ../mine/share/a9-compiler-lib.rkt share/

a10: ../mine/a10-solution.rkt ../mine/nd-match.rkt ../mine/share/a10-compiler-lib.rkt ../mine/share/a10-graph-lib.rkt
	rsync -L -v ../mine/a10-solution.rkt  ../mine/nd-match.rkt .
	rsync -L -v ../mine/share/a10-graph-lib.rkt ../mine/share/a10-compiler-lib.rkt share/

deploy:
	rsync -avz --exclude compiled/ --inplace ./ cs-411@remote.students.cs.ubc.ca:interrogate-app/
	ssh cs-411@remote.students.cs.ubc.ca 'source .bash_profile; cd interrogate-app; raco make *.rkt share/*.rkt'
