v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 100 -470 100 -430 {lab=0}
N 150 -400 150 -360 {lab=0}
N 200 -330 200 -290 {lab=0}
N 250 -260 250 -220 {lab=0}
N 300 -190 300 -150 {lab=0}
N 350 -130 350 -90 {lab=0}
N 100 -550 100 -530 {lab=DIN}
N 100 -550 720 -550 {lab=DIN}
N 150 -530 150 -460 {lab=TI}
N 150 -530 720 -530 {lab=TI}
N 200 -510 200 -390 {lab=TE}
N 200 -510 720 -510 {lab=TE}
N 250 -490 720 -490 {lab=TEN}
N 250 -490 250 -320 {lab=TEN}
N 300 -470 720 -470 {lab=C}
N 300 -470 300 -250 {lab=C}
N 350 -450 720 -450 {lab=CN}
N 350 -450 350 -190 {lab=CN}
N 100 -640 100 -600 {lab=0}
N 100 -730 100 -700 {lab=VDD}
N 1020 -500 1080 -500 {lab=Q}
N 1230 -770 1230 -740 {lab=VDD}
N 1230 -600 1230 -570 {lab=0}
N 1060 -670 1170 -670 {lab=Q}
N 1060 -670 1060 -500 {lab=Q}
N 1370 -670 1400 -670 {lab=Q1}
N 1230 -460 1230 -430 {lab=VDD}
N 1230 -290 1230 -260 {lab=0}
N 1370 -360 1400 -360 {lab=Q2}
N 1050 -500 1050 -360 {lab=Q}
N 1050 -360 1170 -360 {lab=Q}
C {vsource.sym} 100 -500 0 0 {name=V1 value="pulse(0 1.8 \{td\} 50p 50p 9n 36n)" savecurrent=false}
C {gnd.sym} 100 -430 0 0 {name=l1 lab=0}
C {vsource.sym} 150 -430 0 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} 150 -360 0 0 {name=l2 lab=0}
C {vsource.sym} 200 -360 0 0 {name=V3 value=0 savecurrent=false}
C {gnd.sym} 200 -290 0 0 {name=l3 lab=0}
C {vsource.sym} 250 -290 0 0 {name=V4 value=1.8 savecurrent=false}
C {gnd.sym} 250 -220 0 0 {name=l4 lab=0}
C {vsource.sym} 300 -220 0 0 {name=V5 value="pulse(0 1.8 -1n 50p 50p 3n 6n)" savecurrent=false}
C {gnd.sym} 300 -150 0 0 {name=l5 lab=0}
C {vsource.sym} 350 -160 0 0 {name=V6 value="pulse(1.8 0 -1n 50p 50p 3n 6n)" savecurrent=false}
C {gnd.sym} 350 -90 0 0 {name=l6 lab=0}
C {gnd.sym} 990 -420 0 0 {name=l7 lab=0}
C {vsource.sym} 100 -670 0 0 {name=V7 value=1.8 savecurrent=false}
C {gnd.sym} 100 -600 0 0 {name=l8 lab=0}
C {vdd.sym} 100 -730 0 0 {name=l10 lab=VDD}
C {vdd.sym} 990 -580 0 0 {name=l9 lab=VDD}
C {opin.sym} 1080 -500 0 0 {name=p1 lab=Q}
C {code.sym} 320 -800 0 0 {
name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false
      }
C {code.sym} 480 -800 0 0 {name=simulation only_toplevel=false value="

.tran 0.01n 20n
.param td = 0n

.control

echo "td,delay" > /home/sushanth/Desktop/HighSpeedScanFlop/muxfbff/dataModefall/delay.txt

let td = 0.6n
let step = 1p

while td <= 1.7n

  alterparam td = $&td
  let tdval = td

  reset
  destroy all

  run

  meas tran delay TRIG v(C) VAL=0.9 RISE=2 TARG v(Q) VAL=0.9 FALL=1

  if $&delay > 0
    echo "$&tdval,$&delay" >> /home/sushanth/Desktop/HighSpeedScanFlop/muxfbff/dataModefall/delay.txt
  end

  let td = td + step

end

.endc

"}
C {lab_pin.sym} 310 -550 0 0 {name=p2 sig_type=std_logic lab=DIN}
C {lab_pin.sym} 360 -530 0 0 {name=p3 sig_type=std_logic lab=TI}
C {lab_pin.sym} 410 -510 0 0 {name=p4 sig_type=std_logic lab=TE}
C {lab_pin.sym} 450 -490 0 0 {name=p5 sig_type=std_logic lab=TEN}
C {lab_pin.sym} 500 -470 0 0 {name=p6 sig_type=std_logic lab=C}
C {lab_pin.sym} 550 -450 0 0 {name=p7 sig_type=std_logic lab=CN}
C {/home/sushanth/Desktop/HighSpeedScanFlop/inverter/inv.sym} 1140 -590 0 0 {name=x2}
C {vdd.sym} 1230 -770 0 0 {name=l11 lab=VDD}
C {gnd.sym} 1230 -570 0 0 {name=l12 lab=0}
C {opin.sym} 1400 -670 0 0 {name=p8 lab=Q1}
C {/home/sushanth/Desktop/HighSpeedScanFlop/inverter/inv.sym} 1140 -280 0 0 {name=x3}
C {vdd.sym} 1230 -460 0 0 {name=l13 lab=VDD}
C {gnd.sym} 1230 -260 0 0 {name=l14 lab=0}
C {opin.sym} 1400 -360 0 0 {name=p9 lab=Q2}
C {/home/sushanth/Desktop/HighSpeedScanFlop/muxfbff/muxfbff.sym} 570 -340 0 0 {name=x1}
