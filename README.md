# NFT-Owner-Validator


## Importación de la interfaz ERC-1155:


      interface IERC1155 {
          function balanceOf(address account, uint256 id) external view returns (uint256);
      }

Esta interfaz define la función balanceOf, que se utiliza para consultar el balance de un token específico para una cuenta.

## Definición del contrato NFTOwnershipChecker:


      contract NFTOwnershipChecker {
          address public nftContractAddress;
      
          constructor(address _nftContractAddress) {
              nftContractAddress = _nftContractAddress;
          }
      
          function isOwner(address account, uint256 tokenId) external view returns (bool) {
              IERC1155 nftContract = IERC1155(nftContractAddress);
              uint256 balance = nftContract.balanceOf(account, tokenId);
              return balance > 0;
          }
      }
      
## Constructor: Inicializa la dirección del contrato ERC-1155.
Función isOwner: Verifica si una cuenta (account) posee un token específico (tokenId). 
Utiliza la función balanceOf del contrato ERC-1155 para obtener el balance de ese token en la cuenta especificada. 
Si el balance es mayor que 0, retorna true, indicando que la cuenta es propietaria del NFT. De lo contrario, retorna false.

## Uso del Contrato:
Despliega el contrato NFTOwnershipChecker, proporcionando la dirección del contrato ERC-1155 que contiene los NFT.
Llama a la función isOwner con la dirección de la cuenta y el ID del token para verificar la propiedad del NFT.
Este fragmento de código te permitirá verificar si una cuenta específica posee un NFT en particular dentro de un contrato ERC-1155.
