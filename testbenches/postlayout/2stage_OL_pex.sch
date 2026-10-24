v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -1250 -290 -1160 -290 {
lab=GND}
N -1190 -350 -1160 -350 {
lab=v1in}
N -1210 -330 -1160 -330 {
lab=v2in}
N -860 -370 -810 -370 {
lab=Vout}
N -1210 -350 -1190 -350 {
lab=v1in}
N -1250 -330 -1210 -330 {
lab=v2in}
N -1250 -350 -1210 -350 {
lab=v1in}
N -1250 -310 -1220 -310 {
lab=VDD}
N -1250 -370 -1160 -370 {
lab=VDD}
N -810 -370 -770 -370 {
lab=Vout}
N -820 -370 -820 -320 {
lab=Vout}
N -710 -360 -710 -320 {
lab=GND}
N -710 -370 -710 -360 {
lab=GND}
N -820 -320 -770 -320 {
lab=Vout}
C {/home/ttuser/projects/xschem_test/diffpair.sym} -1010 -330 0 0 {name=x1
schematic=x2stage_final


spice_sym_def=".include /home/ttuser/projects/2stage/2stage_pex.spice"

XPEX Iref VDD VSS Vout Vin+ Vin- x2stage_final}
C {devices/isource.sym} -1190 -310 3 0 {name=I0 value=6u}
C {devices/vsource.sym} -1300 -420 1 1 {name=V1 value=1.8 savecurrent=false}
C {devices/gnd.sym} -1270 -530 1 1 {name=l1 lab=GND}
C {devices/vsource.sym} -1240 -530 1 0 {name=V2 value=0.9 savecurrent=false}
C {devices/vsource.sym} -1090 -530 3 1 {name=V3 value="dc 0.9002651 ac 1" savecurrent=false}
C {devices/code_shown.sym} -840 -500 2 1 {name=s1 only_toplevel=false value="
.lib /home/ttuser/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.control
save all

op
print v(vout)

ac dec 100 1 10G

let vid = v(v2in)-v(v1in)
let av = v(vout)/vid
let av_db = db(av)
let av_phase = cph(av)*180/3.141592653589793

meas ac dc_gain_db find av_db at=1
meas ac ugf when av_db=0 fall=1
meas ac phase_at_ugf find av_phase at=ugf
let phase_margin = 180 + phase_at_ugf

print dc_gain_db
print ugf
print phase_at_ugf
print phase_margin

set wr_singlescale
set wr_vecnames
option numdgt=10
wrdata /home/ttuser/projects/2stage/ac_results.csv av_db av_phase

print dc_gain_db ugf phase_at_ugf phase_margin > /home/ttuser/projects/2stage/ac_summary.txt

set filetype=ascii
write /home/ttuser/projects/2stage/ac_results.raw all

plot av_db
plot av_phase
.endc
"


}
C {devices/lab_pin.sym} -850 -370 3 0 {name=p1 sig_type=std_logic lab=Vout
}
C {devices/lab_wire.sym} -1270 -420 0 1 {name=p5 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} -1250 -370 0 0 {name=p6 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} -1250 -310 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} -1210 -530 0 1 {name=p10 sig_type=std_logic lab=v1in}
C {devices/lab_wire.sym} -1120 -530 0 0 {name=p12 sig_type=std_logic lab=v2in}
C {devices/lab_wire.sym} -1250 -330 0 0 {name=p13 sig_type=std_logic lab=v2in}
C {devices/capa.sym} -740 -370 1 1 {name=C1
m=1
value=30p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} -1060 -530 3 0 {name=l2 lab=GND}
C {devices/gnd.sym} -1330 -420 1 1 {name=l3 lab=GND}
C {devices/gnd.sym} -1250 -290 1 1 {name=l4 lab=GND}
C {devices/gnd.sym} -710 -370 3 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} -1250 -350 0 0 {name=p2 sig_type=std_logic lab=v1in}
C {devices/res.sym} -740 -320 3 1 {name=R1
value=10Meg

footprint=1206
device=resistor
m=1}