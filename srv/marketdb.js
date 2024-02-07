
const cds=require('@sap/cds')
module.exports = cds.service.impl(async function () {
    const { Business_Partner } = this.entities;
    this.on("READ", Business_Partner, async (req) => {
        const results = await cds.run(req.query);
        return results;
      });
    this.before("CREATE",  Business_Partner, async (req) => {
        const { bpno, is_gstn_registered, gstn } = req.data;
        if (is_gstn_registered && !gstn) {
            req.error({
                code: "MISSING_GST_NUM",
                message: "GSTIN number is mandatory when Is_gstn_registered is true",
                target: "gstn",
            });
        }
    });
});