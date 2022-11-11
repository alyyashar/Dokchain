pragma solidity >=0.4.17;

contract CertiVerify {
    mapping (string => uint256) documents; // storing date & time against file hash
    mapping (string => string) adderkey; // storing the adder's key
    mapping (string => string) addername; // storing the adder's name 
    
    function add(string memory _hash,string memory x) public {
        if(documents[_hash]>0)return;
        documents[_hash] = block.timestamp;
        adderkey[_hash] = x;
    }

    function verify_doc(string memory _hash) public view returns (uint256 dateAdded) {
        return documents[_hash];
    }
    
    function getadderkey(string memory _hash) public view returns (string memory name) {
        return adderkey[_hash];
    }
    
    function getaddername(string memory _pubkey) public view returns(string memory name) {
        return addername[_pubkey];
    }
    function verify_name(string memory _pubkey) public view returns(uint ok) {
           bytes memory mem = bytes(addername[_pubkey]);
           if(mem.length>0){
               return 1;
           }
           return 0;
       }
    function setaddername(string memory _pubkey,string memory name) public {
        addername[_pubkey] = name;
    }
}
