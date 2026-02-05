table 50108 "MM Posted Maintenance Line"
{
    Caption = 'Posted Maintenance Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Document Type';
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(4; "Type"; Enum "MM Maintenance Log Type")
        {
            Caption = 'Type';
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(5; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(6; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
            Editable = false;
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(8; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
        }
        field(9; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
        }
        field(10; "Line Discount Amount"; Decimal)
        {
            Caption = 'Line Discount Amount';
        }
        field(11; "Work Hours"; Decimal)
        {
            Caption = 'Work Hours';
        }
        field(12; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
    }
    keys
    {
        key(PK; "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
