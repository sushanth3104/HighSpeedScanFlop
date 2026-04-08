v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 310 -240 310 -200 {lab=#net1}
N 310 -140 310 -90 {lab=VGND}
N 200 -270 310 -270 {lab=VGND}
N 200 -270 200 -120 {lab=VGND}
N 200 -120 310 -120 {lab=VGND}
N 200 -170 310 -170 {lab=VGND}
N 310 -340 310 -300 {lab=VIN}
N 310 -340 500 -340 {lab=VIN}
N 500 -340 500 -300 {lab=VIN}
N 770 -240 770 -200 {lab=#net2}
N 770 -140 770 -90 {lab=VGND}
N 660 -270 770 -270 {lab=VGND}
N 660 -270 660 -120 {lab=VGND}
N 660 -120 770 -120 {lab=VGND}
N 660 -170 770 -170 {lab=VGND}
N 770 -340 770 -300 {lab=VIN}
N 770 -340 960 -340 {lab=VIN}
N 960 -340 960 -300 {lab=VIN}
N 400 -400 400 -340 {lab=VIN}
N 400 -400 880 -400 {lab=VIN}
N 880 -400 880 -340 {lab=VIN}
N 500 -240 500 -200 {lab=#net3}
N 500 -140 500 -100 {lab=VPWR}
N 500 -270 600 -270 {lab=VPWR}
N 600 -270 600 -120 {lab=VPWR}
N 500 -120 600 -120 {lab=VPWR}
N 500 -170 600 -170 {lab=VPWR}
N 960 -240 960 -200 {lab=#net4}
N 960 -140 960 -100 {lab=VPWR}
N 960 -270 1060 -270 {lab=VPWR}
N 1060 -270 1060 -120 {lab=VPWR}
N 960 -120 1060 -120 {lab=VPWR}
N 960 -170 1060 -170 {lab=VPWR}
N 640 -460 640 -400 {lab=VIN}
N 640 -460 720 -460 {lab=VIN}
N 350 -270 460 -270 {lab=DIN}
N 810 -170 920 -170 {lab=TI}
N 350 -170 370 -170 {lab=TEN}
N 440 -170 460 -170 {lab=TE}
N 810 -270 830 -270 {lab=TE}
N 900 -270 920 -270 {lab=TEN}
N 400 -270 400 -260 {lab=DIN}
N 860 -170 860 -160 {lab=TI}
N 80 -380 120 -380 {lab=VPWR}
N 80 -340 120 -340 {lab=VGND}
N 120 -300 160 -300 {lab=TE}
N 120 -260 160 -260 {lab=xxx}
N 500 -100 500 -90 {lab=VPWR}
N 960 -100 960 -90 {lab=VPWR}
C {sky130_fd_pr/nfet_01v8.sym} 330 -270 0 1 {name=M1
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
C {sky130_fd_pr/nfet_01v8.sym} 330 -170 0 1 {name=M3
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
C {sky130_fd_pr/nfet_01v8.sym} 790 -270 0 1 {name=M5
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
C {sky130_fd_pr/nfet_01v8.sym} 790 -170 0 1 {name=M7
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
C {sky130_fd_pr/pfet_01v8.sym} 480 -270 2 1 {name=M2
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
C {sky130_fd_pr/pfet_01v8.sym} 480 -170 2 1 {name=M4
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
C {sky130_fd_pr/pfet_01v8.sym} 940 -270 2 1 {name=M6
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
C {sky130_fd_pr/pfet_01v8.sym} 940 -170 2 1 {name=M8
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
C {opin.sym} 720 -460 0 0 {name=p5 lab=VIN}
C {ipin.sym} 400 -260 3 0 {name=p6 lab=DIN}
C {ipin.sym} 860 -160 3 0 {name=p7 lab=TI}
C {iopin.sym} 120 -380 0 0 {name=p1 lab=VPWR}
C {iopin.sym} 120 -340 0 0 {name=p2 lab=VGND}
C {ipin.sym} 120 -300 0 0 {name=p3 lab=TE}
C {ipin.sym} 120 -260 0 0 {name=p4 lab=TEN}
C {lab_pin.sym} 80 -380 0 0 {name=p8 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 80 -340 0 0 {name=p9 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 160 -300 0 0 {name=p10 sig_type=std_logic lab=TE}
C {lab_pin.sym} 160 -260 0 0 {name=p11 sig_type=std_logic lab=TEN}
C {lab_pin.sym} 440 -170 0 0 {name=p12 sig_type=std_logic lab=TE}
C {lab_pin.sym} 830 -270 0 0 {name=p13 sig_type=std_logic lab=TE}
C {lab_pin.sym} 370 -170 0 0 {name=p14 sig_type=std_logic lab=TEN}
C {lab_pin.sym} 900 -270 0 0 {name=p15 sig_type=std_logic lab=TEN}
C {lab_pin.sym} 310 -90 0 0 {name=p16 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 770 -90 0 0 {name=p17 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 500 -90 0 0 {name=p18 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 960 -90 0 0 {name=p19 sig_type=std_logic lab=VPWR}
