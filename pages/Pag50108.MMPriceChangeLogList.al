page 50108 "MM Price Change Log List"
{
    ApplicationArea = All;
    Caption = 'MM Price Change Log List';
    PageType = List;
    SourceTable = "MM Price Change Log";
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
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("New Unit Price"; Rec."New Unit Price")
                {
                    ToolTip = 'Specifies the value of the New Unit Price field.', Comment = '%';
                }
                field("Old Unit Price"; Rec."Old Unit Price")
                {
                    ToolTip = 'Specifies the value of the Old Unit Price field.', Comment = '%';
                }
            }
        }
    }
}
