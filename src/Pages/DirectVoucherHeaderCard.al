page 50201 "Direct Voucher Header Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Direct Voucher Header";
    Caption = 'Direct Voucher';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }

                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }

                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }

                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                }

                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                }

                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = All;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Created Date Time"; Rec."Created Date Time")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }

            part(Lines; "Direct Voucher Line Subpage")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Release)
            {
                ApplicationArea = All;
                Caption = 'Release';
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Open then
                        Error('Only open vouchers can be released.');

                    Rec.Status := Rec.Status::"Pending Approval";
                    Rec.Modify();
                end;
            }

            action(Approve)
            {
                ApplicationArea = All;
                Caption = 'Approve';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::"Pending Approval" then
                        Error('Voucher must be pending approval.');

                    Rec.Status := Rec.Status::Approved;
                    Rec.Modify();
                end;
            }

            action(PostVoucher)
            {
                ApplicationArea = All;
                Caption = 'Post Voucher';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Approved then
                        Error('Voucher must be approved before posting.');

                    Rec.Status := Rec.Status::Posted;
                    Rec.Modify();
                end;
            }

            action(PrintVoucher)
            {
                ApplicationArea = All;
                Caption = 'Print Voucher';
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                var
                    VoucherReport: Report "Direct Voucher Report";
                begin
                    VoucherReport.SetTableView(Rec);
                    VoucherReport.RunModal();
                end;
            }

            action(PrintCheque)
            {
                ApplicationArea = All;
                Caption = 'Print Cheque';
                Image = Check;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                var
                    VoucherReport: Report "Direct Voucher Report";
                begin
                    if Rec."Payment Method Code" <> 'CHECK' then
                        Error('Cheque can only be printed for cheque payments.');

                    VoucherReport.SetTableView(Rec);
                    VoucherReport.RunModal();
                end;
            }
        }

        area(Navigation)
        {
            action(OpenVendor)
            {
                ApplicationArea = All;
                Caption = 'Vendor';
                Image = Vendor;

                trigger OnAction()
                var
                    VendorRec: Record Vendor;
                begin
                    if VendorRec.Get(Rec."Vendor No.") then
                        Page.Run(Page::"Vendor Card", VendorRec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Posting Date" := WorkDate();
        Rec."Document Date" := WorkDate();
    end;
}
