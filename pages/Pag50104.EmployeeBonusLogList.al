page 50104 "MM Employee Bonus Log List"
{
    ApplicationArea = All;
    Caption = 'Employee Bonus Log List';
    PageType = List;
    SourceTable = "MM Employee Bonus Log";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ToolTip = 'Specifies the value of the Employee No. field.', Comment = '%';
                }
                field("Maintenance Entry No."; Rec."Maintenance Entry No.")
                {
                    ToolTip = 'Specifies the value of the Maintenance Entry No. field.', Comment = '%';
                }
                field("Bonus Amount"; Rec."Bonus Amount")
                {
                    ToolTip = 'Specifies the value of the Bonus Amount field.', Comment = '%';
                }
                field("Bonus Reason"; Rec."Bonus Reason")
                {
                    ToolTip = 'Specifies the value of the Bonus Reason (Maintenance Type / Extra 10%) field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("Created At"; Rec."Created At")
                {
                    ToolTip = 'Specifies the value of the Created At field.', Comment = '%';
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.', Comment = '%';
                }
            }
        }
    }
}
