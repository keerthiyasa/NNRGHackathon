
using { com.satinfotech.marketdb as db } from '../db/schema';
service MarketDB{
    entity Bussiness_Partner as projection on db.Bussiness_Partner;
    entity Store as projection on db.Store;
    entity Stock as projection on db.Stock;
    entity Purchase as projection on db.Purchase;
    entity Unique_SID as projection on db.Unique_SID;
    entity Unique_PID as projection on db.Unique_PID;
    entity Unique_BPNUM as projection on db.Unique_BPNUM;
    //entity Unique_Price as projection on db.Unique_Price;
    entity Unique_Qty as projection on db.Unique_Qty;
    
    entity Product as projection on db.Product;
    
    entity State as projection on db.State;
   
}
annotate MarketDB.Store with @odata.draft.enabled;
annotate MarketDB.Unique_SID with @odata.draft.enabled;
annotate MarketDB.Unique_PID with @odata.draft.enabled;
annotate MarketDB.Unique_BPNUM with @odata.draft.enabled;
annotate MarketDB.Bussiness_Partner with @odata.draft.enabled;
annotate MarketDB.Product with @odata.draft.enabled;
annotate MarketDB.Purchase with @odata.draft.enabled;
annotate MarketDB.Stock with @odata.draft.enabled;
annotate MarketDB.Bussiness_Partner with {
  pin     @assert.format: '^\d{6}$';  
  gstn   @assert.format:'^\d{2}[A-Z]{5}\d{4}[A-Z]\d{1}[A-Z\d]{1}$';
}
annotate MarketDB.Product with {
    product_img   @assert.format: '^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$';

}
annotate MarketDB.Store with {
  pin     @assert.format: '^\d{6}$';  
  
}


