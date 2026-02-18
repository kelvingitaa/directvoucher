report 50210 "Direct Voucher Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/DirectVoucherReport.rdl';

    dataset
    {
        dataitem("Direct Voucher Header"; "Direct Voucher Header")
        {
            column(No_; "No.") { }
            column(PostingDate; "Posting Date") { }
            column(DocumentDate; "Document Date") { }
            column(VendorName; "Vendor Name") { }
            column(TotalAmount; "Total Amount") { }
        }
    }
}
