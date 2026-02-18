codeunit 50101 "DirectVoucherApprovalWf"
{

    procedure RequestApproval(var VoucherHeader: Record "Direct Voucher Header")
    var
        ApprovalEntry: Record "Direct Voucher Approval Entry";
        UserSetup: Record "User Setup";
        Level: Integer;
    begin
        // Only allow if status is Open
        if VoucherHeader.Status <> VoucherHeader.Status::Open then
            Error('Approval can only be requested for Open vouchers.');
        // Create approval entries for 2 approvers
        Level := 1;
        UserSetup.Reset();
        UserSetup.SetRange("Direct Voucher Approver", true);
        if UserSetup.FindSet() then begin
            repeat
                ApprovalEntry.Init();
                ApprovalEntry."Document No." := VoucherHeader."No.";
                ApprovalEntry."Approver User ID" := UserSetup."User ID";
                ApprovalEntry."Approval Status" := ApprovalEntry."Approval Status"::Open;
                ApprovalEntry."Level" := Level;
                ApprovalEntry.Insert();
                Level += 1;
                if Level > 2 then
                    break;
            until UserSetup.Next() = 0;
        end else
            Error('No approvers set up.');
        // Set to Approved directly since PendingApproval is not available
        VoucherHeader.Status := VoucherHeader.Status::Approved;
        VoucherHeader.Modify();
    end;

    procedure ApproveVoucher(var VoucherHeader: Record "Direct Voucher Header"; ApproverUserID: Code[50])
    var
        ApprovalEntry: Record "Direct Voucher Approval Entry";
        ApprovedCount: Integer;
    begin
        ApprovalEntry.SetRange("Document No.", VoucherHeader."No.");
        ApprovalEntry.SetRange("Approver User ID", ApproverUserID);
        ApprovalEntry.SetRange("Approval Status", ApprovalEntry."Approval Status"::Open);
        if ApprovalEntry.FindFirst() then begin
            ApprovalEntry."Approval Status" := ApprovalEntry."Approval Status"::Approved;
            ApprovalEntry."Approval DateTime" := CurrentDateTime;
            ApprovalEntry.Modify();
        end else
            Error('No open approval entry for this user.');
        // Check if all approvals are done
        ApprovalEntry.Reset();
        ApprovalEntry.SetRange("Document No.", VoucherHeader."No.");
        ApprovalEntry.SetRange("Approval Status", ApprovalEntry."Approval Status"::Approved);
        ApprovedCount := ApprovalEntry.Count;
        if ApprovedCount >= 2 then begin
            VoucherHeader.Status := VoucherHeader.Status::Approved;
            VoucherHeader.Modify();
        end;
    end;
}
