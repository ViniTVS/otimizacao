import sys


def main():
    # obtém entrada em formato de lista (um item para cada linha)
    entrada = sys.stdin.readlines()

    if (len(entrada) < 6):
        sys.exit(1) # erro de entrada
    # retira os \n de cada linha de entrada
    for i, linha in enumerate(entrada):
        entrada[i] = linha.replace("\n", "")

    n_vars = int(entrada[0])
    demandas = entrada[1].split(" ") # separa as demandas
    afluencias = entrada[2].split(" ") # separa as afluências

    if (len(demandas) != n_vars) or (len(afluencias) != n_vars):
        sys.exit(1) # erro de entrada

    linha = entrada[3].split(" ")
    # Volumes iniciais, min. e max e coef. de geração da Hidrelétrica
    Vini = linha[0]
    Vmin = linha[1]
    Vmax = linha[2]
    k = linha[3]

    linha = entrada[4].split(" ")
    # Geração max. e custo de geração da Termoelétrica 
    Tmax = linha[0]
    custo_ger = linha[1]
    # custo ambiental de cada 
    CA = entrada[5]

    # 
    saida = "min: "
    valores_min = []
    for i in range(1, n_vars + 1):
        valores_min.append("CA" + str(i) + " + CT" + str(i))

    saida += " + ".join(valores_min) + ";\n"
    print(saida)

    #   ------------------------------
    #   Custos Ambientais de cada mes:
    #   CAi = CA*Ai
    #   CA: Custo Ambiental 
    #   Ai: Variação no Volume no mes  
    #   CA = 0.005;
    #   ------------------------------ 
    for i in range(1, n_vars + 1):
        print("CA" + str(i) +  " = " + CA +"A" + str(i) + ";")
    #   -------------------------------------------------
    #   Ai = |Vi - Vi-1|
    # 
    #   Dividindo Ai entre seu valor absoluto e em módulo:
    #   Vi - Vi-1 = xi + zi (absoluto)
    #   Vi-1 + Vi = xi - zi (módulo)
    #   Então:
    #   Ai = xi + zi
    #   ---------------------------------------------------
    print()
    for i in range(1, n_vars + 1):
        print("x" + str(i) + " + z" + str(i) + " = V" + str(i-1) + " - V" + str(i) + ";")
        print("x" + str(i) + " - z" + str(i) + " = V" + str(i) + " - V" + str(i-1) + ";\n")
    # xi e zi >= 0
    for i in range(1, n_vars + 1):
        print("x" + str(i) + " >= 0;")
        print("z" + str(i) + " >= 0;\n")
    # Ai = xi + zi
    for i in range(1, n_vars + 1):
        print("A" + str(i) + " = x" + str(i) + " + z" + str(i) + ";")

    #   --------------------------
    #   Custo Termo por mes:
    #   CTi = PTi *CT
    #   PTi : Prod. Termo. no mes 
    #   CT : Custo Termo.
    #   CT : 0.2;
    #   -------------------------- 
    print()
    for i in range(1, n_vars + 1):
        print("CT" + str(i) + " = " + str(custo_ger) + "PT" + str(i) + ";")
    print()
    for i in range(1, n_vars + 1):
        print("PT" + str(i) + " >= 0;\nPT" + str(i) + " <= " + str(Tmax) + ";\n")

    #   --------------------------------------------
    #   Volume do reservatorio de cada mes:
    #   Vi = Vi-1 + Yi - VPi
    #   Vi: Volume no mes
    #   Yi: Volume de chuva mes
    #   VPi: Volume para Producao de energia no mes
    #   --------------------------------------------
    for i, Y in enumerate(afluencias):
        print("Y" + str(i+1) + " = " + Y + ";")

    print("\nV0 = " + Vini + ";")
    for i in range(1, n_vars + 1):
        print("V" + str(i) + " = " + "V" + str(i-1) + " + Y" + str(i) + " - VP" + str(i) + ";")
    print()
    for i in range(1, n_vars + 1):
        print("VP" + str(i) + " >= 0;")

    #   -----------------------------
    #   Restrições de demanda:
    #   PHi + PTi >= Di
    #   PHi: Prod. da Hidro. no mes
    #   PTi: Prod. da Termo. no mes
    #   Di: Demanda do mes
    #   ----------------------------
    for i in range(1, n_vars + 1):
        print("PH" + str(i) + " + PT" + str(i) + " >= " + demandas[i - 1] + ";")
    #   --------------------------
    #   coef. de geração da Hidro:
    #   k = 1.1;
    #   PHi = k*VPi 
    #   --------------------------
    print()
    for i in range(1, n_vars + 1):
        print("PH" + str(i) + " = " + k + "VP" + str(i) + ";")
  
    #   --------------------------------------------
    #   Restrições de volume:
    #   Vmin <= Vi <= Vmax
    #   -------------------------------------------- 
    print("\nVmin = " + Vmin +";\nVmax = " + Vmax + ";\n")
    for i in range(1, n_vars + 1):
        print("Vmin <= V" + str(i) + ";\nV" + str(i) + " <= Vmax;\n")

    # print(saida)
    sys.exit(0) # termina execução sem erros



if __name__ == "__main__":
    main()