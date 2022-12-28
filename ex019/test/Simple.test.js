const Simple = artifacts.require("Simple")

Contract("Simple", (Accounts) => {

    var instance;
    var contaCriou = account[0];

    it("Simple coin foi migrado", async() => {
         //await deve estar sempre dentro de uma função async

        let instance = await Simple.deployed();
        assert(instance, "o contrato nao foi migrado");
//1-ver se foi feito o deploy
//TERMINAL: truffle test... deve falhar pq não foi feito o arquivo de migração
    })
    it("valor inicial do valor", async() => {

        let valor = await instance.valor();
        assert(valor==2000, "o valor nao foi de 2000");
    })
    it("balanceof de quem criou o contrato", async() => {
        let balanco = await instance.balanceof(contaCriou);
        assert(balanco == 2000, "quem criou nao recebeu os 2000");
    })
})
// toda vez que faz o truffle test, o truffle compila e migra os contratos

