const cds = require('@sap/cds');
module.exports = cds.service.impl(function () {

    const { State, Product, Bussiness_Partner,Purchase,Sales,Stock} = this.entities();
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
        const { bpno,is_gstn_registered, gstn } = req.data;
    
        if (gstn && !is_gstn_registered) {
            req.error({
                code: "MISSING_is_gstn_registered",
                message: "is_gstn_registered is mandatory when GSTIN number is given",
                target: "is_gstn_registered",
            });
        }
    });
    this.before(['CREATE','UPDATE'], Product, async(req) => {
        console.log(req.data);
        const cost_price = req.data. product_cost;
        const selling_price = req.data.product_sell;
        if(selling_price<cost_price){
            req.error({
                'code': 'SPLOW',
                message: 'Selling price cannot be less than Cost price',
                target: 'product_sell'
            });
        }
    });
    
    
    
    this.before(['CREATE','UPDATE'], Purchase, async(req) => {
        //is_vendor validation
        data = req.data 
        bpno=data.bpno_ID;
        let query1 = SELECT.from(Bussiness_Partner).where({ref:["ID"]}, "=", {val: bpno});
        result = await cds.run(query1);
        is_vendor = result[0].is_vendor;
        if(is_vendor === null){
            req.error({
                'code': 'NOTVENDOR',
                message:  'The business partner must be a Vendor',
                target: 'is_vendor'
            });
        }
        //Purchase Items validation
        Itemdata = req.data.Items
        if(Array.isArray(Itemdata)){
            Itemdata.map(async (each) => {
                product_id = each.product_id_ID;
                price = each.price;
                let query1 = SELECT.from(Product).where({ref:["ID"]}, "=", {val: product_id});
                result = await cds.run(query1);
                console.log(result)
                cost_price = result[0].product_cost
                if(price > cost_price){
                    req.error({
                        'code': 'pLOW',
                        message:  'Price cannot be greater than Cost price',
                        target: 'price'
                    });
                }
                //stock changes
                qty = each.qty;
                let query2 = SELECT.from(Stock).where({ref:["product_id_ID"]}, "=", {val: product_id});
                result2 = await cds.run(query2);
                //console.log(result)
                stock_qty = result2[0].stock_qty;
                console.log(stock_qty)
                console.log(qty)
                qty = stock_qty+qty;
                console.log(qty)
                await cds.run(UPDATE.entity(Stock).data({
                    'stock_qty':qty,
                }).where({ref:["product_id_ID"]}, "=", {val: product_id}));
                
    
            })
        }
    
    });
    this.before(['CREATE','UPDATE'], Sales, async(req) => {
        //is_vendor validation
        data = req.data 
        bpno=data.bpno_ID;
        let query1 = SELECT.from(Bussiness_Partner).where({ref:["ID"]}, "=", {val: bpno});
        result = await cds.run(query1);
        is_customer = result[0].is_customer;
        if(is_customer === null){
            req.error({
                'code': 'NOTCUSTOMER',
                message:  'The business partner must be a Customer',
                target: 'is_customer'
            });
        }
        //Purchase Items validation
        Itemdata = req.data.Items
        if(Array.isArray(Itemdata)){
            Itemdata.map(async (each) => {
                product_id = each.product_id_ID;
                price = each.price;
                let query1 = SELECT.from(Product).where({ref:["ID"]}, "=", {val: product_id});
                result = await cds.run(query1);
                console.log(result)
                sell_price = result[0].product_sell
                if(price < sell_price){
                    req.error({
                        'code': 'pLOW',
                        message:  'Price cannot be less than sell price',
                        target: 'price'
                    });
                }
                //stock changes
                qty = each.qty;
                let query2 = SELECT.from(Stock).where({ref:["product_id_ID"]}, "=", {val: product_id});
                result2 = await cds.run(query2);
                //console.log(result)
                stock_qty = result2[0].stock_qty;
                console.log(stock_qty)
                console.log(qty)
                qty = stock_qty-qty;
                console.log(qty)
                await cds.run(UPDATE.entity(Stock).data({
                    'stock_qty':qty,
                }).where({ref:["product_id_ID"]}, "=", {val: product_id}));
               
            })
        }
    
    });
    /*this.before('CREATE', Bussiness_Partner, async (req) => {
        console.log('Before-create hook triggered for Business Partner entity');

        // Check if this is the first entry
        const count = await cds.run(SELECT.one`COUNT(*) as count`.from(Bussiness_Partner));
        let nextBpno = 1;
        if (count && count.count > 0) {
            // Retrieve the maximum bpno and increment it by 1
            const maxBpno = await cds.run(SELECT.one`MAX(bpno) as maxBpno`.from(Bussiness_Partner));
            nextBpno = parseInt(maxBpno.maxBpno) + 1;
        }

        // Update bpno in the request data
        req.data.bpno = nextBpno;
    });*/
    this.before('UPDATE', Bussiness_Partner, async (req) => {
        console.log('Before-update hook triggered for Business Partner entity');

        // Check if bpno is being modified
        if (req.data.bpno !== undefined) {
            // Retrieve the existing bpno
            const existingRecord = await cds.tx(req).run(SELECT.one.from(Bussiness_Partner).where({ bpno: req.data.bpno }));
            // If there is an existing record with the same bpno, prevent modification
            if (existingRecord) {
                req.error({
                    'code': 'BPNO_MODIFICATION_NOT_ALLOWED',
                    'message': 'Modification of bpno is not allowed',
                    'target': 'bpno'
                });
            }
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
});   
    

    




    
    
    







    




    
    


   

    
    
    
    
    
    