annotate MarketDB.Bussiness_Partner with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : bpno.code
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
            Value : bpno_ID
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
            Label:'StoreID',
            Value : store_id.code
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
            
            Value : store_id_ID
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
            ID : 'StoreInfoFacet',
            Label : 'Store Information',
            Target : '@UI.FieldGroup#StoreInformation',
        },
        
        
        
    ],    
);
annotate MarketDB.Product with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Label:'ProductID',
            Value : product_id.code
        },
        {
            $Type : 'UI.DataField',
            Value : product_name
        },
        {
            Label:'State',
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
);
annotate MarketDB.Product with @(       
    UI.FieldGroup #ProductInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            
            Value : product_id_ID
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
annotate MarketDB.Stock with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Label:'StoreID',
            Value : store_id.code
        },
        {
            $Type : 'UI.DataField',
            
            Value : product_id_ID
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
            
            Value : store_id_ID
        },
        {
            $Type : 'UI.DataField',
            
            Value : product_id_ID
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
            ID : 'stockInfoFacet',
            Label : 'Stock Information',
            Target : '@UI.FieldGroup#StockInformation',
        },
        
        
        
    ],    
);
annotate MarketDB.Purchase with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : pono
        },
        {
            $Type : 'UI.DataField',
            Label:'Bussiness partner',
            Value : Unique_BPNUM.bpno.description
        },
        {
            $Type : 'UI.DataField',
            Value : pod
        },
        {
            $Type : 'UI.DataField',
            Label:'Product ID',
            Value : Unique_PID.product_id.description
        },
        {
            $Type : 'UI.DataField',
            Label:'Store ID',
            Value : Unique_SID.store_id.description
        },
        {
            $Type : 'UI.DataField',
            
            Value : price
        },
        {
            $Type : 'UI.DataField',
            Label:'Stock Qunatity',
            Value : Unique_Qty.stock_qty.description
        }
    ],  
);
annotate MarketDB.Purchase with @(       
    UI.FieldGroup #PurchaseInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Value : pono
        },
        {
            $Type : 'UI.DataField',
            Label:'Bussiness Partner',
            Value : Unique_BPNUM.bpno_ID
        },
        {
            $Type : 'UI.DataField',
            Value : pod
        },
        {
            $Type : 'UI.DataField',
            Label:'ProductID',
            Value : Unique_PID.product_id_ID
        },
        {
            $Type : 'UI.DataField',
            Label:'StoreID',
            Value : Unique_SID.store_id_ID
        },
        {
            $Type : 'UI.DataField',
            
            Value : price
        },
        {
            $Type : 'UI.DataField',
            Label:'Stock Quantity',
            Value : Unique_Qty.stock_qty_ID
        }
        
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PurchaseInfoFacet',
            Label : 'PurchaseInformation',
            Target : '@UI.FieldGroup#PurchaseInformation',
        },    
    ],    
);
annotate MarketDB.Purchase.Unique_SID with @(
    UI.LineItem:[
        {
            Label: 'StoreID',
            Value: store_id_ID
        },
       
    ],

     UI.FieldGroup #PurchaseSID : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                Value : store_id_ID,
            }
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PurchaseSIDFacet',
            Label : 'Unique_SID',
            Target : '@UI.FieldGroup#PurchaseSID',
        },
    ],  
);
annotate MarketDB.Purchase.Unique_BPNUM with @(
    UI.LineItem:[
        {
            Label: 'Bussiness Partner',
            Value: bpno_ID
        },
       
    ],

     UI.FieldGroup #PurchaseBPNUM : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                Value : bpno_ID,
            }
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PurchaseBPNUMFacet',
            Label : 'Unique_BPNUM',
            Target : '@UI.FieldGroup#PurchaseBPNUM',
        },
    ],  
);
/*annotate MarketDB.Purchase.Unique_Price with @(
    UI.LineItem:[
        {
            Label: 'Bussiness Partner',
            Value: price_ID
        },
       
    ],

     UI.FieldGroup #PurchasePrice : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                Value : price_ID,
            }
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PurchasePriceFacet',
            Label : 'Unique_Price',
            Target : '@UI.FieldGroup#PurchasePrice',
        },
    ],  
);*/
annotate MarketDB.Purchase.Unique_PID with @(
    UI.LineItem:[
        {
            Label: 'ProductID',
            Value: product_id_ID
        },
       
    ],

     UI.FieldGroup #PurchasePID : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                Value : product_id_ID,
            }
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PurchasePIDFacet',
            Label : 'Unique_PID',
            Target : '@UI.FieldGroup#PurchasePID',
        },
    ],  
);
annotate MarketDB.Purchase.Unique_Qty with @(
    UI.LineItem:[
        {
            Label: 'Stock Quntity',
            Value: stock_qty_ID
        },
       
    ],

     UI.FieldGroup #PurchaseQty : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                Value :stock_qty_ID,
            }
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PurchaseQtyFacet',
            Label : 'Unique_Qty',
            Target : '@UI.FieldGroup#PurchaseQty',
        },
    ],  
);
annotate MarketDB.Unique_SID with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            
            Value : code
        },
        {
            $Type : 'UI.DataField',
            
            Value : description
        }
    ],  
);

annotate MarketDB.Unique_SID with @(       
    UI.FieldGroup #Unique_SIDInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            
            Value : code
        },
        {
            $Type : 'UI.DataField',
            
            Value : description
        }
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Unique_SIDInfoFacet',
            Label : 'Unique_SID Information',
            Target : '@UI.FieldGroup#Unique_SIDInformation',
        },
        
        
        
    ],    
);
annotate MarketDB.Unique_Qty with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            
            Value : code
        },
        {
            $Type : 'UI.DataField',
            
            Value : description
        }
    ],  
);

