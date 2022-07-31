min: CA1 + CT1 + CA2 + CT2 + CA3 + CT3 + CA4 + CT4 + CA5 + CT5;

CA1 = 0.005A1;
CA2 = 0.005A2;
CA3 = 0.005A3;
CA4 = 0.005A4;
CA5 = 0.005A5;

x1 + z1 = V0 - V1;
x1 - z1 = V1 - V0;

x2 + z2 = V1 - V2;
x2 - z2 = V2 - V1;

x3 + z3 = V2 - V3;
x3 - z3 = V3 - V2;

x4 + z4 = V3 - V4;
x4 - z4 = V4 - V3;

x5 + z5 = V4 - V5;
x5 - z5 = V5 - V4;

x1 >= 0;
z1 >= 0;

x2 >= 0;
z2 >= 0;

x3 >= 0;
z3 >= 0;

x4 >= 0;
z4 >= 0;

x5 >= 0;
z5 >= 0;

A1 = x1 + z1;
A2 = x2 + z2;
A3 = x3 + z3;
A4 = x4 + z4;
A5 = x5 + z5;

CT1 = 0.2PT1;
CT2 = 0.2PT2;
CT3 = 0.2PT3;
CT4 = 0.2PT4;
CT5 = 0.2PT5;

PT1 >= 0;
PT1 <= 1000;

PT2 >= 0;
PT2 <= 1000;

PT3 >= 0;
PT3 <= 1000;

PT4 >= 0;
PT4 <= 1000;

PT5 >= 0;
PT5 <= 1000;

Y1 = 500;
Y2 = 500;
Y3 = 500;
Y4 = 500;
Y5 = 500;

V0 = 500;
V1 = V0 + Y1 - VP1;
V2 = V1 + Y2 - VP2;
V3 = V2 + Y3 - VP3;
V4 = V3 + Y4 - VP4;
V5 = V4 + Y5 - VP5;

VP1 >= 0;
VP2 >= 0;
VP3 >= 0;
VP4 >= 0;
VP5 >= 0;
PH1 + PT1 >= 1000;
PH2 + PT2 >= 1000;
PH3 + PT3 >= 1000;
PH4 + PT4 >= 1000;
PH5 + PT5 >= 1000;

PH1 = 2.0VP1;
PH2 = 2.0VP2;
PH3 = 2.0VP3;
PH4 = 2.0VP4;
PH5 = 2.0VP5;

Vmin = 200;
Vmax = 1000;

Vmin <= V1;
V1 <= Vmax;

Vmin <= V2;
V2 <= Vmax;

Vmin <= V3;
V3 <= Vmax;

Vmin <= V4;
V4 <= Vmax;

Vmin <= V5;
V5 <= Vmax;

