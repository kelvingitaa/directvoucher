page 50105 "Direct Voucher Posted List"
{
    PageType = List;
    SourceTable = "Direct Voucher Header";
    Caption = 'Posted Direct Vouchers';
    ApplicationArea = All;

    SourceTableView = WHERE(Status = FILTER(Posted));
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
