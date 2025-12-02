page 50100 "MM Equipment List"
{
    ApplicationArea = All;
    Caption = 'Equipment List';
    PageType = List;
    SourceTable = "MM Equipment";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("MM No."; Rec."MM No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("MM Description"; Rec."MM Description")
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("MM Serial No."; Rec."MM Serial No.")
                {
                    ToolTip = 'Specifies the value of the Serial No. field.', Comment = '%';
                }
                field("MM Location"; Rec."MM Location")
                {
                    ToolTip = 'Specifies the value of the Location field.', Comment = '%';
                }
                field("MM Next Service Date"; Rec."MM Next Service Date")
                {
                    ToolTip = 'Specifies the value of the Next Service Date field.', Comment = '%';
                }
                field("MM Status"; Rec."MM Status")
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        MmManagement: Codeunit "MM Management";
    begin
        MmManagement.TestSalesLineFilter();
    end;
}
