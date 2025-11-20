page 50102 "Service Order Card"
{
    ApplicationArea = All;
    Caption = 'Service Order Card';
    PageType = Card;
    SourceTable = "MM Service Order";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("MM No."; Rec."MM No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("MM Equipment No."; Rec."MM Equipment No.")
                {
                    ToolTip = 'Specifies the value of the Equipment No. field.', Comment = '%';
                }
                field("MM Date"; Rec."MM Date")
                {
                    ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                }
                field("MM Issue Description"; Rec."MM Issue Description")
                {
                    ToolTip = 'Specifies the value of the Issue Description field.', Comment = '%';
                }
                field("MM Technician"; Rec."MM Technician")
                {
                    ToolTip = 'Specifies the value of the Technician field.', Comment = '%';
                }
                field("MM Status"; Rec."MM Status")
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("MM Before Photo"; Rec."MM Before Photo")
                {
                    ToolTip = 'Specifies the value of the Before Photo field.', Comment = '%';
                }
                field("MM After Photo"; Rec."MM After Photo")
                {
                    ToolTip = 'Specifies the value of the After Photo field.', Comment = '%';
                }
            }
        }
    }
}
