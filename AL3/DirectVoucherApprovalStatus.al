enum 50101 "Direct Voucher Approval Status"
{
    Extensible = true;
    Caption = 'Direct Voucher Approval Status';

    value(0; Open)
    {
        Caption = 'Open';
    }
    value(1; PendingApproval)
    {
        Caption = 'Pending Approval';
    }
    value(2; Approved)
    {
        Caption = 'Approved';
    }
    value(3; Posted)
    {
        Caption = 'Posted';
    }
}
