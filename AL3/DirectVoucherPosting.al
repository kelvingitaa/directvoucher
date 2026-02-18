codeunit 50102 "Direct Voucher Posting"
{

    procedure PostVoucher(var VoucherHeader: Record "Direct Voucher Header")
    var
        VoucherLine: Record "Direct Voucher Line";
    begin
        if VoucherHeader.Status <> VoucherHeader.Status::Approved then
            Error('Only approved vouchers can be posted.');
        // Posting logic placeholder: create G/L entries, vendor ledger entries, etc.
        // For now, just mark as posted
        VoucherHeader.Status := VoucherHeader.Status::Posted;
        VoucherHeader.Modify();
    end;
}
