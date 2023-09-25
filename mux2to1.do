vlib work
vlog 7400series_lab2.v

vsim mux2to1
log {/*}
add wave {/*}

force {x} 1
force {y} 1
force {s} 1
run 10ns

force {x} 0
force {y} 1
force {s} 0
run 10ns
