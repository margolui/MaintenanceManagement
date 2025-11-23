page 50103 "Maintenance Log List"
{
    ApplicationArea = All;
    Caption = 'Maintenance Log List';
    PageType = List;
    SourceTable = "MM Maintenance Log";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
                    Page.Run(Page::"Maintenance Log List", RecFilter);
                end;
            }
        }
    }
}