annotate MarketDB.Unique_Qty with @(       
    UI.FieldGroup #Unique_QtyInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            
            Value : code
        },
        {
            $Type : 'UI.DataField',
            
            Value : description
        }
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Unique_QtyInfoFacet',
            Label : 'Unique_Qty Information',
            Target : '@UI.FieldGroup#Unique_QtyInformation',
        },
    
    ],    
);
annotate MarketDB.Unique_BPNUM with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            
            Value : code
        },
        {
            $Type : 'UI.DataField',
            
            Value : description
        }
    ],  
);
annotate MarketDB.Unique_BPNUM with @(       
    UI.FieldGroup #Unique_BPNUMInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            
            Value : code
        },
        {
            $Type : 'UI.DataField',
            
            Value : description
        }
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Unique_BPNUMInfoFacet',
            Label : 'Unique_BPNUM Information',
            Target : '@UI.FieldGroup#Unique_BPNUMInformation',
        },
        
        
        
    ],    
);
/*annotate MarketDB.Unique_Price with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            
            Value : code
        },
        {
            $Type : 'UI.DataField',
            
            Value : description
        }
    ],  
);
annotate MarketDB.Unique_Price with @(       
    UI.FieldGroup #Unique_PriceInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            
            Value : code
        },
        {
            $Type : 'UI.DataField',
            
            Value : description
        }
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Unique_PriceInfoFacet',
            Label : 'Unique_Price Information',
            Target : '@UI.FieldGroup#Unique_PriceInformation',
        },
        
        
        
    ],    
);*/
annotate MarketDB.Unique_PID with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            
            Value : code
        },
        {
            $Type : 'UI.DataField',
            
            Value : description
        }
    ],  
);
annotate MarketDB.Unique_PID with @(       
    UI.FieldGroup #Unique_PIDInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            
            Value : code
        },
        {
            $Type : 'UI.DataField',
            
            Value : description
        }
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Unique_PIDInfoFacet',
            Label : 'Unique_PID Information',
            Target : '@UI.FieldGroup#Unique_PIDInformation',
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
annotate MarketDB.Stock  with {
    store_id @(
        Common.Text: store_id.description,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Store ID',
            CollectionPath : 'Unique_SID',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : store_id_ID,
                    ValueListProperty : 'ID'
                },
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
    )
};
annotate MarketDB.Purchase.Unique_SID with {
    store_id @(
        Common.Text: store_id.description,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Store ID',
            CollectionPath : 'Unique_SID',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : store_id_ID,
                    ValueListProperty : 'ID'
                },
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
    )
};
annotate MarketDB.Purchase.Unique_BPNUM with {
    bpno @(
        Common.Text: bpno.description,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Bussiness Partner',
            CollectionPath : 'Unique_BPNUM',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : bpno_ID,
                    ValueListProperty : 'ID'
                },
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
    )
};
/*annotate MarketDB.Purchase.Unique_Price with {
    price @(
        Common.Text: price.description,
        Common.TextArrangement: #TextOnly,
        //Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Product Price',
            CollectionPath : 'Unique_Price',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : price_ID,
                    ValueListProperty : 'ID'
                },
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
    )
};*/
annotate MarketDB.Purchase.Unique_PID with {
    product_id @(
        Common.Text: product_id.description,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Product ID',
            CollectionPath : 'Unique_PID',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_id_ID,
                    ValueListProperty : 'ID'
                },
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
    )
};
annotate MarketDB.Purchase.Unique_Qty with {
    stock_qty @(
        Common.Text: stock_qty.description,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Stock Quantity',
            CollectionPath : 'Unique_Qty',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : stock_qty_ID,
                    ValueListProperty : 'ID'
                },
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
    )
};
annotate MarketDB.Stock  with {
    product_id @(
        Common.Text: product_id.description,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Product ID',
            CollectionPath : 'Unique_PID',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_id_ID,
                    ValueListProperty : 'ID'
                },
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
    )
};
annotate MarketDB.Product with {
    product_id @(
        Common.Text: product_id.description,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Product ID',
            CollectionPath : 'Unique_PID',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_id_ID,
                    ValueListProperty : 'ID'
                },
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
    )
};
annotate MarketDB.Store  with {
    store_id @(
        Common.Text: store_id.description,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Store ID',
            CollectionPath : 'Unique_SID',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : store_id_ID,
                    ValueListProperty : 'ID'
                },
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
    )
};
annotate MarketDB.Bussiness_Partner  with {
    bpno @(
        Common.Text: bpno.description,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Bussiness Partner ',
            CollectionPath : 'Unique_BPNUM',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : bpno_ID,
                    ValueListProperty : 'ID'
                },
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
    )
};
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




