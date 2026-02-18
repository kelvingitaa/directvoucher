page 50100 "Direct Voucher List"
{
    PageType = List;
    SourceTable = "Direct Voucher Header";
    Caption = 'Direct Voucher List';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(NoField; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                }
                field(PostingDateField; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    Caption = 'Posting Date';
                }
                field(VendorNoField; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor No.';
                }
                field(VendorNameField; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Name';
                    Editable = false;
                }
                field(StatusField; Rec.Status)
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                }
                field(TotalAmountField; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Total Amount';
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("Open Card")
            {
                ApplicationArea = All;
                RunObject = page "Direct Voucher Card";
                RunPageLink = "No." = field("No.");
            }
        }
    }
}
