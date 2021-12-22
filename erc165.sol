pragma solidity >= 0.7.0 < 0.9.0;

interface IERC165  {
    //byte4: byte - is a dynamic array of bytes
    function supportsInterface(bytes4 interfaceId) external view returns(bool); 

}


contract ERC165 is IERC165 {

    function calculationFunction() public view returns(bytes4) {
        return bytes4(keccak256('supportsInterface(bytes4)'));
    }

    //hash table to keep track of contract fingerprint data of byte function conversions
    mapping(bytes4 => bool) private _supportedInterfaces; 
    
    function supportsInterface(bytes4 interfaceId) external override view returns(bool) {
       return _supportedInterfaces[interfaceId];
    }

    constructor() {
        _registerInterface(0x01ffc9a7);
    }

    //registering the interface
    function _registerInterface(bytes4 interfaceId) public {
        require(interfaceId != 0xffffffff, "ERC165 - invalid interface");
        _supportedInterfaces[interfaceId] = true;
    }
}
