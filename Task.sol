pragma solidity ^0.6.0;

contract Orders
{
    
    
    struct order
    {
        bool Buyer;
        uint256 price;
    }
    mapping (address=>order) user;
    
   
    function showRecord() public view returns(uint256,bool)
    {
        
      return (user[msg.sender].price,user[msg.sender].Buyer);  
        
    }
    
    function setOrder(uint256 _price, bool isBuyer) public
    {
        user[msg.sender].Buyer=isBuyer;
        user[msg.sender].price=_price;
    }
    
   
    function BuySellConditions(address adr1,address adr2)public returns (uint256,uint256)
    {
        
        
        
        if(user[adr1].price==user[adr2].price && user[adr1].Buyer!=user[adr2].Buyer)
        {
            
            user[adr1].price=0;
            user[adr2].price=0;
        }
        else if (user[adr1].price==user[adr2].price&& user[adr1].Buyer==user[adr2].Buyer)
        {
            return (user[adr1].price,user[adr2].price);
        }
        
    }
    
    
    
}