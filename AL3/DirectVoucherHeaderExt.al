tableextension 50120 "Direct Voucher Header Ext" extends "Direct Voucher Header"
{
    fields
    {
        field(50100; "Amount"; Decimal) {}
        field(50101; "Pay Mode"; Option) { OptionMembers = Bank, Cash, Cheque; }
        field(50102; "Amount (LCY)"; Decimal) {}
        field(50103; "Description"; Text[100]) {}
        field(50104; "Created DateTime"; DateTime) {}
    }
}