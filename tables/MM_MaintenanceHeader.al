table 50104 "MM Maintenance Header"
{
    Caption = 'Maintenance Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Document Type';
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            var
                NoSeries: Codeunit "No. Series";
                SalesSetup: Record "Sales & Receivables Setup";
            begin
                if "No." <> xRec."No." then begin
                    SalesSetup.Get();
                    NoSeries.TestManual(MM_GetNoSeriesCode());
                    "No. Series" := '';
                end;
            end;
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
        field(7; "Creation Date"; Date)
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

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if Customer.Get("Sell-to Customer No.") then
                    Rec."Sell-to Customer Name" := Customer.Name
                else
                    Customer.Name := '';
                Rec."Posting Date" := Today;
                Rec."Due Date" := Today;
                Rec.Status := Rec.Status::Open;
            end;
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
    trigger OnInsert()
    var
        NoSeries: Codeunit "No. Series";
    begin
        InitInsert();
    end;

    procedure InitInsert()
    var
        NoSeries: Codeunit "No. Series";
        NoSeriesCode: Code[20];
        IsHandled: Boolean;
    begin
        if "No." = '' then begin
            NoSeriesCode := MM_GetNoSeriesCode();
            "No. Series" := NoSeriesCode;
            if NoSeries.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeries.GetNextNo("No. Series", "Posting Date");
        end;
    end;

    procedure MM_GetNoSeriesCode(): Code[20]
    var
        NoSeries: Codeunit "No. Series";
        NoSeriesCode: Code[20];
        IsHandled: Boolean;
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        SalesSetup.Get();

        case "Document Type" of
            "Document Type"::Quote:
                NoSeriesCode := SalesSetup."Quote Nos.";
            "Document Type"::Order:
                NoSeriesCode := SalesSetup."Order Nos.";
            "Document Type"::Invoice:
                NoSeriesCode := SalesSetup."Invoice Nos.";
            "Document Type"::"Return Order":
                NoSeriesCode := SalesSetup."Return Order Nos.";
            "Document Type"::"Credit Memo":
                NoSeriesCode := SalesSetup."Credit Memo Nos.";
        end;

        exit(NoSeriesCode);
    end;

}
