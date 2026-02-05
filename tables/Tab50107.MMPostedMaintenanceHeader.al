table 50107 "MM Posted Maintenance Header"
{
    Caption = 'Posted Maintenance Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Document Type';
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(3; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee."No.";
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(5; Status; Enum "MM Maintenance Document Status")
        {
            Caption = 'Status';
        }
        field(6; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            FieldClass = FlowField;
            CalcFormula = sum("MM Maintenance Line"."Line Amount" where("Document No." = field("No.")));
        }
        field(7; "Order Date"; Date)
        {
            Caption = 'Order Date';
        }
        field(8; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(9; "Assigned Technician"; Text[100])
        {
            Caption = 'Assigned Technician';
        }
        field(10; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            ToolTip = 'Specifies the date when the posting of the sales document will be recorded.';
        }
        field(11; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
            ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
        }
        field(12; "Posting Description"; Text[100])
        {
            Caption = 'Posting Description';
            ToolTip = 'Specifies additional posting information for the document. After you post the document, the description can add detail to vendor and customer ledger entries.';
        }
        field(13; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            ToolTip = 'Specifies the number of the customer that you''re selling to. By default, the same customer is suggested as the ship-to customer. If needed, you can specify a different ship-to customer on the document.';
            TableRelation = Customer;
        }
        field(14; "Sell-to Customer Name"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            ToolTip = 'Specifies the name of the customer that you''re selling to. By default, the same customer is suggested as the ship-to customer. If needed, you can specify a different ship-to customer on the document.';
            TableRelation = Customer.Name;
        }
        field(15; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(16; "Bill-to Contact"; Text[100])
        {
            Caption = 'Bill-to Contact';
            ToolTip = 'Specifies the name of the contact person at the customer''s billing address.';
        }

    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
