table 50104 "Direct Voucher Approval Entry"
{
    DataClassification = ToBeClassified;
    Caption = 'Direct Voucher Approval Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = SystemMetadata;
            AutoIncrement = true;
        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Direct Voucher Header"."No.";
        }
        field(3; "Approver User ID"; Code[50])
        {
            DataClassification = SystemMetadata;
        }
        field(4; "Approval DateTime"; DateTime)
        {
            DataClassification = SystemMetadata;
        }
        field(5; "Approval Status"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Open,Approved,Rejected;
        }
        field(6; "Level"; Integer)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
