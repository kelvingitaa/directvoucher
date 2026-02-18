table 50101 "Direct Voucher Line"
{
    DataClassification = ToBeClassified;
    Caption = 'Direct Voucher Line';
            Editable = false;
        }

        field(7; "Account Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("G/L Account".Name where("No." = field("G/L Account No.")));
            Editable = false;
        }

        // Add missing fields
        field(8; "Account Type"; Option) { OptionMembers = "G/L Account",Vendor,Customer; }
        field(9; "Account No."; Code[20]) { }
        field(10; "Pay Mode"; Option) { OptionMembers = Bank,Cash,Cheque; }
        field(11; "Currency Code"; Code[10]) { }
        field(12; "Amount (LCY)"; Decimal) { }
    }

    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
        key("G/L Account No."; "G/L Account No.") { }
    }
}
