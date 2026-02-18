
table 50201 "Direct Voucher Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            TableRelation = "Direct Voucher Header"."No.";
            DataClassification = CustomerContent;
        }

        field(2; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
        }

        field(3; Description; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(4; "G/L Account No."; Code[20])
        {
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;
            
            trigger OnValidate()
            var
                GLAccount: Record "G/L Account";
            begin
                if GLAccount.Get("G/L Account No.") then
                    Description := CopyStr(GLAccount.Name, 1, MaxStrLen(Description));
            end;
        }

        field(5; Amount; Decimal)
        {
            DataClassification = CustomerContent;
        }

        field(6; "Amount LCY"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        
        field(7; "Account Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("G/L Account".Name where("No." = field("G/L Account No.")));
            Editable = false;
        }
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