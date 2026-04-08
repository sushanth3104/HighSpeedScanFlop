v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 860 -930 1950 -930 {lab=#net1}
N 970 -930 970 -900 {lab=#net1}
N 1770 -510 1830 -510 {lab=#net1}
N 1830 -930 1830 -510 {lab=#net1}
N 1350 -510 1430 -510 {lab=#net2}
N 770 -510 770 -430 {lab=VPWR}
N 800 -510 1150 -510 {lab=#net3}
N 970 -560 970 -510 {lab=#net3}
N 570 -930 660 -930 {lab=QM}
N 560 -930 560 -450 {lab=QM}
N 560 -930 570 -930 {lab=QM}
N 560 -510 740 -510 {lab=QM}
N 560 -110 560 -70 {lab=#net2}
N 560 -70 1390 -70 {lab=#net2}
N 1390 -510 1390 -70 {lab=#net2}
N 2150 -930 2210 -930 {lab=#net4}
N 450 -930 560 -930 {lab=QM}
N 770 -610 770 -550 {lab=C}
N 850 -650 890 -650 {lab=VGND}
N 1060 -660 1100 -660 {lab=VPWR}
N 1060 -730 1100 -730 {lab=CN}
N 870 -730 920 -730 {lab=C}
N 720 -1040 720 -1000 {lab=VPWR}
N 720 -860 720 -830 {lab=VGND}
N 650 -280 680 -280 {lab=CN}
N 470 -280 510 -280 {lab=C}
N 650 -210 690 -210 {lab=VPWR}
N 450 -200 480 -200 {lab=VGND}
N 1290 -440 1290 -410 {lab=VGND}
N 1290 -610 1290 -580 {lab=VPWR}
N 1600 -640 1600 -600 {lab=C}
N 1600 -460 1600 -420 {lab=CN}
N 1670 -640 1670 -600 {lab=VPWR}
N 1680 -430 1680 -400 {lab=VGND}
N 2010 -1040 2010 -1000 {lab=VPWR}
N 2010 -860 2010 -820 {lab=VGND}
N 250 -430 320 -430 {lab=C}
N 250 -390 320 -390 {lab=CN}
N 230 -340 280 -340 {lab=VPWR}
N 230 -300 280 -300 {lab=VGND}
C {/home/sushanth/Desktop/HighSpeedScanFlop/inverter/inv.sym} 630 -850 0 0 {name=x1}
C {/home/sushanth/Desktop/HighSpeedScanFlop/inverter/inv.sym} 1920 -850 0 0 {name=x2}
C {/home/sushanth/Desktop/HighSpeedScanFlop/inverter/inv.sym} 1380 -430 0 1 {name=x3}
C {/home/sushanth/Desktop/HighSpeedScanFlop/trans/tran.sym} 1390 -400 0 0 {name=x4}
C {/home/sushanth/Desktop/HighSpeedScanFlop/trans/tran.sym} 860 -940 1 0 {name=x5}
C {sky130_fd_pr/pfet_01v8.sym} 770 -530 1 0 {name=M1
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
C {/home/sushanth/Desktop/HighSpeedScanFlop/trans/tran.sym} 450 -490 1 0 {name=x6}
C {ipin.sym} 250 -430 0 0 {name=p1 lab=C}
C {lab_pin.sym} 320 -430 0 0 {name=p2 sig_type=std_logic lab=C}
C {lab_pin.sym} 870 -730 0 0 {name=p3 sig_type=std_logic lab=C}
C {lab_pin.sym} 470 -280 0 0 {name=p4 sig_type=std_logic lab=C}
C {lab_pin.sym} 1600 -640 0 0 {name=p5 sig_type=std_logic lab=C}
C {ipin.sym} 250 -390 0 0 {name=p6 lab=CN}
C {lab_pin.sym} 320 -390 0 0 {name=p7 sig_type=std_logic lab=CN}
C {lab_pin.sym} 680 -280 0 0 {name=p8 sig_type=std_logic lab=CN}
C {lab_pin.sym} 1100 -730 0 0 {name=p9 sig_type=std_logic lab=CN}
C {lab_pin.sym} 1600 -420 0 0 {name=p10 sig_type=std_logic lab=CN}
C {lab_pin.sym} 770 -610 0 0 {name=p11 sig_type=std_logic lab=C}
C {iopin.sym} 280 -340 0 0 {name=p12 lab=VPWR}
C {lab_pin.sym} 230 -340 0 0 {name=p13 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 720 -1040 0 0 {name=p14 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 2010 -1040 0 0 {name=p15 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 1290 -610 0 0 {name=p16 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 1100 -660 0 0 {name=p17 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 770 -430 0 0 {name=p18 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 690 -210 0 0 {name=p19 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 1670 -640 0 0 {name=p20 sig_type=std_logic lab=VPWR}
C {iopin.sym} 280 -300 0 0 {name=p21 lab=VGND}
C {lab_pin.sym} 230 -300 0 0 {name=p22 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 720 -830 0 0 {name=p23 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 850 -650 0 0 {name=p24 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 2010 -820 0 0 {name=p25 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 1680 -400 0 0 {name=p26 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 1290 -410 0 0 {name=p27 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 450 -200 0 0 {name=p28 sig_type=std_logic lab=VGND}
C {ipin.sym} 450 -930 0 0 {name=p29 lab=QM}
C {opin.sym} 2210 -930 0 0 {name=p30 lab=Q}
