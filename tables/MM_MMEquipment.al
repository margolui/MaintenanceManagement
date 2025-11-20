table 50100 "MM Equipment"
{
    Caption = 'MM Equipment';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "MM No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "MM Description"; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "MM Serial No."; Text[50])
        {
            Caption = 'Serial No.';
        }
        field(4; "MM Location"; Text[50])
        {
            Caption = 'Location';
        }
        field(5; "MM Next Service Date"; Date)
        {
            Caption = 'Next Service Date';
        }
        field(6; "MM Status"; Enum "MM Status")
        {
            Caption = 'Status';
        }
        field(7; "MM Photo"; Blob)
        {
            Caption = 'Photo';
            Subtype = Bitmap;
        }
        field(8; "MM Manual"; Blob)
        {
            Caption = 'Manual';
            // Subtype = 
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
