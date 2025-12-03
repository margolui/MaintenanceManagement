table 50103 "MM Employee Bonus Log"
{
    Caption = 'MM Employee Bonus Log';
    DataClassification = CustomerContent;
    LookupPageId = "MM Employee Bonus Log List";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            DataClassification = CustomerContent;
            TableRelation = Employee."No.";
        }
        field(3; "Maintenance Entry No."; Integer)
        {
            Caption = 'Maintenance Entry No.';
            DataClassification = CustomerContent;
        }
        field(4; "Bonus Amount"; Decimal)
        {
            Caption = 'Bonus Amount';
            DataClassification = CustomerContent;
        }
        field(5; "Bonus Reason"; Text[100])
        {
            Caption = 'Bonus Reason (Maintenance Type / Extra 10%)';
            DataClassification = CustomerContent;
        }
        field(6; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(7; "Created At"; DateTime)
        {
            Caption = 'Created At';
            DataClassification = CustomerContent;
            TableRelation = User."User Security ID";
        }
        field(8; "Created By"; Code[20])
        {
            Caption = 'Created By';
            DataClassification = CustomerContent;
        }
        field(9; "Maintenance ID"; Integer)
        {
            Caption = 'Maintenance ID';
            TableRelation = "MM Maintenance Log"."Entry No.";
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        Management: Codeunit "MM Management";

    begin
        //Management.BonusCalc(Rec);
        "Entry No." := GetLastEntryNo() + 1;
    end;

    procedure GetLastEntryNo(): Integer;
    var
        FindRecordManagement: Codeunit "Find Record Management";
    begin
        exit(FindRecordManagement.GetLastEntryIntFieldValue(Rec, FieldNo("Entry No.")))
    end;
}
