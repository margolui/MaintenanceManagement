table 50102 "MM Maintenance Log"
{
    Caption = 'Maintenance Log';
    DataClassification = CustomerContent;
    DrillDownPageId = "Maintenance Log List";
    LookupPageID = "Maintenance Log List";

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
        field(4; Type; Enum "MM Maintenance Log Type")
        {
            Caption = 'Maintenance Type';
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
        field(7; "Employee No."; Code[20])
        {
            TableRelation = Employee."No.";
            DataClassification = CustomerContent;
        }
        field(8; "Status"; Enum "MM Maintenance Status")
        {
            DataClassification = CustomerContent;
        }
        field(9; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(10; "Duration (Hours)"; Decimal)
        {
            DataClassification = CustomerContent;
        }

        field(11; "Location Code"; Code[20])
        {
            TableRelation = Location.Code;
        }

        field(12; "Machine No."; Code[20])
        {
            TableRelation = "Fixed Asset"."No.";
        }
        field(13; "Vendor No."; Code[20])
        {
            TableRelation = Vendor."No.";
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(KeyVendorDate; "Vendor No.", "Date") { }
        key(KeyEmployeeDate; "Employee No.", "Date") { }
        key(KeyStatus; "Status") { }
    }
    trigger OnInsert()
    var
        Management: Codeunit "MM Management";
    begin
        "Entry No." := GetLastEntryNo() + 1;
        Management.BonusCalc(Rec);
    end;

    procedure GetLastEntryNo(): Integer;
    var
        FindRecordManagement: Codeunit "Find Record Management";
    begin
        exit(FindRecordManagement.GetLastEntryIntFieldValue(Rec, FieldNo("Entry No.")))
    end;
}
