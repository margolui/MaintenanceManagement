table 50101 "MM Service Order"
{
    Caption = 'Service Order';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "MM No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "MM Equipment No."; Code[20])
        {
            Caption = 'Equipment No.';
        }
        field(3; "MM Date"; Date)
        {
            Caption = 'Date';
        }
        field(4; "MM Issue Description"; Text[100])
        {
            Caption = 'Issue Description';
        }
        field(5; "MM Technician"; Text[100])
        {
            Caption = 'Technician';
        }
        field(6; "MM Status"; Enum "MM Status")
        {
            Caption = 'Status';
        }
        field(7; "MM Before Photo"; Blob)
        {
            Caption = 'Before Photo';
        }
        field(8; "MM After Photo"; Blob)
        {
            Caption = 'After Photo';
        }
    }
    keys
    {
        key(PK; "MM No.")
        {
            Clustered = true;
        }
    }
}
