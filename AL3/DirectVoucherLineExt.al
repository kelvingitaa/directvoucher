tableextension 50121 "Direct Voucher Line Ext" extends "Direct Voucher Line"
{
    fields
    {
        field(50100; "Account Type"; Option) { OptionMembers = "G/L Account", Vendor, Customer; }
        field(50101; "Account No."; Code[20]) {}
        field(50102; "Pay Mode"; Option) { OptionMembers = Bank, Cash, Cheque; }
        field(50103; "Currency Code"; Code[10]) {}
        field(50104; "Amount (LCY)"; Decimal) {}
    }
}