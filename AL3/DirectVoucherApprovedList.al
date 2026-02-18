page 50104 "Direct Voucher Approved List"
{
    PageType = List;
    SourceTable = "Direct Voucher Header";
    Caption = 'Approved Direct Vouchers';
    ApplicationArea = All;

    SourceTableView = WHERE(Status = FILTER(Approved));
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.") { }
                field("Posting Date"; Rec."Posting Date") { }
                field("Vendor No."; Rec."Vendor No.") { }
                field("Amount"; Rec."Amount") { }
                field("Status"; Rec."Status") { }
            }
        }
    }
}
