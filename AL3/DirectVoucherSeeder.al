codeunit 50110 "Direct Voucher Seeder"
{
    Subtype = Normal;
    trigger OnRun()
    var
        Header: Record "Direct Voucher Header";
        Line: Record "Direct Voucher Line";
        Setup: Record "Direct Voucher Setup";
        i: Integer;
    begin
        // Setup No. Series if not present
        if not Setup.FindFirst() then begin
            Setup.Init();
            Setup."Direct Voucher No. Series" := 'DVCHSERIES';
            Setup.Insert();
        end;
        // Insert sample headers
        for i := 1 to 3 do begin
            Header.Init();
            Header."No." := 'DVCH' + Format(i);
            Header."Posting Date" := Today();
            Header."Document Date" := Today();
            Header."Vendor No." := '10000';
            Header."Currency Code" := 'USD';
            Header."Pay Mode" := Header."Pay Mode"::Bank;
            Header."Amount" := 1000 * i;
            Header."Amount (LCY)" := 1000 * i * 150;
            Header."Status" := Header."Status"::Open;
            Header."Created By" := UserId();
            Header."Created DateTime" := CurrentDateTime();
            Header."Description" := 'Sample Voucher ' + Format(i);
            Header.Insert(true);
            // Insert lines
            Line.Init();
            Line."Document No." := Header."No.";
            Line."Line No." := 10000;
            Line."Account Type" := Line."Account Type"::"G/L Account";
            Line."Account No." := '6110';
            Line."Description" := 'Service Payment';
            Line."Amount" := 1000 * i;
            Line."Amount (LCY)" := 1000 * i * 150;
            Line."Currency Code" := 'USD';
            Line."Pay Mode" := Line."Pay Mode"::Bank;
            Line.Insert(true);
        end;
    end;
}
