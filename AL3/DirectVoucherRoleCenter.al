page 50110 "Direct Voucher Role Center"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    Caption = 'Direct Voucher Role Center';

    layout
    {
        area(rolecenter)
        {
            group(Setup)
            {
                // Setup content here if needed
            }
            group(Lists)
            {
                // Lists content here if needed
            }
            group(Tasks)
            {
                // Tasks content here if needed
            }
            group(Reports)
            {
                // Reports content here if needed
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Direct Voucher Setup")
            {
                RunObject = Page 50102;
                ApplicationArea = All;
            }
            action("Direct Voucher List")
            {
                RunObject = Page 50100;
                ApplicationArea = All;
            }
            action("Unapproved Vouchers")
            {
                RunObject = Page 50104;
                ApplicationArea = All;
            }
            action("Approved Vouchers")
            {
                RunObject = Page 50105;
                ApplicationArea = All;
            }
            // action("Posted Vouchers")
            // {
            //     RunObject = Page 50106;
            //     ApplicationArea = All;
            // }
            action("Batch Posting")
            {
                RunObject = Page 50107;
                ApplicationArea = All;
            }
        }
        area(reporting)
        {
            action("Direct Voucher Printout")
            {
                RunObject = Report 50100;
                ApplicationArea = All;
            }
            action("Cheque Print")
            {
                RunObject = Report 50101;
                ApplicationArea = All;
            }
        }
    }
}
// File cleared to remove any hidden or invalid characters.
