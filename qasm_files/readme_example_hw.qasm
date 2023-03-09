OPENQASM 3.0;
include "stdgates.inc";

input float[64] a;

bit[2] mid;
bit[3] out;

gate my_gate(a) c, t {
  gphase(a / 2);
  ry(a) c;
  cx c, t;
}

gate my_phase(a) c {
  ctrl @ inv @ gphase(a) c;
}

my_gate(a * 2) $0, $1;
measure $0 -> mid[0];
measure $1 -> mid[1];

while (mid == "00") {
  reset $0;
  reset $1;
  my_gate(a) $0, $1;
  my_phase(a - pi/2) $1;
  mid[0] = measure $0;
  mid[1] = measure $1;
}

out[0] = measure $0;
out[1] = measure $1;
out[2] = measure $2;
