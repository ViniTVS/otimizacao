min: CA1 + CA2 + CA3 + CT1 + CT2 + CT3;
/*  ------------------------------
    Custos Ambientais de cada mes:
    CAi = CA*Ai
    CA = Custo Ambiental 
    Ai = Variação no Volume no mes  
    CA = 0.005;
    ------------------------------ */
CA1 = 0.005A1;
CA2 = 0.005A2;
CA3 = 0.005A3;

/* 
    Ai = |Vi - Vi-1|
    
    Dividindo Ai entre seu valor absoluto e em módulo:
    Vi-1 - Vi = xi + zi (módulo)
    Vi - Vi-1 = xi - zi (absoluto)
    
    Ai = xi + zi
*/

x1 + z1 = V0 - V1;
x1 - z1 = V1 - V0;

x2 + z2 = V1 - V2;
x2 - z2 = V2 - V1;

x3 + z3 = V2 - V3;
x3 - z3 = V3 - V2;

x1 >= 0;
x2 >= 0;
x3 >= 0;

z1 >= 0;
z2 >= 0;
z3 >= 0;

A1 = x1 + z1;
A2 = x2 + z2;
A3 = x3 + z3;


/*  --------------------------
    Custo Termo por mes:
    CTi = PTi *CT
    PTi = Prod. Termo. no mes 
    CT = Custo Termo.
    CT = 0.2;
    -------------------------- */
CT1 = 0.2PT1;
CT2 = 0.2PT2;
CT3 = 0.2PT3;

PT1 >= 0;
PT2 >= 0;
PT3 >= 0;

/* PTi <= Tmax */
Tmax = 1000;

PT1 <= Tmax;
PT2 <= Tmax;
PT3 <= Tmax;


/*  --------------------------------------------
    Volume do reservatorio de cada mes:
    Vi = Vi-1 + Yi - VPi
    Vi = Volume no mes
    Yi = Volume de chuva mes
    VPi = Volume para Producao de energia no mes
    -------------------------------------------- */

Y1 = 500;
Y2 = 800;
Y3 = 200;
V0 = 500;

V1 = V0 + Y1 - VP1;
V2 = V1 + Y2 - VP2;
V3 = V2 + Y3 - VP3;

VP1 >= 0;
VP2 >= 0;
VP3 >= 0;
/*  --------------------------------------------
    Restrições de demanda:
    PHi + PTi >= Di
    PHi = Prod. da Hidro. no mes
    PTi = Prod. da Termo. no mes
    Di = Demanda do mes
    -------------------------------------------- */

PH1 + PT1 >= 900;
PH2 + PT2 >= 1000;
PH3 + PT3 >= 950;

/* 
    coef. de geração da Hidro. 
    k = 1.1;
    PHi = k*VPi 
*/
PH1 = 1.1VP1;
PH2 = 1.1VP2;
PH3 = 1.1VP3;


/*  --------------------------------------------
    Restrições de volume:
    Vmin <= Vi <= Vmax
    -------------------------------------------- */
Vmin = 200;
Vmax = 1000;

Vmin <= V1;
V1 <= Vmax;

Vmin <= V2;
V2 <= Vmax;

Vmin <= V3;
V3 <= Vmax;
