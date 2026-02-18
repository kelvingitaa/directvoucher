page 50102 "Direct Voucher Setup Card"
{
    PageType = Card;
    SourceTable = "Direct Voucher Setup";
    Caption = 'Direct Voucher Setup';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No. Series"; Rec."No. Series") { }
                field("Approval Workflow Code"; Rec."Approval Workflow Code") { }
            }
        }
    }
}
