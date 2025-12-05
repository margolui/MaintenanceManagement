page 50103 "MM Maintenance Log List"
{
    ApplicationArea = All;
    Caption = 'Maintenance Log List';
    PageType = List;
    SourceTable = "MM Maintenance Log";
    UsageCategory = Lists;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ToolTip = 'Specifies the value of the Employee No. field.', Comment = '%';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("Equipment No."; Rec."Equipment No.")
                {
                    ToolTip = 'Specifies the value of the Equipment No. field.', Comment = '%';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                }
                field(Cost; Rec.Cost)
                {
                    ToolTip = 'Specifies the value of the Cost field.', Comment = '%';
                }
                field(Notes; Rec.Notes)
                {
                    ToolTip = 'Specifies the value of the Notes field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("Duration (Hours)"; Rec."Duration (Hours)")
                {
                    ToolTip = 'Specifies the value of the Duration (Hours) field.', Comment = '%';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.', Comment = '%';
                }
                field("Machine No."; Rec."Machine No.")
                {
                    ToolTip = 'Specifies the value of the Machine No. field.', Comment = '%';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Vendor No. field.', Comment = '%';
                }

            }
        }
    }
    actions
    {
        area(processing)
        {
            action(FilterByType)
            {
                Caption = 'Filter by Type';
                ApplicationArea = All;
                trigger OnAction()
                var
                    RecFilter: Record "MM Maintenance Log";
                    SelectedType: Enum "MM Maintenance Log Type";
                begin
                    // Тут показуємо Page для вибору Enum, наприклад
                    // І застосовуємо SetFilter до Record
                    RecFilter.SetFilter(Type, '%1', SelectedType.AsInteger());
                    Page.Run(Page::"MM Maintenance Log List", RecFilter);
                end;
            }
        }
    }
}
