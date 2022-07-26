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

CA1 >= 0;
CA2 >= 0;
CA3 >= 0;
/* 
    Ai = Vi - Vi-1

    e: 
     Ai  = ai - zi
    |Ai| = ai + zi
*/


dif2 - dif1 = V1 - V0;
dif3 - dif2 = V1 - V0;
dif4 - dif3 = V1 - V0;

dif11 - dif12 = V0 - V1;
dif11 + dif12 = V1 - V0;

dif21 - dif22 = V1 - V1;
dif21 + dif22 = V1 - V2;

dif31 - dif32 = V3 - V2;
dif31 + dif32 = V2 - V3;

dif11 >= 0;
dif21 >= 0;
dif31 >= 0;

dif12 >= 0;
dif22 >= 0;
dif32 >= 0;


A1 = dif11 + dif12;
A2 = dif21 + dif22;
A3 = dif31 + dif32;

A1 >= 0;
A2 >= 0;
A3 >= 0;


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
    Restrições de demanzda:
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

/* PTi <= Tmax */
Tmax = 1000;

PT1 <= Tmax;
PT2 <= Tmax;
PT3 <= Tmax;

PT1 >= 0;
PT2 >= 0;
PT3 >= 0;

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
