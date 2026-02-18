table 50200 "Direct Voucher Header"
{
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(2; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(3; "Document Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(4; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;
            DataClassification = CustomerContent;
        }

        field(5; "Vendor Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = field("Vendor No.")));
            Editable = false;
        }

        field(6; "Currency Code"; Code[10])
        {
            TableRelation = Currency;
            DataClassification = CustomerContent;
        }

        field(7; "Payment Method Code"; Code[10])
        {
            TableRelation = "Payment Method";
            DataClassification = CustomerContent;
        }

        field(8; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Posted;
            DataClassification = CustomerContent;
        }

        field(9; "Created By"; Code[50])
        {
            DataClassification = EndUserIdentifiableInformation;
        }

        field(10; "Created Date Time"; DateTime)
        {
            DataClassification = SystemMetadata;
        }
        
        field(11; "Total Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Direct Voucher Line".Amount where("Document No." = field("No.")));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key("Posting Date"; "Posting Date") { }
        key("Vendor No."; "Vendor No.") { }
        key(Status; Status) { }
    }

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Created Date Time" := CurrentDateTime;
        Status := Status::Open;
    end;
}
