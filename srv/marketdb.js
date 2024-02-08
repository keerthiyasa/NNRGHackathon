

    
    

const cds = require('@sap/cds');
module.exports = cds.service.impl(function () {

    const { State, Product, Bussiness_Partner} = this.entities();
    this.on("READ", Bussiness_Partner, async (req) => {
        const results = await cds.run(req.query);
        return results;
      });
    this.before("CREATE",  Bussiness_Partner, async (req) => {
        const { bpno, is_gstn_registered, gstn } = req.data;
        if (is_gstn_registered && !gstn) {
            req.error({
                code: "MISSING_GST_NUM",
                message: "GSTIN number is mandatory when is_gstn_registered is true",
                target: "gstn",
            });
        }
    });
    this.before("CREATE",  Bussiness_Partner, async (req) => {
        const { is_gstn_registered, gstn } = req.data;
    
        if (is_gstn_registered && !gstn) {
            req.error({
                code: "MISSING_GST_NUM",
                message: "GSTIN number is mandatory when is_gstn_registered is true",
                target: "gstn",
            });
        }
    });
    

    this.on('READ', State, async(req) => {
        states = [
            {"code":"TS", "description":"Telangana"},
            {"code":"AP", "description":"AndhraPradesh"},
            {"code":"UP", "description":"UttarPradesh"},
            {"code":"MP", "description":"MadhyaPradesh"}
        ]
        states.$count=states.length;
        return states;
    });
    
    this.on(["CREATE", "UPDATE"], Product, async (req) => {
    const { product_cost,product_sell } = req.data; // 

  
    if (product_sell <= product_cost) {
        
        throw new Error("Selling price must be greater than cost price.");
    }

    
});

   
});
