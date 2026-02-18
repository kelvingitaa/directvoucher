page 50200 "Direct Voucher Header List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Direct Voucher Header";
    Caption = 'Direct Vouchers';
    CardPageId = 50201;

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
            action(NewVoucher)
            {
                Caption = 'New Direct Voucher';
                Image = New;
                Promoted = true;
                PromotedCategory = New;
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    Page.Run(Page::"Direct Voucher Header Card");
                end;
            }
        }
    }
}