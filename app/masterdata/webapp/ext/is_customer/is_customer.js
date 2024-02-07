sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        SetVendor: function(oBindingContext,aSelectedContexts) {       
             aSelectedContexts.forEach(element => {
                //MessageToast.show(element.sPath);
                var aData = jQuery.ajax({
                    type: "PATCH",
                    contentType: "application/json",
                    url: "/odata/v4/market-db"+element.sPath,
                    data: JSON.stringify({is_vendor:true})
                }).then(element.requestRefresh());
            });
        },
    }
}
)

