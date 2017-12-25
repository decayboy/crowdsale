pragma solidity ^0.4.11;

import "./MintableMasterToken.sol";
import "zeppelin-solidity/contracts/token/PausableToken.sol";


/**
* @dev Pre main Bitcalve CAT token ERC20 contract
* Based on references from OpenZeppelin: https://github.com/OpenZeppelin/zeppelin-solidity
*/
contract CAToken is MintableMasterToken, PausableToken {
    
    // Metadata
    string public constant symbol = "CLAVE";
    string public constant name = "BitCLave";
    uint8 public constant decimals = 18;
    string public constant version = "2.0";

    function mintToAddresses(address[] addresses, uint256 amount) public onlyMintMasterOrOwner canMint {
        for (uint i = 0; i < addresses.length; i++) {
            require(mint(addresses[i], amount));
        }
    }

    function mintToAddressesAndAmounts(address[] addresses, uint256[] amounts) public onlyMintMasterOrOwner canMint {
        require(addresses.length == amounts.length);
        for (uint i = 0; i < addresses.length; i++) {
            require(mint(addresses[i], amounts[i]));
        }
    }

    /**
    * @dev Override MintableTokenn.finishMinting() to add canMint modifier
    */
    function finishMinting() onlyOwner canMint public returns(bool) {
        return super.finishMinting();
    }

}
