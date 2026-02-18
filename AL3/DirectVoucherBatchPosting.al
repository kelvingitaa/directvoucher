page 50107 "Direct Voucher Batch Posting"
{
    PageType = List;
    SourceTable = "Direct Voucher Header";
    Caption = 'Direct Voucher Batch Posting';
    ApplicationArea = All;

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
                field("Pay Mode"; Rec."Pay Mode") { }
                field("Status"; Rec."Status") { }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(BatchPost)
            {
                Caption = 'Batch Post';
                ApplicationArea = All;
                trigger OnAction()
                var
                    Posting: Codeunit "Direct Voucher Posting";
                    VoucherHeader: Record "Direct Voucher Header";
                begin
                    Rec.SetRange(Status, Rec.Status::Approved);
                    if Rec.FindSet() then begin
                        repeat
                            Posting.PostVoucher(Rec);
                        until Rec.Next() = 0;
                    end;
                    Message('Batch posting completed.');
                end;
            }
            action(PrintCheques)
            {
                Caption = 'Print Cheques';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    // Cheque print logic here
                end;
            }
        }
    }
}
