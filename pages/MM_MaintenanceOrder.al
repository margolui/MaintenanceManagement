page 50105 "MM Maintenance List"
{
    ApplicationArea = Basic, Suite, Assembly;
    Caption = 'Maintenance Orders';
    CardPageID = "MM Maintenance Order";
    PageType = List;
    Editable = false;
    SourceTable = "MM Maintenance Header";
    UsageCategory = Lists;

    AboutTitle = 'About maintenance orders';
    AboutText = 'Use a maintenance order when you partially ship or invoice an order, and when you use drop shipments or prepayments. For sales that are fully shipped and invoiced in one go, sales invoices are typically used instead.';

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ToolTip = 'Specifies the value of the Employee No. field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ToolTip = 'Specifies the value of the Posting Description field.', Comment = '%';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ToolTip = 'Specifies the value of the Due Date field.', Comment = '%';
                }
                field("Assigned Technician"; Rec."Assigned Technician")
                {
                    ToolTip = 'Specifies the value of the Assigned Technician field.', Comment = '%';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ToolTip = 'Specifies the value of the Order Date field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ToolTip = 'Specifies the value of the Shipment Date field.', Comment = '%';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.', Comment = '%';
                }
            }
        }
        area(FactBoxes)
        {
            part(Lines; "MM Maintenance Order Subform")
            {
                ApplicationArea = All;
                SubPageLink =
                "Document Type" = FIELD("Document Type"),
                "Document No." = FIELD("No.");
            }
        }
    }
}
