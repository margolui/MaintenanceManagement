page 50101 "MM Equipment Card"
{
    ApplicationArea = All;
    Caption = 'Equipment Card';
    PageType = Card;
    SourceTable = "MM Equipment";

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
                //Actions / Buttons: 
                //плюс можливість змінювати Status
                //Create Service Order → відкриває Service Order Card
                //Upload Photo → BLOB Upload
                //Open Manual → BLOB Download
            }
        }
    }
}
