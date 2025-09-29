page 50101 "Import Exvcel"
{
    Caption = 'Import Excel';
    PageType = List;
    SourceTable = "So Import Buffer";
    UsageCategory = Administration;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("LineNO"; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Category Code field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Import Excel")
            {
                Caption = 'Import Excel';
                ApplicationArea = All;
                InFooterBar = true;
                Promoted = true;
                PromotedCategory = Process;
                Image = ImportExcel;

                trigger OnAction()
                var
                    ExcelBuffer: Record "Excel Buffer";
                    Item: Record "So Import Buffer";
                    InStream: InStream;
                    FileName: Text;
                    Row: Integer;
                    LastRow: Integer;
                begin
                    Item.DeleteAll();
                    if UploadIntoStream('Item Excel', '', 'Excel(.xlsx|*.xlsx)', FileName, InStream) then begin
                        ExcelBuffer.OpenBookStream(InStream, 'Sheet1');
                        ExcelBuffer.ReadSheet();
                        ExcelBuffer.SetRange("Column No.", 4);
                        ExcelBuffer.FindLast();
                        LastRow := ExcelBuffer."Row No.";
                        ExcelBuffer.Reset();
                        Message('Total Count %1', ExcelBuffer.Count);
                        end;
                    end;
            }

        }
    }
}
