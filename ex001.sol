pragma solidity ^0.8.0; //versao: '^' => significa maior que essa consegue abrir


contract HelloWorld { // define que é um contrato em seguida o titulo
    string public name = 'Hello World'; // sem o 'public' o hello world nao aparece em lugar nenhum
}
/* depois do deploy, na parte inferior esquerda aparece aparece o [name]. 
Agora é possivel interagir com o contrato, buscar a variavel na blockchain e 
ela retornar hello world, porque no contrato eu disse que tinha uma variavel 
'name' e o valor dela é 'hello world'*/


