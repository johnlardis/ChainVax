pragma solidity ^0.5.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";
contract ChainVax is ERC721Full {
    
    
    constructor() ERC721Full("ChainVax", "CVX") public { }
    using Counters for Counters.Counter;
    Counters.Counter token_ids;
    uint public test;
    struct Vax {
      //Implement car struct
      string DOB;
      string NAME;
      string vaccinationType;
      string vaccinationDate;
      string vaccineSerialNumber;
      address recipient;


    }
    // Only permanent data that you would need to use in a smart contract later should be stored on-chain
    mapping(uint=>Vax) public vaccination;
    
    event newVaccination(uint token_id, string token_uri);
    
    function testFunction()public{
        test += 1;
    }
    
    function registerVaccineDose(address owner, string memory DOB,string memory NAME, string memory vaccinationType, string memory vaccinationDate, string memory vaccineSerialNumber, string memory token_uri, address recipient) public returns(uint) {
        //Implement registerVehicle
        token_ids.increment();
        uint token_id = token_ids.current();
        vaccination[token_id] = Vax(DOB, NAME, vaccinationType, vaccinationDate, vaccineSerialNumber, recipient); 
    
        _mint(owner, token_id);
        
        _setTokenURI(token_id, token_uri);
        
        safeTransferFrom(owner, recipient, token_id);
        
        emit newVaccination(token_id, token_uri);
        
        return token_id;
    }
        
}
// 0xc4026624e88D1fdC6E53cf901b22Dff30423F2ee, 24/12/1980, Lolo Jones, Pfizer, 14/08/2021, 4684654, https://gateway.pinata.cloud/ipfs/QmYg7fV2Z9dZRYcjXzijEouHdSvaNR2g7EnEwPm2jRuGW4, 0x664c6Fc5Cd6AeE17884a536F71dce8aeCB0FF449
// 0xEA47d6B14a2175F26cd0E36D9CaC6D187CC565d5, 06/04/1945, Granny Smith, AstraZeneca, 02/06/2021, 8976543, https://gateway.pinata.cloud/ipfs/QmRYryuoAB61fKPJVosbe8FGTS76MQCkfgbKH6uEPps5Jf, 0x6B82615888B2680352c9F1F43f6063a8C79f6b84
// 0xEA47d6B14a2175F26cd0E36D9CaC6D187CC565d5, 31/08/2003, Greg Sims, Pfizer, 31/08/2021, 66584, https://gateway.pinata.cloud/ipfs/QmTpMMzuLsjDr7C8jbFd2WPdemQUiyTmgZgNBusfLRjNKf, 0x6B82615888B2680352c9F1F43f6063a8C79f6b84