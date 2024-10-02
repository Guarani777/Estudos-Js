02/10/2024

function sistemaAtendimento(nome, idade, sintomas) {
    let urgencia;

    // Avaliando urgência de atendimento com base nos sintomas e idade
    if (idade >= 60 || idade <= 12) {
        urgencia = "alta";
    } else if (sintomas.includes("dor intensa") || sintomas.includes("falta de ar")) {
        urgencia = "alta";
    } else if (sintomas.includes("febre") || sintomas.includes("tosse")) {
        urgencia = "moderada";
    } else {
        urgencia = "baixa";
    }

    // Mensagem de retorno com base na urgência
    if (urgencia === "alta") {
        console.log(Paciente ${nome}, sua urgência de atendimento é ALTA. Por favor, dirija-se imediatamente à emergência.);
    } else if (urgencia === "moderada") {
        console.log(Paciente ${nome}, sua urgência de atendimento é MODERADA. Aguarde o chamado para consulta.);
    } else {
        console.log(Paciente ${nome}, sua urgência de atendimento é BAIXA. Aguarde por mais instruções.);
    }
}

// Testando o sistema
sistemaAtendimento("João", 45, ["febre", "tosse"]);
sistemaAtendimento("Maria", 70, ["dor intensa", "falta de ar"]);
sistemaAtendimento("Ana", 10, ["dor de cabeça"]);

Como funciona:

1. Idade: Se o paciente tiver 60 anos ou mais, ou 12 anos ou menos, a urgência é considerada "alta".


2. Sintomas: Se o paciente apresentar sintomas graves como "dor intensa" ou "falta de ar", a urgência é alta. Sintomas como "febre" ou "tosse" indicam urgência moderada, e outros sintomas têm urgência baixa.


3. A mensagem final de atendimento é exibida conforme o nível de urgência.



Isso é apenas um exemplo básico. Você pode expandir o sistema para incluir mais sintomas ou critérios de urgência!
