v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 80 -130 80 -70 {lab=0}
N 290 -120 290 -70 {lab=0}
N 510 -120 510 -70 {lab=0}
N 750 -120 750 -70 {lab=0}
N 80 -220 80 -190 {lab=VDD}
N 290 -220 290 -180 {lab=C}
N 510 -220 510 -180 {lab=CN}
N 750 -220 750 -180 {lab=VIN}
N 620 -620 660 -620 {lab=C}
N 620 -580 660 -580 {lab=VIN}
N 620 -540 660 -540 {lab=CN}
N 750 -500 750 -470 {lab=0}
N 750 -690 750 -660 {lab=VDD}
N 840 -580 880 -580 {lab=QM}
C {vsource.sym} 80 -160 0 0 {name=VDD value=1.8 savecurrent=false}
C {vsource.sym} 290 -150 0 0 {name=V_C value="pulse(1.8 0 0 50p 50p 5n 10n)" savecurrent=false}
C {vsource.sym} 510 -150 0 0 {name=V_CN value="pulse(0 1.8 0 50p 50p 5n 10n)" savecurrent=false}
C {vsource.sym} 750 -150 0 0 {name=V_IN value="pulse(0 1.8 5.1n 50p 50p 9n 18n)" savecurrent=false}
C {gnd.sym} 80 -70 0 0 {name=l1 lab=0}
C {gnd.sym} 290 -70 0 0 {name=l2 lab=0}
C {gnd.sym} 510 -70 0 0 {name=l3 lab=0}
C {gnd.sym} 750 -70 0 0 {name=l4 lab=0}
C {vdd.sym} 80 -220 0 0 {name=l10 lab=VDD}
C {lab_pin.sym} 290 -200 0 0 {name=p2 sig_type=std_logic lab=C}
C {lab_pin.sym} 510 -200 0 0 {name=p5 sig_type=std_logic lab=CN}
C {lab_pin.sym} 750 -200 0 0 {name=p8 sig_type=std_logic lab=VIN}
C {MasterLatch.sym} 570 -470 0 0 {name=x1}
C {vdd.sym} 750 -690 0 0 {name=l5 lab=VDD}
C {gnd.sym} 750 -470 0 0 {name=l6 lab=0}
C {lab_pin.sym} 620 -620 0 0 {name=p1 sig_type=std_logic lab=C}
C {lab_pin.sym} 620 -580 0 0 {name=p3 sig_type=std_logic lab=VIN}
C {lab_pin.sym} 620 -540 0 0 {name=p4 sig_type=std_logic lab=CN}
C {opin.sym} 880 -580 0 0 {name=p6 lab=QM}
C {code.sym} 100 -640 0 0 {
name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false
      }
C {code.sym} 300 -640 0 0 {name=sim only_toplevel=false value="
.tran 0.001n 11n
.control
  save all
    run
	meas tran delay TRIG v(C) VAL=0.9 RISE=1 TARG v(QM) VAL=0.9 RISE=1
	write /home/sushanth/.xschem/simulations/output.raw
  end
.endc
"}
