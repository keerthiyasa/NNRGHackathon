namespace com.satinfotech.marketdb;
using {managed, cuid } from '@sap/cds/common';

@assert.unique:{
    bpno:[bpno]
}
entity Bussiness_Partner: cuid ,managed {
    key cuid:UUID;
    @title:'Bussiness Partner Number' 
    bpno: String(5) @mandatory;
    @title:'City'
    city:String(10) @mandatory;
    @title:'Name'
    name: String(40) @mandatory;
    @title:'State'
    state: String(10);
    @title:'Address1'
    Address1:String(40) @mandatory;
    @title:'Address2'
    Address2:String(40);
    @title:'PIN Code'
    pin :String(40) @mandatory;
    @title:'GSTIN Number'
    gstn:String(15);
    @title:'Is gstn Registered'
    is_gstn_registered: Boolean default false;
    @title:'Is Vendor'
    is_vendor: Boolean default false;
    @title:'Is Customer'
    is_customer: Boolean default false;
}

@cds.persistence.skip
entity State {
    @title: 'Code'
    code: String(3);
    @title: 'Description'
    description: String(50);
    
}
entity Store : cuid, managed {
    @title: 'Store ID'
    store_ID: String(20) @mandatory;
    @title: 'Name'
    name: String(20) @mandatory;
    @title: 'Address1'  
    Address1:String(40)  @mandatory;
    @title: 'Adress2'
    Address2:String(30)   @mandatory;
    @title:'City'
    city:String(40)   @mandatory;
    @title: 'State'
    state:String(10);
    @title: 'PIN Code.'
    pin: String(20)    @mandatory;
}


entity Product : cuid, managed {
    @title: 'Product ID'
    product_ID: String(20) @mandatory;
    @title: 'Product Name'
    product_name: String(20) @mandatory;
    @title: 'Product Image URL'
    product_img: String(20) @mandatory;
    @title: 'Product Cost Price'
    product_cost: String(20) @mandatory;
    @title: 'Product Sell Price'
    product_sell: String(20) @mandatory;
}


entity Stock : cuid,managed{
    @title:'ID'
    key ID : UUID;
    @title:'StoreID'
    store_ID: Association to Store;
    @title:'ProductID'
    product_ID : Association to Product;
    @title:'StockQuality'
    stock_qty : Integer;
}
entity Purchase : cuid,managed{
    @title:'ID'
    key ID : UUID;
    @title:'Purchase Order Number'
    pono: Integer;
    @title:'Bussiness_Partner'
    bpno : Association to Bussiness_Partner;
    @title:'Purchase Order Date'
    pod : Date;
    @title:'Product_ID'
    Product_ID: Composition of many {
       key ID: UUID;
       product_ID: Association to Product;
     }
     @title:'Stock_qty'
    Stock_qty: Composition of many {
       key ID: UUID;
       stpck_qty: Association to Stock;
     }
     @title:'Product_cost'
     Product_cost: Composition of many {
       key ID: UUID;
       product_cost: Association to Product;
     }
     @title:'Store_ID'
     Store_ID: Composition of many {
       key ID: UUID;
       store_ID: Association to Store;
     }

}
