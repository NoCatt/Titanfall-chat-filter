global function NeinguarChatFilter_Init

array<string> Banned_words = split(GetConVarString("words"), ",")
bool shouldBlock = GetConVarBool("Block")
bool shouldInform = GetConVarBool("ShouldInformPlayer")
string ResponseOnBlock = GetConVarString("ResponseOnBlock")
bool ShouldShamePlayer = GetConVarBool("ShouldShameUnfriendlyPlayers")
string ShameMessage = GetConVarString("MessageToShamePlayer")
string ResponseOnReplace = GetConVatString("ResponseOnReplace")

void function NeinguarChatFilter_Init() {
    AddCallback_OnReceivedSayTextMessage(MyChatFilter)
}

ClClient_MessageStruct function MyChatFilter(ClClient_MessageStruct message) {
    for(string word in Banned_words)
    {
        //Please have the words start with the fist letter capitalized in the convar
        if(message.message.find(word)==null||message.message.find(word.toupper())==null||message.message.find(word.tolower())==null)
        {
            return message
        }
        if(shouldBlock){
            message.shouldBlock = true
            if(shouldInform){
                Chat_ServerPrivateMessage(message.player , ResponseOnBlock , false)
            }
            if(ShouldShamePlayer){
                Chat_Impersonate(message.player,ShameMessage)
            }
            return message
        } else{
            StringReplace(message.message , word , GetAmoutOfStars(word) , true,true)
            StringReplace(message.message , word.toupper() , GetAmoutOfStars(word) , true,true)
            StringReplace(message.message , word.tolower() , GetAmoutOfStars(word) , true,true)

            if(shouldInform){
                Chat_ServerPrivateMessage(message.player ,ResponseOnReplace  , false)
            }
            if(ShouldShamePlayer){
                Chat_Impersonate(message.player,ShameMessage)
            }
            return message
        }
    return message
    }
}

string function GetAmoutOfStars(string word) {
    string reply = ""
    for (int a; a < word.len() ; a++ ) {
     reply + "*"
    }
    return reply
}