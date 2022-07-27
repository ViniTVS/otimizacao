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


    saida = "min: "
    valores_min = []
    for i in range(1, n_vars + 1):
        valores_min.append("CA" + str(i) + " + CT" + str(i))

    saida += " + ".join(valores_min) + "\n\n"

    #   ------------------------------
    #   Custos Ambientais de cada mes:
    #   CAi = CA*Ai
    #   CA: Custo Ambiental 
    #   Ai: Variação no Volume no mes  
    #   CA = 0.005;
    #   ------------------------------ 
    for i in range(1, n_vars + 1):
        saida += "CA" + str(i) +  " = " + CA +"A" + str(i) + ";\n"
    #   -------------------------------------------------
    #   Ai = |Vi - Vi-1|
    # 
    #   Dividindo Ai entre seu valor absoluto e em módulo:
    #   Vi - Vi-1 = xi + zi (absoluto)
    #   Vi-1 + Vi = xi - zi (módulo)
    #   Então:
    #   Ai = xi + zi
    #   ---------------------------------------------------
    saida += "\n"
    for i in range(1, n_vars + 1):
        saida += "x" + str(i) + " - z" + str(i) + " = V" + str(i-1) + " - V" + str(i) + ";\n"
        saida += "x" + str(i) + " + z" + str(i) + " = V" + str(i) + " - V" + str(i-1) + ";\n\n"

    for i in range(1, n_vars + 1):
        saida += "x" + str(i) + " >= 0;\n"
        saida += "z" + str(i) + " >= 0;\n\n"

    for i in range(1, n_vars + 1):
        saida += "A" + str(i) + " = x" + str(i) + " + z" + str(i) + ";\n"

    #   --------------------------
    #   Custo Termo por mes:
    #   CTi = PTi *CT
    #   PTi : Prod. Termo. no mes 
    #   CT : Custo Termo.
    #   CT : 0.2;
    #   -------------------------- 

    saida += "\n"
    for i in range(1, n_vars + 1):
        saida += "CT" + str(i) + " = " + str(custo_ger) + "PT" + str(i) + ";\n"

    saida += "\n"
    for i in range(1, n_vars + 1):
        saida += "PT" + str(i) + " >= 0;\nPT" + str(i) + " <= " + str(Tmax) + ";\n"


    print(saida)




    sys.exit(0) # termina execução sem erros



if __name__ == "__main__":
    main()