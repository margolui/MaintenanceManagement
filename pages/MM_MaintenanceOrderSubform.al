page 50106 "MM Maintenance Order Subform"
{
    ApplicationArea = All;
    Caption = 'Maintenance Order Subform';
    PageType = ListPart;
    SourceTable = "MM Maintenance Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ToolTip = 'Specifies the value of the Line Amount field.', Comment = '%';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.', Comment = '%';
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    ToolTip = 'Specifies the value of the Line Discount Amount field.', Comment = '%';
                }
                field("Work Hours"; Rec."Work Hours")
                {
                    ToolTip = 'Specifies the value of the Work Hours field.', Comment = '%';
                }
            }
        }
    }
    procedure ForceTotalsCalculation()
    begin
        DocumentTotals.SalesDocTotalsNotUpToDate();
    end;

    var
        DocumentTotals: Codeunit "Document Totals";
}
