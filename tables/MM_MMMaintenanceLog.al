table 50102 "MM Maintenance Log"
{
    Caption = 'MM Maintenance Log';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Equipment No."; Code[20])
        {
            Caption = 'Equipment No.';
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(4; "Type"; Enum "Maintenance Log Type")
        {
            Caption = 'Type';
        }
        field(5; Cost; Decimal)
        {
            Caption = 'Cost';
        }
        field(6; Notes; Text[100])
        {
            Caption = 'Notes';
            DataClassification = CustomerContent;
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
