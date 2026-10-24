v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -160 -360 -20 -360 {
lab=VDD}
N -130 -360 -130 -310 {
lab=VDD}
N -20 -360 60 -360 {
lab=VDD}
N 60 -360 60 -310 {
lab=VDD}
N 10 -80 60 -80 {
lab=voutn}
N -40 -280 -40 -190 {
lab=voutp}
N -40 -280 20 -280 {
lab=voutp}
N -140 140 -10 140 {
lab=GND}
N 210 -360 210 -310 {
lab=VDD}
N -10 140 160 140 {
lab=GND}
N 170 -360 210 -360 {
lab=VDD}
N 60 -360 120 -360 {
lab=VDD}
N -130 -250 -130 -190 {
lab=voutp}
N 80 -280 80 -190 {
lab=voutn}
N -250 140 -140 140 {
lab=GND}
N 210 -110 210 -90 {
lab=vout}
N 210 -90 210 -30 {
lab=vout}
N 210 30 210 80 {
lab=#net1}
N -250 -360 -250 -190 {
lab=VDD}
N -250 -360 -160 -360 {
lab=VDD}
N -130 -190 -130 -80 {
lab=voutp}
N 60 -250 60 -80 {
lab=voutn}
N 150 -280 170 -280 {
lab=voutn}
N -70 -20 -70 20 {
lab=#net2}
N -130 -20 10 -20 {
lab=#net2}
N -290 50 -110 50 {
lab=vbias}
N -250 -130 -250 20 {
lab=vbias}
N -250 -10 -170 -10 {
lab=vbias}
N -170 -10 -170 50 {
lab=vbias}
N -170 -280 -40 -280 {
lab=voutp}
N -130 -190 -40 -190 {
lab=voutp}
N 140 0 140 50 {
lab=vbias}
N 140 0 170 0 {
lab=vbias}
N 310 10 310 140 {
lab=GND}
N 210 140 310 140 {
lab=GND}
N 310 10 390 10 {
lab=GND}
N -110 50 90 50 {
lab=vbias}
N 210 -190 210 -110 {
lab=vout}
N 270 -50 390 -50 {
lab=vout}
N 210 -50 270 -50 {
lab=vout}
N 90 50 140 50 {
lab=vbias}
N 160 140 210 140 {
lab=GND}
N 120 -360 170 -360 {
lab=VDD}
N 60 -190 90 -190 {
lab=voutn}
N 80 -280 150 -280 {
lab=voutn}
C {devices/vdd.sym} -160 -360 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} -160 140 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -770 -250 0 0 {name=Vdd value=1.8 savecurrent=false}
C {devices/vdd.sym} -770 -280 0 0 {name=l4 lab=VDD}
C {devices/gnd.sym} -770 -220 0 0 {name=l5 lab=GND}
C {devices/ipin.sym} -30 -50 0 0 {name=vin_n lab=v1in}
C {devices/vsource.sym} -910 -250 0 0 {name=vinp value = "dc 0.9000 ac 0.5 0" savecurrent=false}
C {devices/vsource.sym} -1040 -250 0 0 {name=vinn value="pulse(1.1 0.7 1u 10n 10n 100u 200u)" savecurrent=false}
C {devices/ipin.sym} -1040 -280 1 0 {name=vinn2 lab=v1in}
C {devices/gnd.sym} -910 -220 0 0 {name=l6 lab=GND}
C {devices/gnd.sym} -1040 -220 0 0 {name=l7 lab=GND}
C {devices/code_shown.sym} -940 -500 2 1 {name=s1 only_toplevel=false value="
.lib /home/ttuser/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.control
save all

op
tran 1n 15u

plot v(v1in) v(vout)

* Large falling step: 1.1 V -> 0.7 V
* Step size = 0.4 V

meas tran vfinal find v(vout) at=15u
meas tran vmin min v(vout) from=1u to=15u
meas tran vmax max v(vout) from=1u to=15u

* Step midpoint
meas tran tstep when v(v1in)=0.9 fall=1

* Fall time: 90% to 10%
* 90% level = 1.06 V
* 10% level = 0.74 V
meas tran t90 when v(vout)=1.06 fall=1
meas tran t10 when v(vout)=0.74 fall=1

* 2% settling band around final value 0.7 V
* 2% of 0.4 V = 8 mV
* Band = 0.692 V to 0.708 V
meas tran t_upper when v(vout)=0.708 fall=last
meas tran t_lower when v(vout)=0.692 rise=last

* Slew rate
let dvout = deriv(v(vout))
let neg_dvout = -dvout
meas tran sr_fall max neg_dvout from=1u to=5u

* Calculated values
let fall_time = t10 - t90
let undershoot_pct = (vfinal - vmin)/0.4*100
let overshoot_before_fall_pct = (vmax - 1.1)/0.4*100

let ts_upper = t_upper - tstep
let ts_lower = t_lower - tstep

print fall_time
print undershoot_pct
print overshoot_before_fall_pct
print ts_upper
print ts_lower
print sr_fall

.endc
"

}
C {sky130_fd_pr/nfet3_01v8.sym} -150 -50 0 0 {name=MN1
L=2
W=30
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} -10 -50 0 0 {name=MN2
L=2
W=30
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} -150 -280 0 0 {name=MP1
L=2
W=90
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 40 -280 0 0 {name=MP2
L=2
W=90
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/isource.sym} -250 -160 0 0 {name=Iref value=7u}
C {devices/vsource.sym} -70 110 0 0 {name=Vsen2 value=0 savecurrent=false}
C {sky130_fd_pr/pfet3_01v8.sym} 190 -280 0 0 {name=MP3
L=2
W=45
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} 190 0 0 0 {name=MN3
L=0.5
W=8
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/vsource.sym} 210 110 0 0 {name=Vsen3 value=0 savecurrent=false}
C {devices/lab_pin.sym} 210 -40 2 0 {name=p4 sig_type=std_logic lab=vout}
C {devices/vsource.sym} -250 110 0 0 {name=Vsen1 value=0 savecurrent=false}
C {devices/capa-2.sym} 180 -190 3 0 {name=C1
m=1
value=8p
footprint=1206
device=polarized_capacitor}
C {sky130_fd_pr/nfet3_01v8.sym} -90 50 0 0 {name=MN4
L=0.5
W=15
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} -270 50 0 0 {name=MN5
L=0.5
W=15
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/capa-2.sym} 310 -20 0 0 {name=C2
m=1
value=30p
footprint=1206
device=polarized_capacitor}
C {devices/res.sym} 120 -190 1 0 {name=Rz
value=100k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 60 -110 2 0 {name=p1 sig_type=std_logic lab=voutn}
C {devices/lab_pin.sym} -130 -110 2 0 {name=p2 sig_type=std_logic lab=voutp}
C {devices/lab_pin.sym} 20 50 3 0 {name=p3 sig_type=std_logic lab=vbias}
C {devices/vsource.sym} 210 -220 0 0 {name=Vsen4 value=0 savecurrent=false}
C {devices/res.sym} 390 -20 0 0 {name=R2
value=10meg
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} -170 -50 0 0 {name=p5 sig_type=std_logic lab=vout}