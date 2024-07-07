// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Importación de la interfaz ERC-1155
interface IERC1155 {
    function balanceOf(address account, uint256 id) external view returns (uint256);
}

contract NFTOwnershipChecker {
    // Dirección del contrato ERC-1155
    address public nftContractAddress;

    // Constructor para inicializar la dirección del contrato ERC-1155
    constructor(address _nftContractAddress) {
        nftContractAddress = _nftContractAddress;
    }

    // Función para verificar si una cuenta es propietaria de un NFT específico
    function isOwner(address account, uint256 tokenId) external view returns (bool) {
        // Creación de una instancia del contrato ERC-1155
        IERC1155 nftContract = IERC1155(nftContractAddress);

        // Consulta del balance del token en la cuenta especificada
        uint256 balance = nftContract.balanceOf(account, tokenId);

        // Retorna true si el balance es mayor que 0, de lo contrario false
        return balance > 0;
    }
}
