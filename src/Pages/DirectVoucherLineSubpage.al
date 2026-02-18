page 50202 "Direct Voucher Line Subpage"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Direct Voucher Line";
    Caption = 'Lines';

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the line number.';
                    Visible = false;
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the G/L account number.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the G/L account name.';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the line.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount for this line.';
                }
                field("Amount LCY"; Rec."Amount LCY")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount in local currency.';
                    Editable = false;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        DirectVoucherLine: Record "Direct Voucher Line";
    begin
        if xRec."Document No." <> '' then begin
            DirectVoucherLine.SetRange("Document No.", xRec."Document No.");
            if DirectVoucherLine.FindLast() then
                Rec."Line No." := DirectVoucherLine."Line No." + 10000
            else
                Rec."Line No." := 10000;
        end;
    end;
}