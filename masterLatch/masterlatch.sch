v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 340 -800 390 -800 {lab=VIN}
N 730 -800 870 -800 {lab=#net1}
N 1070 -800 1250 -800 {lab=#net2}
N 1590 -800 1660 -800 {lab=QM}
N 1150 -530 1200 -530 {lab=#net2}
N 1200 -800 1200 -530 {lab=#net2}
N 870 -530 950 -530 {lab=#net3}
N 760 -530 810 -530 {lab=#net1}
N 760 -800 760 -530 {lab=#net1}
N 560 -920 560 -890 {lab=C}
N 560 -750 560 -710 {lab=CN}
N 640 -720 640 -690 {lab=VGND}
N 630 -920 630 -890 {lab=VPWR}
N 930 -910 930 -870 {lab=VPWR}
N 930 -730 930 -700 {lab=VGND}
N 840 -530 840 -460 {lab=VPWR}
N 840 -610 840 -570 {lab=CN}
N 1090 -460 1090 -430 {lab=VGND}
N 1090 -640 1090 -600 {lab=VPWR}
N 1500 -720 1500 -680 {lab=VGND}
N 1490 -930 1490 -890 {lab=VPWR}
N 1420 -930 1420 -890 {lab=#net4}
N 1420 -750 1420 -710 {lab=C}
N 120 -680 190 -680 {lab=C}
N 120 -640 190 -640 {lab=CN}
N 100 -590 150 -590 {lab=VPWR}
N 100 -550 150 -550 {lab=VGND}
C {/home/sushanth/Desktop/HighSpeedScanFlop/trans/tran.sym} 350 -690 0 0 {name=x1}
C {/home/sushanth/Desktop/HighSpeedScanFlop/trans/tran.sym} 1210 -690 0 0 {name=x2}
C {/home/sushanth/Desktop/HighSpeedScanFlop/inverter/inv.sym} 840 -720 0 0 {name=x3}
C {/home/sushanth/Desktop/HighSpeedScanFlop/inverter/inv.sym} 1180 -450 0 1 {name=x4}
C {sky130_fd_pr/pfet_01v8.sym} 840 -550 1 0 {name=M1
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
C {ipin.sym} 120 -680 0 0 {name=p1 lab=C}
C {lab_pin.sym} 190 -680 0 0 {name=p2 sig_type=std_logic lab=C}
C {ipin.sym} 120 -640 0 0 {name=p6 lab=CN}
C {lab_pin.sym} 190 -640 0 0 {name=p7 sig_type=std_logic lab=CN}
C {iopin.sym} 150 -590 0 0 {name=p12 lab=VPWR}
C {lab_pin.sym} 100 -590 0 0 {name=p13 sig_type=std_logic lab=VPWR}
C {iopin.sym} 150 -550 0 0 {name=p21 lab=VGND}
C {lab_pin.sym} 100 -550 0 0 {name=p22 sig_type=std_logic lab=VGND}
C {opin.sym} 1660 -800 0 0 {name=p3 lab=QM}
C {ipin.sym} 340 -800 0 0 {name=p4 lab=VIN}
C {lab_pin.sym} 630 -910 0 0 {name=p5 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 930 -900 0 0 {name=p8 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 1490 -920 0 0 {name=p9 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 1090 -620 0 0 {name=p10 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 840 -470 0 0 {name=p11 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 640 -690 0 0 {name=p14 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 930 -700 0 0 {name=p15 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 1500 -680 0 0 {name=p16 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 1090 -430 0 0 {name=p17 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 560 -920 0 0 {name=p18 sig_type=std_logic lab=C}
C {lab_pin.sym} 1420 -710 0 0 {name=p19 sig_type=std_logic lab=C}
C {lab_pin.sym} 560 -710 0 0 {name=p20 sig_type=std_logic lab=CN}
C {lab_pin.sym} 840 -610 0 0 {name=p23 sig_type=std_logic lab=CN}
C {lab_pin.sym} 1420 -930 0 0 {name=p24 sig_type=std_logic lab=CN}
