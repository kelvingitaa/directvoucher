tableextension 50103 "DirectVoucherUserSetupExt" extends "User Setup"
{
    fields
    {
        field(50100; "Direct Voucher Approver"; Boolean)
        {
            Caption = 'Direct Voucher Approver';
            DataClassification = CustomerContent;
        }
    }
}
