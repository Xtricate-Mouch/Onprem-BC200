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
}
