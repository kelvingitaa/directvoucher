page 50101 "Direct Voucher Card"
{
    PageType = Document;
    SourceTable = "Direct Voucher Header";
    Caption = 'Direct Voucher';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
                group(General)
                {
                    field("No."; Rec."No.") { ApplicationArea = All; }
                    field("Posting Date"; Rec."Posting Date") { ApplicationArea = All; }
                    field("Document Date"; Rec."Document Date") { ApplicationArea = All; }
                    field("Vendor No."; Rec."Vendor No.") { ApplicationArea = All; }
                    field("Vendor Name"; Rec."Vendor Name") { ApplicationArea = All; Editable = false; }
                    field("Currency Code"; Rec."Currency Code") { ApplicationArea = All; }
                    field("Payment Method Code"; Rec."Payment Method Code") { ApplicationArea = All; }
                    field(Status; Rec.Status) { ApplicationArea = All; Editable = false; }
                    field("Created By"; Rec."Created By") { ApplicationArea = All; Editable = false; }
                    field("Created Date Time"; Rec."Created Date Time") { ApplicationArea = All; Editable = false; }
                    field("Total Amount"; Rec."Total Amount") { ApplicationArea = All; Editable = false; }
                }
            }
        }

    // ...existing code...
}
