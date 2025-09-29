codeunit 50100 "Export Data To Excel"
{
    procedure ExportToExcel()
    var
        ItemRec: Record Item;
        ExcelBuf: Record "Excel Buffer";
        FileName: Text;
    begin
        // Clear previous buffer data
        ExcelBuf.DeleteAll();

        // Add column headers
        ExcelBuf.NewRow();
        ExcelBuf.AddColumn('No.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Description', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(' Item Category Code', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);


        // Add item rows
        if ItemRec.FindSet() then
            repeat
                ExcelBuf.NewRow();
                ExcelBuf.AddColumn(ItemRec."No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(ItemRec.Description, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn(ItemRec."Item Category Code", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
            until ItemRec.Next() = 0;

        // Create Excel file
        ExcelBuf.CreateNewBook('Item List');
        ExcelBuf.WriteSheet('Items', CompanyName, UserId);
        ExcelBuf.CloseBook();

        // Download Excel
        FileName := 'ItemList.xlsx';
        ExcelBuf.SetFriendlyFilename(FileName); // Optional, sets the download name
        ExcelBuf.OpenExcel();
    end;

    procedure ImportItemsFromExcel()
    var
        ExcelBuffer: Record "Excel Buffer";
        InStream: InStream;
        FileName: Text;
        SheetName: Text;
        CurrentRow: Integer;
    begin
        if UploadIntoStream('Import Excel', '', 'Excel File (*.xlsx)|*.xlsx', FileName, InStream) then begin
            SheetName := ExcelBuffer.SelectSheetsNameStream(InStream);
            ExcelBuffer.OpenBookStream(InStream, SheetName);
            ExcelBuffer.ReadSheet();
            Message('Imported %1 rows,%2 Column', ExcelBuffer."Row No.", ExcelBuffer."Column No.");
        end else
            Error('No file was uploaded.');
    end;

}
