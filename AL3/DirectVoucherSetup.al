table 50102 "Direct Voucher Setup"
{
    DataClassification = ToBeClassified;
    Caption = 'Direct Voucher Setup';

    fields
    {
        // Add missing field
        field(10; "No. Series"; Code[20]) {}
        field(1; "Primary Key"; Integer)
        {
            DataClassification = SystemMetadata;
            AutoIncrement = true;
        }
        field(2; "Direct Voucher No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(3; "Approval Workflow Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
