
using { com.satinfotech.marketdb as db } from '../db/schema';
service MarketDB{
    entity Bussiness_Partner as projection on db.Bussiness_Partner;
    entity Store as projection on db.Store;
    entity Product as projection on db.Product;
    entity Stock as projection on db.Stock;
    entity State as projection on db.State
   
}
service TransactionDB{
    entity Stock as projection on db.Stock;
    entity Purchase as projection on db.Purchase;
    
}


annotate MarketDB.Store with @odata.draft.enabled;
annotate MarketDB.Bussiness_Partner with @odata.draft.enabled;

annotate MarketDB.Product with @odata.draft.enabled;
annotate TransactionDB.Stock with @odata.draft.enabled;
annotate TransactionDB.Purchase with @odata.draft.enabled;
annotate MarketDB.Bussiness_Partner with {
  pin     @assert.format: '^\d{6}$';  
    
}
annotate MarketDB.Product with {
    product_img   @assert.formart: '^(https?|ftp):\/\/(?:www\.)?[a-zA-Z0-9-]+(?:\.[a-zA-Z]{2,})+(?:\/[\w-./?%&=]*)?$';
}


annotate MarketDB.Bussiness_Partner with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : bpno
        },
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            Label:'State',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : Address1
        },
        {
            $Type : 'UI.DataField',
            Value : Address2
        },
        {
            $Type : 'UI.DataField',
            Value : pin
        },
        {
            $Type : 'UI.DataField',
            Value : gstn
        },
        {
            Value : is_gstn_registered
        },
        {
            Value : is_vendor
        }, 
        {
            Value : is_customer
        }    
    ],  
    //UI.SelectionFields: [ first_name , last_name, email_id,telephone,dob,age,gender ],
);
annotate MarketDB.Bussiness_Partner with @(       
    UI.FieldGroup #MarketInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Value : bpno
        },
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : Address1
        },
        {
            $Type : 'UI.DataField',
            Value : Address2
        },
        {
            $Type : 'UI.DataField',
            Value : pin
        },
        {
            $Type : 'UI.DataField',
            Value : gstn
        },
        {
            Value : is_gstn_registered
        },
        {
            Value : is_vendor
        }, 
        {
            Value : is_customer
        }  
              
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'MarketInfoFacet',
            Label : 'Market Information',
            Target : '@UI.FieldGroup#MarketInformation',
        },
        
        
    ],    
);
annotate MarketDB.Store with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : store_ID
        },
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            Label:'State',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : Address1
        },
        {
            $Type : 'UI.DataField',
            Value : Address2
        },
        {
            $Type : 'UI.DataField',
            Value : pin
        }
         
    ],  
    //UI.SelectionFields: [ first_name , last_name, email_id,telephone,dob,age,gender ],
);
annotate MarketDB.Store with @(       
    UI.FieldGroup #StoreInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Value : store_ID
        },
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : Address1
        },
        {
            $Type : 'UI.DataField',
            Value : Address2
        },
        {
            $Type : 'UI.DataField',
            Value : pin
        }
        
            
                      
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'storeInfoFacet',
            Label : 'store Information',
            Target : '@UI.FieldGroup#StoreInformation',
        },
        
        
    ],    
);
annotate MarketDB.Product with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : product_ID
        },
        {
            $Type : 'UI.DataField',
            Value : product_name
        },
        
        {
            $Type : 'UI.DataField',
            Value : product_img
        },
        {
            $Type : 'UI.DataField',
            Value : product_cost
        },
        {
            $Type : 'UI.DataField',
            Value : product_sell
        },
        
         
    ],  
    //UI.SelectionFields: [ first_name , last_name, email_id,telephone,dob,age,gender ],
);
annotate MarketDB.Product with @(       
    UI.FieldGroup #ProductInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Value : product_ID
        },
        {
            $Type : 'UI.DataField',
            Value : product_name
        },
        {
            $Type : 'UI.DataField',
            Value : product_img
        },
        {
            $Type : 'UI.DataField',
            Value : product_cost
        },
        {
            $Type : 'UI.DataField',
            Value : product_sell
        }
            
                      
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ProductInfoFacet',
            Label : 'Product Information',
            Target : '@UI.FieldGroup#ProductInformation',
        },
        
        
    ],    
);

annotate MarketDB.State with @(
    UI.LineItem: [
       {
            $Type : 'UI.DataField',
            Value : code
        },
        {
            $Type : 'UI.DataField',
            Value : description
        },  
    ],
);
annotate MarketDB.Bussiness_Partner with {
    state @(     
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
           Label: 'States',
            CollectionPath : 'State',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : state,
                    ValueListProperty : 'code'
                },
             
                {

                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                }
            ]
        }
    )
};



annotate MarketDB.Store with {
    state @(     
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
           Label: 'State',
            CollectionPath : 'State',
            Parameters     : [
                  
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'code'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                },
            ]
        }
    );
}
annotate TransactionDB.Stock with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : ID
        },
        {
            $Type : 'UI.DataField',
            Value :  store_ID
        },
        
        {
            $Type : 'UI.DataField',
            Value : product_ID
        },
        {
            $Type : 'UI.DataField',
            Value : stock_qty
        }
        
         
    ],  
    //UI.SelectionFields: [ first_name , last_name, email_id,telephone,dob,age,gender ],
);
annotate TransactionDB.Stock with @(       
    UI.FieldGroup #StockInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Value : ID
        },
        {
            $Type : 'UI.DataField',
            Value : product_ID.ID
        },
        {
            $Type : 'UI.DataField',
            Value : store_ID.ID
        },
        {
            $Type : 'UI.DataField',
            Value : stock_qty
        }
            
                      
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StockInfoFacet',
            Label : 'Stock Information',
            Target : '@UI.FieldGroup#StockInformation',
        },
        
        
    ],    
);
annotate TransactionDB.Purchase @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : pono
        },
        {
            $Type : 'UI.DataField',
            Value : bpno
        },
        
        {
            $Type : 'UI.DataField',
            Value : pod
        },
        {
            $Type : 'UI.DataField',
            Value : product_ID
        },
        {
            $Type : 'UI.DataField',
            Value : stock_qty
        },
        {
            $Type : 'UI.DataField',
            Value : product_cost
        },
        {
            $Type : 'UI.DataField',
            Value : store_ID
        }
        
         
    ],  
    //UI.SelectionFields: [ first_name , last_name, email_id,telephone,dob,age,gender ],
);
annotate MarketDB.Product with @(       
    UI.FieldGroup #PurchaseInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Value : pono,
        },
        {
            $Type : 'UI.DataField',
            Value : bpno,
        },
        
        {
            $Type : 'UI.DataField',
            Value : pod,
        },
        {
            $Type : 'UI.DataField',
            Value : product_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : stock_qty,
        },
        {
            $Type : 'UI.DataField',
            Value : product_cost,
        },
        {
            $Type : 'UI.DataField',
            Value : store_ID,
        }
            
            
                      
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PurchaseInfoFacet',
            Label : 'Purchase Information',
            Target : '@UI.FieldGroup#PurchaseInformation',
        },
        
        
    ],    
);
