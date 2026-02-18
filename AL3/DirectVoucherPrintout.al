report 50100 "Direct Voucher Printout"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Direct Voucher Printout';
    DefaultLayout = RDLC;
    RDLCLayout = './DirectVoucherPrintout.rdlc'; // Ensure this file exists in your root folder

    dataset
    {
        // HEADER DATAITEM
        dataitem(Header; "Direct Voucher Header")
        {
            column(No; "No.") { }
            column(PostingDate; "Posting Date") { }
            column(VendorNo; "Vendor No.") { }
            column(DescriptionHeader; "Description") { }

            // LINE DATAITEM (Must be nested INSIDE the Header braces)
            dataitem(Line; "Direct Voucher Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.");

                column(LineNo; "Line No.") { }
                column(AccountType; "Account Type") { }
                column(AccountNo; "Account No.") { }
                column(Amount; "Amount") { }
                column(DescriptionLine; "Description") { }
            }
        }
    }
}