//tamanho da grade
int tamanho = 400;

//variáveis que armazenam o estado atual e o anterior
int A[][] = new int[tamanho][tamanho];
int B[][] = new int[tamanho][tamanho];

//definimos o tamanho da grade a ser usado (x2 porque quero fazer pixels "gordinhos")
void settings() {
  size(tamanho * 2, tamanho * 2);
}

//estado inicial
void setup() { //<>//
  //fundo branco
  background(255);
  noStroke();
  //preenchemos a matriz A (nosso estado atual) com 0's e 1's, ao acaso
  for (int i = 0; i < tamanho; i++) {
    for (int j = 0; j < tamanho; j++) {
      A[i][j] = (random(1) < 0.1) ? 1 : 0; //isso é uma outra notação para se
      //significa: se número aleatório é menor que 0.1, então vai ser 1, caso contrário, vai ser 0
      B[i][j] = 0;
    }
  }
  //desenhamos a matriz A na tela
  for (int i = 0; i < tamanho; i++) {
    for (int j = 0; j < tamanho; j++) {
      fill(A[i][j] * 255);
      rect(i * 2, j * 2, 2, 2);
    }
  }
}

//isso vai ser atualizado a cada passo
void draw() {
  //varremos a nossa grade
  for (int i = 1; i < tamanho - 1; i++) { //<>//
    for (int j = 1; j < tamanho - 1; j++) {
      //calculamos o número de células "vivas" na vizinhança
      //como é 0 e 1, basta somar
      int sum = A[i - 1][j - 1] + A[i - 1][j] + A[i - 1][j + 1] + 
                A[i][j - 1] + A[i][j + 1] + 
                A[i + 1][j - 1] + A[i + 1][j] + A[i + 1][j + 1]; //<>//
      //aplicamos a nossa regra
      //se a célula estiver viva
      if (A[i][j] == 1) {
        //se tem 2 ou 3 vizinhos, permanece viva
        if (sum >= 2 & sum <= 3) B[i][j] = 1;
        //caso contrário, morre
        else B[i][j] = 0;
      } else { //se a célula estiver morta
        //se a célula está morta e tem exatamente 3 vizinhos, ela fica viva, caso contrário ela continua morta
        if (sum == 3) B[i][j] = 1;
        else B[i][j] = 0;        
      }
      //note que salvamos o resultado em B
    }
  }
  //passamos os valores de B para A, e desenhamos A na tela
  for (int i = 0; i <tamanho; i++) {
    for (int j = 0; j < tamanho; j++) {
      A[i][j] = B[i][j];
      fill(A[i][j] * 255);
      rect(i * 2, j * 2, 2, 2);
    }
  }
}
