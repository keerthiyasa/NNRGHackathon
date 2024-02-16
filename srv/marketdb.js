

    
    

const cds = require('@sap/cds');
module.exports = cds.service.impl(function () {

    const { State, Product, Bussiness_Partner,Purchase} = this.entities();
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
    this.on("READ", Product, async (req) => {
        const results = await cds.run(req.query);
        return results;
      });
    this.before(['CREATE'], Product, async(req) => {
        
        const { product_sell, product_cost } = req.data;
        if (product_sell <= product_cost ) {
            req.error({
                'code': 'INVALID_SELLING_PRICE',
                'message': 'Selling price must be greater than the cost price',
                'target': 'product_sell'
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
    const cds = require('@sap/cds');

    module.exports = cds.service.impl(async (srv) => {
        const { Purchase, Unique_BPNUM } = srv.entities;
    
        this.before('CREATE', 'Purchase', async (req) => {
            const { Unique_BPNUM: businessPartner } = req.data;
            
            // Fetch the business partner to check if it is a vendor
            const tx = cds.transaction(req);
            const fetchedBusinessPartner = await tx.read(Unique_BPNUM).where({ ID: businessPartner.ID });
            
            if (!fetchedBusinessPartner || fetchedBusinessPartner.is_vendor !== 'yes') {
                req.error({
                    code: 'INVALID_BUSINESS_PARTNER',
                    message: 'Business partner is not a vendor',
                    target: 'Unique_BPNUM'
                });
            }
        });
    
        this.on('CREATE', 'Purchase', async (req) => {
            return await cds.transaction(req).run(req);
        });
    });
      
});
    
    
    
    
    
    

