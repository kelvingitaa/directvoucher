report 50101 "Direct Voucher Cheque Print"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Direct Voucher Cheque Print';
    ProcessingOnly = false;
    DefaultLayout = RDLC;
    RDLCLayout = 'DirectVoucherChequePrint.rdlc'; // Placeholder, create layout file as needed

    dataset
    {
        dataitem("Direct Voucher Header"; "Direct Voucher Header")
        {
            column(No; "No.") { }
            column(VendorNo; "Vendor No.") { }
            column(CurrencyCode; "Currency Code") { }
            column(PayMode; "Pay Mode") { }
            column(Status; "Status") { }
        }
    }
}
