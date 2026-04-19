// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaBotsuana
 * @dev Registro de fragmentacion mecanica de proteinas y acidez de almidones.
 * Serie: Sabores de Africa (37/54)
 */
contract CulturaBotsuana {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 fragmentacionFibra; // Nivel de deshilachado de la carne (1-10)
        uint256 nivelAcidez;        // Grado de fermentacion del Bogobe (1-5)
        bool coccionEnOllaHierro;   // Validador de metodo tradicional (Three-legged pot)
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con el Seswaa (Ingenieria de la Fibra)
        registrarPlato(
            "Seswaa", 
            "Carne de res o cabra, agua, sal.",
            "Coccion prolongada hasta que la carne colapsa; deshilachado manual mediante batido mecanico.",
            10, 
            1, 
            true
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _fibra, 
        uint256 _acidez,
        bool _hierro
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        require(_fibra <= 10, "Escala de fibra excedida");

        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            fragmentacionFibra: _fibra,
            nivelAcidez: _acidez,
            coccionEnOllaHierro: _hierro,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
