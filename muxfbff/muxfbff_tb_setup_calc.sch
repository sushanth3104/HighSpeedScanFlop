v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 40 -480 40 -440 {lab=0}
N 90 -410 90 -370 {lab=0}
N 140 -340 140 -300 {lab=0}
N 190 -270 190 -230 {lab=0}
N 240 -200 240 -160 {lab=0}
N 290 -140 290 -100 {lab=0}
N 40 -560 40 -540 {lab=DIN}
N 40 -560 660 -560 {lab=DIN}
N 90 -540 90 -470 {lab=TI}
N 90 -540 660 -540 {lab=TI}
N 140 -520 140 -400 {lab=TE}
N 140 -520 660 -520 {lab=TE}
N 190 -500 660 -500 {lab=TEN}
N 190 -500 190 -330 {lab=TEN}
N 240 -480 660 -480 {lab=C}
N 240 -480 240 -260 {lab=C}
N 290 -460 660 -460 {lab=CN}
N 290 -460 290 -200 {lab=CN}
N 40 -650 40 -610 {lab=0}
N 40 -740 40 -710 {lab=VDD}
N 960 -510 1020 -510 {lab=Q}
C {muxfbff.sym} 510 -350 0 0 {name=x1}
C {vsource.sym} 40 -510 0 0 {name=V1 value="pulse(0 1.8 0 50p 50p 9n 18n)" savecurrent=false}
C {gnd.sym} 40 -440 0 0 {name=l1 lab=0}
C {vsource.sym} 90 -440 0 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} 90 -370 0 0 {name=l2 lab=0}
C {vsource.sym} 140 -370 0 0 {name=V3 value=0 savecurrent=false}
C {gnd.sym} 140 -300 0 0 {name=l3 lab=0}
C {vsource.sym} 190 -300 0 0 {name=V4 value=1.8 savecurrent=false}
C {gnd.sym} 190 -230 0 0 {name=l4 lab=0}
C {vsource.sym} 240 -230 0 0 {name=V5 value="pulse(0 1.8 0 50p 50p 5n 10n)" savecurrent=false}
C {gnd.sym} 240 -160 0 0 {name=l5 lab=0}
C {vsource.sym} 290 -170 0 0 {name=V6 value="pulse(1.8 0 0 50p 50p 5n 10n)" savecurrent=false}
C {gnd.sym} 290 -100 0 0 {name=l6 lab=0}
C {gnd.sym} 930 -430 0 0 {name=l7 lab=0}
C {vsource.sym} 40 -680 0 0 {name=V7 value=1.8 savecurrent=false}
C {gnd.sym} 40 -610 0 0 {name=l8 lab=0}
C {vdd.sym} 40 -740 0 0 {name=l10 lab=VDD}
C {vdd.sym} 930 -590 0 0 {name=l9 lab=VDD}
C {opin.sym} 1020 -510 0 0 {name=p1 lab=Q}
C {code.sym} 260 -810 0 0 {
name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false
      }
C {code.sym} 420 -810 0 0 {name=simulation only_toplevel=false value="

.tran 0.0001n 30n
.control
  save all
    run
	meas tran delay TRIG v(C) VAL=0.9 RISE=3 TARG v(Q) VAL=0.9 RISE=1
	write /home/sushanth/.xschem/simulations/output.raw
  end
.endc



"}
C {lab_pin.sym} 250 -560 0 0 {name=p2 sig_type=std_logic lab=DIN}
C {lab_pin.sym} 300 -540 0 0 {name=p3 sig_type=std_logic lab=TI}
C {lab_pin.sym} 350 -520 0 0 {name=p4 sig_type=std_logic lab=TE}
C {lab_pin.sym} 390 -500 0 0 {name=p5 sig_type=std_logic lab=TEN}
C {lab_pin.sym} 440 -480 0 0 {name=p6 sig_type=std_logic lab=C}
C {lab_pin.sym} 490 -460 0 0 {name=p7 sig_type=std_logic lab=CN}
