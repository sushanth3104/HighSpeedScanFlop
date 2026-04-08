v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1220 -1150 1340 -1150 {lab=VIN}
N 1540 -1150 1610 -1150 {lab=#net1}
N 1950 -1150 2280 -1150 {lab=#net2}
N 2480 -1150 2970 -1150 {lab=VOUT}
N 1990 -690 2030 -690 {lab=#net2}
N 1990 -1150 1990 -690 {lab=#net2}
N 2370 -690 2610 -690 {lab=#net3}
N 2810 -690 2880 -690 {lab=VOUT}
N 2880 -1150 2880 -690 {lab=VOUT}
N 1400 -1260 1400 -1220 {lab=VDD}
N 1400 -1080 1400 -1040 {lab=0}
N 1860 -1070 1860 -1030 {lab=0}
N 1850 -1280 1850 -1240 {lab=VDD}
N 2340 -1270 2340 -1220 {lab=VDD}
N 2340 -1080 2340 -1040 {lab=0}
N 2270 -830 2270 -780 {lab=VDD}
N 2280 -610 2280 -570 {lab=0}
N 2200 -640 2200 -610 {lab=CN}
N 2200 -820 2200 -780 {lab=C}
N 2750 -810 2750 -760 {lab=VDD}
N 2750 -620 2750 -580 {lab=0}
N 1780 -1100 1780 -1060 {lab=C}
N 1780 -1280 1780 -1240 {lab=CN}
N 550 -770 550 -710 {lab=0}
N 760 -760 760 -710 {lab=0}
N 980 -760 980 -710 {lab=0}
N 1220 -760 1220 -710 {lab=0}
N 550 -860 550 -830 {lab=VDD}
N 760 -860 760 -820 {lab=C}
N 980 -860 980 -820 {lab=CN}
N 1220 -860 1220 -820 {lab=VIN}
C {/home/sushanth/projects/inverter/inv.sym} 1310 -1070 0 0 {name=x1}
C {/home/sushanth/projects/inverter/inv.sym} 2250 -1070 0 0 {name=x2}
C {/home/sushanth/projects/inverter/inv.sym} 2840 -610 0 1 {name=x3}
C {/home/sushanth/projects/trans/tran.sym} 1570 -1040 0 0 {name=x4}
C {/home/sushanth/projects/trans/tran.sym} 1990 -580 0 0 {name=x5}
C {opin.sym} 2970 -1150 0 0 {name=p1 lab=VOUT}
C {vsource.sym} 550 -800 0 0 {name=VDD value=1.8 savecurrent=false}
C {vsource.sym} 760 -790 0 0 {name=V_C value="pulse(1.8 0 0 50p 50p 5n 10n)" savecurrent=false}
C {vsource.sym} 980 -790 0 0 {name=V_CN value="pulse(0 1.8 0 50p 50p 5n 10n)" savecurrent=false}
C {vsource.sym} 1220 -790 0 0 {name=V_IN value="pulse(0 1.8 0 50p 50p 9n 18n)" savecurrent=false}
C {gnd.sym} 550 -710 0 0 {name=l1 lab=0}
C {gnd.sym} 760 -710 0 0 {name=l2 lab=0}
C {gnd.sym} 980 -710 0 0 {name=l3 lab=0}
C {gnd.sym} 1220 -710 0 0 {name=l4 lab=0}
C {gnd.sym} 1400 -1040 0 0 {name=l5 lab=0}
C {gnd.sym} 1860 -1030 0 0 {name=l6 lab=0}
C {gnd.sym} 2340 -1040 0 0 {name=l7 lab=0}
C {gnd.sym} 2280 -570 0 0 {name=l8 lab=0}
C {gnd.sym} 2750 -580 0 0 {name=l9 lab=0}
C {vdd.sym} 550 -860 0 0 {name=l10 lab=VDD}
C {vdd.sym} 1400 -1260 0 0 {name=l11 lab=VDD}
C {vdd.sym} 1850 -1280 0 0 {name=l12 lab=VDD}
C {vdd.sym} 2340 -1270 0 0 {name=l13 lab=VDD}
C {vdd.sym} 2750 -810 0 0 {name=l14 lab=VDD}
C {vdd.sym} 2270 -830 0 0 {name=l15 lab=VDD}
C {lab_pin.sym} 760 -840 0 0 {name=p2 sig_type=std_logic lab=C}
C {lab_pin.sym} 1780 -1080 0 0 {name=p3 sig_type=std_logic lab=C}
C {lab_pin.sym} 2200 -800 0 0 {name=p4 sig_type=std_logic lab=C}
C {lab_pin.sym} 980 -840 0 0 {name=p5 sig_type=std_logic lab=CN}
C {lab_pin.sym} 1780 -1260 0 0 {name=p6 sig_type=std_logic lab=CN}
C {lab_pin.sym} 2200 -620 0 0 {name=p7 sig_type=std_logic lab=CN}
C {lab_pin.sym} 1220 -840 0 0 {name=p8 sig_type=std_logic lab=VIN}
C {lab_pin.sym} 1220 -1150 0 0 {name=p9 sig_type=std_logic lab=VIN}
C {code.sym} 1050 -1510 0 0 {
name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false
      }
C {code.sym} 1280 -1500 0 0 {name=sim only_toplevel=false value="
.tran 0.00001n 11n
.control
  save all
    run
	meas tran delay TRIG v(C) VAL=0.9 RISE=1 TARG v(vout) VAL=0.9 RISE=1
	write /home/sushanth/.xschem/simulations/output.raw
  end
.endc
"}
