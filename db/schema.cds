namespace com.satinfotech.marketdb;
using { managed, cuid } from '@sap/cds/common';

@assert.unique:{
    bpno:[bpno]
}
entity Bussiness_Partner: cuid ,managed {
    
    @title:'Bussiness Partner Number'
    bpno:String(10) @mandatory;
    @title:'City'
    city:String(10) @mandatory;
    @title:'Name'
    name: String(40) @mandatory;
    @title:'State'
    state: Association to State;
    @title:'Address1'
    Address1:String(40) @mandatory;
    @title:'Address2'
    Address2:String(40);
    @title:'PIN Code'
    pin :String(40) @mandatory;
    @title:'GSTIN Number'
    gstn:String(10);
    @title:'Is gstn Registered'
    is_gstn_registered: Boolean default false;
    @title:'Is Vendor'
    is_vendor: Boolean default false;
    @title:'Is Customer'
    is_customer: Boolean default false;
}

entity State : cuid, managed {
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
    state:Association to State;
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
entity Stock {
    @title:'ID'
    key ID : UUID;
    @title:'StoreID'
    store_ID: Association to Store;
    @title:'ProductID'
    product_ID : Association to Product;
    @title:'StockQuality'
    stock_qty : Integer;
}