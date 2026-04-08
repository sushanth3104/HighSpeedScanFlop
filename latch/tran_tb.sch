v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 200 -560 200 -500 {lab=0}
N 200 -330 200 -270 {lab=0}
N 200 -100 200 -40 {lab=0}
N 200 -680 200 -620 {lab=VDD}
N 200 -450 200 -390 {lab=C}
N 200 -220 200 -160 {lab=CN}
N 100 -320 100 -260 {lab=0}
N 100 -440 100 -380 {lab=A}
N 960 -680 960 -630 {lab=CN}
N 740 -540 790 -540 {lab=A}
N 960 -490 960 -430 {lab=C}
N 1040 -460 1040 -430 {lab=0}
N 1030 -680 1030 -630 {lab=VDD}
N 1130 -540 1190 -540 {lab=VOUT}
N 970 -320 970 -270 {lab=C}
N 750 -180 800 -180 {lab=B}
N 970 -130 970 -70 {lab=CN}
N 1050 -100 1050 -70 {lab=0}
N 1040 -320 1040 -270 {lab=VDD}
N 1140 -180 1200 -180 {lab=VOUT}
N 430 -330 430 -270 {lab=0}
N 430 -450 430 -390 {lab=B}
N 1200 -540 1200 -180 {lab=VOUT}
N 1190 -540 1200 -540 {lab=VOUT}
N 1200 -370 1330 -370 {lab=VOUT}
C {tran.sym} 750 -430 0 0 {name=x1}
C {vsource.sym} 200 -590 0 0 {name=VDD value=1.8 savecurrent=false}
C {vsource.sym} 200 -360 0 0 {name=V_C value="pulse(0 1.8 0.5n 0.5n 0.5n 5n 10n)" }
C {vsource.sym} 200 -130 0 0 {name=V_CN value="pulse(1.8 0 0.5n 0.5n 0.5n 5n 10n)" }
C {vsource.sym} 100 -350 0 0 {name=V_A value="pulse(0 1.8 3n 0.5n 0.5n 5n 10n)" }
C {gnd.sym} 200 -500 0 0 {name=l1 lab=0}
C {gnd.sym} 200 -270 0 0 {name=l2 lab=0}
C {gnd.sym} 200 -40 0 0 {name=l3 lab=0}
C {gnd.sym} 100 -260 0 0 {name=l4 lab=0}
C {gnd.sym} 1040 -430 0 0 {name=l5 lab=0}
C {vdd.sym} 200 -680 0 0 {name=l6 lab=VDD}
C {vdd.sym} 1030 -680 0 0 {name=l7 lab=VDD}
C {lab_pin.sym} 200 -420 0 0 {name=C sig_type=std_logic lab=C}
C {lab_pin.sym} 960 -660 0 0 {name=CN1 sig_type=std_logic lab=CN}
C {lab_pin.sym} 960 -450 0 0 {name=C1 sig_type=std_logic lab=C}
C {lab_pin.sym} 740 -540 0 0 {name=A1 sig_type=std_logic lab=A}
C {lab_pin.sym} 200 -190 0 0 {name=CN sig_type=std_logic lab=CN}
C {lab_pin.sym} 100 -410 0 0 {name=A sig_type=std_logic lab=A}
C {code.sym} 230 -880 0 0 {
name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false
      }
C {code.sym} 620 -870 0 0 {name=sim only_toplevel=false value="
.tran 0.01n 15n
.control
  save all
    run
    write /home/sushanth/.xschem/simulations/output.raw
  end
.endc
"}
C {tran.sym} 760 -70 0 0 {name=x2}
C {gnd.sym} 1050 -70 0 0 {name=l8 lab=0}
C {vdd.sym} 1040 -320 0 0 {name=l9 lab=VDD}
C {lab_pin.sym} 750 -180 0 0 {name=A2 sig_type=std_logic lab=B}
C {lab_pin.sym} 970 -300 0 0 {name=C2 sig_type=std_logic lab=C}
C {lab_pin.sym} 970 -90 0 0 {name=CN2 sig_type=std_logic lab=CN}
C {vsource.sym} 430 -360 0 0 {name=V_B value="pulse(0 1.8 0 0.5n 0.5n 1.5n 3n)" }
C {gnd.sym} 430 -270 0 0 {name=l10 lab=0}
C {lab_pin.sym} 430 -420 0 0 {name=A3 sig_type=std_logic lab=B}
C {opin.sym} 1330 -370 0 0 {name=p1 lab=VOUT}
C {lab_pin.sym} 1270 -370 0 0 {name=A4 sig_type=std_logic lab=VOUT}
