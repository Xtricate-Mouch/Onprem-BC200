pageextension 50102 DateExcelItemList extends "Item Card"
{
    procedure "Import Item Excel"()

    var
        ExcelBuffer: Record "Excel Buffer" temporary;
        InStr: InStream;
        FileName: Text;
        Row: Integer;
        LastRow: Integer;
    begin
        if not UploadIntoStream('Import Excel', '', 'Excel File (*.xlsx)|*.xlsx', FileName, InStr) then begin
            Error('No file was uploaded.');
            ExcelBuffer.OpenBookStream(InStr, 'Sheet1');
            ExcelBuffer.ReadSheet();
            Message('Total Count %1', ExcelBuffer.Count);

        end;

    end;
}
