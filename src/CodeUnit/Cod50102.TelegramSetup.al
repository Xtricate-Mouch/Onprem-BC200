codeunit 50102 TelegramSetup
{
    procedure SendTelegramMessage(var BotSetup: Record "Telegram Setup")
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        Content: HttpContent;
        Headers: HttpHeaders;
        Url: Text;
        JsonObj: JsonObject;
        JsonText: Text;
    begin
        Url := StrSubstNo('https://api.telegram.org/bot%1/sendMessage', BotSetup.Token);

        // Build JSON safely
        JsonObj.Add('chat_id', BotSetup."Bot ID");
        JsonObj.Add('text', BotSetup.Message);

        JsonObj.WriteTo(JsonText);

        Content.WriteFrom(JsonText);
        Content.GetHeaders(Headers);
        Headers.Remove('Content-Type'); // remove default
        Headers.Add('Content-Type', 'application/json');

        if Client.Post(Url, Content, Response) then begin
            if Response.IsSuccessStatusCode() then
                Message('Message sent successfully!')
            else begin
                Response.Content.ReadAs(JsonText);
                Error('Error: %1 - %2', Response.HttpStatusCode, JsonText);
            end;
        end else
            Error('HTTP request failed.');
    end;


}
