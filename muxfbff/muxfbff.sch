v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 460 -480 460 -450 {lab=VPWR}
N 710 -480 710 -440 {lab=VPWR}
N 980 -480 980 -440 {lab=VPWR}
N 490 -320 490 -260 {lab=VGND}
N 710 -300 710 -260 {lab=VGND}
N 980 -310 980 -260 {lab=VGND}
N 520 -370 630 -370 {lab=#net1}
N 790 -370 900 -370 {lab=#net2}
N 1060 -380 1120 -380 {lab=Q}
N 340 -390 400 -390 {lab=DIN}
N 340 -350 400 -350 {lab=TI}
N 440 -290 440 -260 {lab=TE}
N 460 -300 460 -260 {lab=TEN}
N 600 -390 630 -390 {lab=C}
N 600 -350 630 -350 {lab=#net3}
N 870 -400 900 -400 {lab=C}
N 880 -340 900 -340 {lab=CN}
N 870 -340 880 -340 {lab=CN}
N 80 -460 160 -460 {lab=VPWR}
N 80 -420 160 -420 {lab=VGND}
N 80 -380 160 -380 {lab=DIN}
N 80 -340 160 -340 {lab=TI}
N 80 -300 160 -300 {lab=TE}
N 80 -260 160 -260 {lab=TEN}
N 80 -220 160 -220 {lab=C}
N 80 -180 160 -180 {lab=CN}
C {/home/sushanth/Desktop/HighSpeedScanFlop/mux/Mux.sym} 340 -250 0 0 {name=x1}
C {/home/sushanth/Desktop/HighSpeedScanFlop/masterLatch/masterlatch.sym} 570 -280 0 0 {name=x2}
C {/home/sushanth/Desktop/HighSpeedScanFlop/slaveLatch/SlaveLatch.sym} 830 -290 0 0 {name=x3}
C {iopin.sym} 160 -460 0 0 {name=p1 lab=VPWR}
C {iopin.sym} 160 -420 0 0 {name=p2 lab=VGND}
C {ipin.sym} 80 -380 0 0 {name=p3 lab=DIN}
C {ipin.sym} 80 -340 0 0 {name=p4 lab=TI}
C {ipin.sym} 80 -300 0 0 {name=p5 lab=TE}
C {ipin.sym} 80 -260 0 0 {name=p6 lab=TEN}
C {ipin.sym} 80 -220 0 0 {name=p7 lab=C}
C {ipin.sym} 80 -180 0 0 {name=p8 lab=CN}
C {opin.sym} 1120 -380 0 0 {name=p9 lab=Q}
C {lab_pin.sym} 90 -460 0 0 {name=p10 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 90 -420 0 0 {name=p11 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 160 -380 0 0 {name=p12 sig_type=std_logic lab=DIN}
C {lab_pin.sym} 160 -340 0 0 {name=p13 sig_type=std_logic lab=TI}
C {lab_pin.sym} 160 -300 0 0 {name=p14 sig_type=std_logic lab=TE}
C {lab_pin.sym} 160 -260 0 0 {name=p15 sig_type=std_logic lab=TEN}
C {lab_pin.sym} 160 -220 0 0 {name=p16 sig_type=std_logic lab=C}
C {lab_pin.sym} 160 -180 0 0 {name=p17 sig_type=std_logic lab=CN}
C {lab_pin.sym} 440 -260 0 0 {name=p18 sig_type=std_logic lab=TE
}
C {lab_pin.sym} 460 -280 0 0 {name=p19 sig_type=std_logic lab=TEN}
C {lab_pin.sym} 490 -260 0 0 {name=p20 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 340 -390 0 0 {name=p21 sig_type=std_logic lab=DIN}
C {lab_pin.sym} 340 -350 0 0 {name=p22 sig_type=std_logic lab=TI}
C {lab_pin.sym} 460 -480 0 0 {name=p23 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 710 -480 0 0 {name=p26 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 710 -260 0 0 {name=p27 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 870 -400 0 0 {name=p28 sig_type=std_logic lab=C}
C {lab_pin.sym} 870 -340 0 0 {name=p29 sig_type=std_logic lab=CN}
C {lab_pin.sym} 980 -480 0 0 {name=p30 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 980 -260 0 0 {name=p31 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 600 -390 0 0 {name=p24 sig_type=std_logic lab=C}
C {lab_pin.sym} 600 -350 0 0 {name=p25 sig_type=std_logic lab=CN}
