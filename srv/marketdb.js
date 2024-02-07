

    
    

const cds = require('@sap/cds');
module.exports = cds.service.impl(function () {

    const { State, Product, Bussiness_Partner} = this.entities();

    this.on('READ', State, async(req) => {
        states = [
            {"code":"TS", "description":"Telangana"},
            {"code":"AP", "description":"AndhraPradesh"},
            {"code":"UP", "description":"UttarPradesh"},
            {"code":"MP", "description":"MadhyaPradesh"}
        ]
        states.$count=states.length;
        return states;
    })
    
    this.on(["CREATE", "UPDATE"], Product, async (req) => {
    const { product_cost,product_sell } = req.data; // 

  
    if (product_sell <= product_cost) {
        
        throw new Error("Selling price must be greater than cost price.");
    }

    
});

   
});
