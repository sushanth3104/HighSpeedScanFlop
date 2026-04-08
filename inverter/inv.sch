v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 280 -270 280 -200 {lab=Y}
N 280 -140 280 -90 {lab=VGND}
N 280 -390 280 -330 {lab=VPWR}
N 280 -300 340 -300 {lab=VPWR}
N 340 -370 340 -300 {lab=VPWR}
N 280 -370 340 -370 {lab=VPWR}
N 280 -170 350 -170 {lab=VGND}
N 350 -170 350 -110 {lab=VGND}
N 280 -110 350 -110 {lab=VGND}
N 180 -300 240 -300 {lab=A}
N 180 -300 180 -170 {lab=A}
N 180 -170 240 -170 {lab=A}
N 280 -230 380 -230 {lab=Y}
N 140 -230 180 -230 {lab=A}
C {sky130_fd_pr/nfet_01v8.sym} 260 -170 0 0 {name=M1
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
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 260 -300 0 0 {name=M2
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
C {iopin.sym} 280 -390 3 0 {name=VPWR lab=VPWR}
C {iopin.sym} 280 -90 1 0 {name=VGND lab=VGND}
C {ipin.sym} 140 -230 0 0 {name=A lab=A}
C {opin.sym} 380 -230 0 0 {name=Y lab=Y}
