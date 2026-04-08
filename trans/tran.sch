v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 370 -250 370 -190 {lab=VGND}
N 370 -450 370 -380 {lab=VPWR}
N 280 -450 340 -450 {lab=xxx}
N 280 -450 280 -190 {lab=xxx}
N 280 -190 340 -190 {lab=xxx}
N 400 -450 460 -450 {lab=B}
N 460 -450 460 -190 {lab=B}
N 400 -190 460 -190 {lab=B}
N 170 -320 280 -320 {lab=xxx}
N 460 -320 580 -320 {lab=B}
N 370 -540 370 -490 {lab=CN}
N 370 -150 370 -100 {lab=C}
C {sky130_fd_pr/nfet_01v8.sym} 370 -170 3 0 {name=M1
W=0.65
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 370 -470 1 0 {name=M2
W=1
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {iopin.sym} 170 -320 2 0 {name=A lab=A}
C {iopin.sym} 580 -320 0 0 {name=B lab=B}
C {iopin.sym} 370 -380 1 0 {name=VPWR lab=VPWR}
C {iopin.sym} 370 -250 3 0 {name=VGND lab=VGND}
C {ipin.sym} 370 -100 3 0 {name=C lab=C}
C {ipin.sym} 370 -540 1 0 {name=CN lab=CN}
