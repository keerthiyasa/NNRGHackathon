
using { com.satinfotech.marketdb as db } from '../db/schema';
service MarketDB{
    entity Bussiness_Partner as projection on db.Bussiness_Partner;
    entity Store as projection on db.Store;
    entity StoreID as projection on db.StoreID{
        @UI.Hidden: true
        ID,
        *
    };
    entity ProductID as projection on db.ProductID{
        @UI.Hidden: true
        ID,
        *
    };
    entity Product as projection on db.Product;
    entity Stock as projection on db.Stock;
    entity State as projection on db.State;
   entity Purchase as projection on db.Purchase
}
annotate MarketDB.Store with @odata.draft.enabled;
annotate MarketDB.Bussiness_Partner with @odata.draft.enabled;
annotate MarketDB.Product with @odata.draft.enabled;
annotate MarketDB.Stock with @odata.draft.enabled;
annotate MarketDB.Purchase with @odata.draft.enabled;
annotate MarketDB.StoreID with @odata.draft.enabled;
annotate MarketDB.ProductID with @odata.draft.enabled;
annotate MarketDB.Bussiness_Partner with {
  pin     @assert.format: '^\d{6}$';  
  gstn   @assert.format:'^\d{2}[A-Z]{5}\d{4}[A-Z]\d{1}[A-Z\d]{1}$'
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
            $Type:'UI.DataField',
            Label:'Store_ID',
            Value : store.description
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
);
annotate MarketDB.Store with @(       
    UI.FieldGroup #StoreInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
        {
            $Type : 'UI.DataField',
           
            Value : store_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : state,
        },
        {
            $Type : 'UI.DataField',
            Value : city,
        },
        {
            $Type : 'UI.DataField',
            Value : Address1,
        },
        {
            $Type : 'UI.DataField',
            Value : Address2,
        },
        {
            $Type : 'UI.DataField',
            Value : pin,
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
            Label:'Product_ID',
            Value : product.code
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
);
annotate MarketDB.Product with @(       
    UI.FieldGroup #ProductInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Value : product_ID,
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
annotate MarketDB.StoreID with @(
    UI.LineItem:[
        {
            Value: code
        },
        {
            Value: description
        }
        
        
    ],
     UI.FieldGroup #StoreIDInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                Value : code,
            },
            {
                Value : description,
            }
            
            
        ],
    },
    
    UI.Facets : [
        
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StoreIDInfoFacet',
            Label : 'StoreID Information',
            Target : '@UI.FieldGroup#StoreIDInformation',
        },
        
    ],
   

);
annotate MarketDB.Store with {
    store @(
        Common.Text: store.description,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'StoreID',
            CollectionPath : 'StoreID',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : store_ID,
                    ValueListProperty : 'ID'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
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
annotate MarketDB.ProductID with @(
    UI.LineItem:[
        {
            Value: code
        },
        {
            Value: description
        }
        
        
    ],
     UI.FieldGroup #ProductIDInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                Value : code,
            },
            {
                Value : description,
            }
            
            
        ],
    },
    
    UI.Facets : [
        
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ProductIDInfoFacet',
            Label : 'ProductID Information',
            Target : '@UI.FieldGroup#ProductIDInformation',
        },
        
    ],
   

);
annotate MarketDB.Product with {
    product @(
        Common.Text: product.description,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'ProductID',
            CollectionPath : 'ProductID',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_ID,
                    ValueListProperty : 'ID'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
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
annotate MarketDB.Stock with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Label:'Product_ID',
            Value : product.code
        },
        {
            $Type : 'UI.DataField',
            Label:'Store_ID',
            Value : store.code
        },
        {
            $Type : 'UI.DataField',
            Value : stock_qty
        }     
    ],  
);
annotate MarketDB.Stock with @(       
    UI.FieldGroup #StockInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Value : product_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : store_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : stock_qty,
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
annotate MarketDB.Stock with {
    product @(
        Common.Text: product.description,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'ProductID',
            CollectionPath : 'ProductID',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_ID,
                    ValueListProperty : 'ID'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
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
annotate MarketDB.Stock with {
    store @(
        Common.Text: store.description,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'StoreID',
            CollectionPath : 'StoreID',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : store_ID,
                    ValueListProperty : 'ID'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
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
