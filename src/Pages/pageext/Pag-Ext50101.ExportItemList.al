pageextension 50101 "Export Item List" extends "Item List"
{

    actions
    {
        addfirst(processing)
        {
            action(export)
            {
                Caption = 'Export Data';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = ExportFile;

                trigger OnAction()
                var
                    export: Codeunit "Export Data To Excel";
                begin
                    export.ExportToExcel();
                end;
            }
        }
    }
}
