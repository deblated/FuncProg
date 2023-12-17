# Lab2

--Run in this order
stack ghci --ghci-options "+RTS -N8"
:load app/Main.hs
--You can use
main
--Or
par
nonpar
--In result you will see time and output of parallel and nonparallel versions
--To see full execution time
:set +s