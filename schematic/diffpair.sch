v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -130 -360 -130 -310 {
lab=VDD}
N 60 -360 60 -310 {
lab=VDD}
N 10 -80 60 -80 {
lab=#net1}
N -40 -280 20 -280 {
lab=#net2}
N -140 140 -10 140 {
lab=VSS}
N 210 -360 210 -310 {
lab=VDD}
N -10 140 160 140 {
lab=VSS}
N 170 -360 210 -360 {
lab=VDD}
N 60 -360 120 -360 {
lab=VDD}
N -130 -250 -130 -190 {
lab=#net2}
N 80 -280 80 -190 {
lab=#net1}
N -250 140 -140 140 {
lab=VSS}
N 210 -110 210 -90 {
lab=Vout}
N 210 -90 210 -30 {
lab=Vout}
N 210 30 210 80 {
lab=VSS}
N -130 -190 -130 -80 {
lab=#net2}
N 60 -250 60 -80 {
lab=#net1}
N 150 -280 170 -280 {
lab=#net1}
N -70 -20 -70 20 {
lab=#net3}
N -130 -20 10 -20 {
lab=#net3}
N -250 -10 -170 -10 {
lab=Iref}
N -170 -10 -170 50 {
lab=Iref}
N 140 0 170 0 {
lab=Iref}
N 210 -190 210 -110 {
lab=Vout}
N 160 140 210 140 {
lab=VSS}
N 120 -360 170 -360 {
lab=VDD}
N 60 -190 90 -190 {
lab=#net1}
N 80 -280 150 -280 {
lab=#net1}
N 210 -250 210 -190 {
lab=Vout}
N -250 80 -250 140 {
lab=VSS}
N -70 80 -70 140 {
lab=VSS}
N 210 80 210 140 {
lab=VSS}
N -250 -10 -250 20 {
lab=Iref}
N -130 -360 60 -360 {
lab=VDD}
N 60 -280 70 -280 {
lab=VDD}
N 70 -360 70 -280 {
lab=VDD}
N -170 -280 -170 -260 {
lab=#net2}
N -170 -260 -170 -240 {
lab=#net2}
N -170 -240 -130 -240 {
lab=#net2}
N -130 -240 -40 -240 {
lab=#net2}
N -40 -280 -40 -240 {
lab=#net2}
N 210 -280 220 -280 {
lab=VDD}
N 210 -360 220 -360 {
lab=VDD}
N 220 -360 220 -280 {
lab=VDD}
N -130 -280 -120 -280 {
lab=VDD}
N -120 -360 -120 -280 {
lab=VDD}
N -130 -50 -120 -50 {
lab=VSS}
N -120 -50 -120 140 {
lab=VSS}
N 10 -50 20 -50 {
lab=VSS}
N 20 -50 20 140 {
lab=VSS}
N -250 50 -240 50 {
lab=VSS}
N -240 50 -240 140 {
lab=VSS}
N -290 10 -290 50 {
lab=Iref}
N -290 10 -250 10 {
lab=Iref}
N -170 50 -110 50 {
lab=Iref}
N -70 50 -60 50 {
lab=VSS}
N -60 50 -60 140 {
lab=VSS}
N -110 40 -110 50 {
lab=Iref}
N -110 40 140 40 {
lab=Iref}
N 140 0 140 40 {
lab=Iref}
N 210 0 220 0 {
lab=VSS}
N 220 0 220 140 {
lab=VSS}
N 210 140 220 140 {
lab=VSS}
N 120 -170 120 140 {
lab=VSS}
C {devices/ipin.sym} -30 -50 0 0 {name=Vin+1 lab=Vin+}
C {devices/ipin.sym} -250 -10 0 0 {name=Iref lab=Iref}
C {devices/ipin.sym} -170 -50 0 0 {name=Vin- lab=Vin-}
C {devices/opin.sym} 210 -60 0 0 {name=Vout lab=Vout}
C {devices/ipin.sym} -70 140 3 0 {name=VSS lab=VSS}
C {devices/ipin.sym} -50 -360 1 0 {name=VDD lab=VDD}
C {sky130_fd_pr/cap_mim_m3_1.sym} 180 -190 3 0 {name=C2 model=cap_mim_m3_1 W=30 L=26.4 MF=5 spiceprefix=X}
C {sky130_fd_pr/res_xhigh_po_0p35.sym} 120 -190 3 0 {name=R1
L=14.7


model=res_xhigh_po_0p35
spiceprefix=X
mult=1}
C {sky130_fd_pr/pfet_01v8.sym} -150 -280 0 0 {name=M1
L=2
W=90
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
C {sky130_fd_pr/pfet_01v8.sym} 40 -280 0 0 {name=M2
L=2
W=90
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
C {sky130_fd_pr/pfet_01v8.sym} 190 -280 0 0 {name=M3
L=2
W=45
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
C {sky130_fd_pr/nfet_01v8.sym} -150 -50 0 0 {name=M4
L=2
W=30
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
C {sky130_fd_pr/nfet_01v8.sym} -10 -50 0 0 {name=M5
L=2
W=30
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
C {sky130_fd_pr/nfet_01v8.sym} -270 50 0 0 {name=M6
L=0.5
W=15
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
C {sky130_fd_pr/nfet_01v8.sym} -90 50 0 0 {name=M7
L=0.5
W=15
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
C {sky130_fd_pr/nfet_01v8.sym} 190 0 0 0 {name=M8
L=0.5
W=8
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