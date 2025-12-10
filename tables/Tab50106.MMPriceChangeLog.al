table 50106 "MM Price Change Log"
{
    Caption = 'MM Price Change Log';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Old Unit Price"; Decimal)
        {
            Caption = 'Old Unit Price';
        }
        field(4; "New Unit Price"; Decimal)
        {
            Caption = 'New Unit Price';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
